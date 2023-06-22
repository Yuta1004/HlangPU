module parser
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- 制御 ----- */
        output reg          RECEIVE,
        output wire [2:0]   STAT,

        /* ----- 入出力 ----- */
        input wire          I_VALID,
        input wire  [15:0]  I_TOKEN,
        output reg          O_VALID,
        output reg  [15:0]  O_SHIFT,
        output reg  [15:0]  O_REDUCE
    );

    function [9:0] idx_64x16;
        input [7:0] row;
        input [7:0] col;
        idx_64x16 = { row[5:0], 4'b0 } + { 2'b0, col[7:0] };
    endfunction

    /* ----- LR表 ----- */
    parameter ERROR     = 2'h0;
    parameter SHIFT     = 2'h1;
    parameter REDUCE    = 2'h2;
    parameter ACCEPT    = 2'h3;

    reg [9:0]   action_table [0:64*16-1];   // max : 64(States) x 16(Tokens)
    reg [7:0]   reduce_table [0:16*1-1];    // max : 16(Rules)
    reg [7:0]   goto_table   [0:64*16-1];   // max : 64(States) x 16(Rules(+3))

    wire [1:0]  action  = action_table[idx_64x16(top_data, I_TOKEN[15:8])][9:8];
    wire [7:0]  avalue  = action_table[idx_64x16(top_data, I_TOKEN[15:8])][7:0];

    always @ (posedge CLK) begin
        if (RST) begin
            `include "init_tables.vh"
        end
    end

    /* ----- 解析ステートマシン ----- */
    parameter S_WAIT    = 3'b000;
    parameter S_MOVE    = 3'b001;
    parameter S_SHIFT   = 3'b011;
    parameter S_REDUCE  = 3'b010;
    parameter S_ACCEPT  = 3'b110;
    parameter S_ERROR   = 3'b111;

    reg  [2:0]  state, next_state;

    assign STAT = {
        !state[2],          // wait
        state == S_ACCEPT,  // accept
        state == S_ERROR    // error
    };

    always @ (posedge CLK) begin
        if (RST)
            state <= S_WAIT;
        else
            state <= next_state;
    end

    always @* begin
        case (state)
            S_WAIT:
                if (I_VALID)
                    next_state <= S_MOVE;
                else
                    next_state <= S_WAIT;

            S_MOVE:
                case (action)
                    ERROR:  next_state <= S_ERROR;
                    SHIFT:  next_state <= S_SHIFT;
                    REDUCE: next_state <= S_REDUCE;
                    ACCEPT: next_state <= S_ACCEPT;
                endcase

            S_SHIFT:
                next_state <= S_WAIT;

            S_REDUCE:
                if (reduce_pop_nums == 8'b0)
                    next_state <= S_MOVE;
                else
                    next_state <= S_REDUCE;

            S_ACCEPT:
                next_state <= S_ACCEPT;

            S_ERROR:
                next_state <= S_ERROR;

            default:
                next_state <= S_WAIT;
        endcase
    end

    /* ----- 制御&入出力信号 ----- */
    always @ (posedge CLK) begin
        if (RST)
            RECEIVE <= 1'b0;
        else if (state == S_MOVE && next_state != S_REDUCE)
            RECEIVE <= 1'b1;
        else
            RECEIVE <= 1'b0;
    end

    always @ (posedge CLK) begin
        if (RST) begin
            O_VALID <= 1'b0;
            O_SHIFT <= 16'b0;
            O_REDUCE <= 16'b0;
        end
        else if (state == S_SHIFT) begin
            O_VALID <= 1'b1;
            O_SHIFT <= I_TOKEN;
        end
        else if (state == S_REDUCE && next_state == S_MOVE) begin
            O_VALID <= 1'b1;
            O_REDUCE <= reduce_memo;
        end
        else begin
            O_VALID <= 1'b0;
            O_SHIFT <= 16'b0;
            O_REDUCE <= 16'b0;
        end
    end

    /* ----- Shift & Reduce ----- */
    reg         push_en, pop_en;
    reg  [7:0]  push_data;
    wire [7:0]  top_data;

    reg  [7:0]  reduce_memo;
    reg  [7:0]  reduce_pop_nums;

    always @ (posedge CLK) begin
        if (RST) begin
            push_en <= 1'b0;
            push_data <= 8'b0;
            pop_en <= 1'b0;
        end

        // Shift処理
        else if (state == S_MOVE && next_state == S_SHIFT) begin
            push_en <= 1'b1;
            push_data <= avalue;
        end
        else if (state == S_SHIFT)
            push_en <= 1'b0;

        // Reduce処理
        else if (state == S_MOVE && next_state == S_REDUCE) begin
            reduce_memo <= avalue;
            reduce_pop_nums <= reduce_table[avalue] + 8'd1;
        end
        else if (state == S_REDUCE) begin
            if (reduce_pop_nums > 8'd1) begin
                pop_en <= 1'b1;
                reduce_pop_nums <= reduce_pop_nums - 8'b1;
            end
            else if (reduce_pop_nums == 8'd1) begin
                pop_en <= 1'b0;
                push_en <= 1'b1;
                push_data <= goto_table[idx_64x16(top_data, reduce_memo)];
                reduce_pop_nums <= reduce_pop_nums - 8'b1;
            end
            else if (reduce_pop_nums == 8'd0)
                push_en <= 1'b0;
        end
    end

    lifo_8in_8out_1024 lifo (
        // クロック&リセット
        .CLK    (CLK),
        .RST    (RST),

        // メモリアクセス用信号
        // .FULL   (),
        // .EMPTY  (),
        .I_VALID    (push_en),
        .I_DATA     (push_data),
        .O_EN       (pop_en),
        .TOP_DATA   (top_data)
        // .O_VALID(),
        // .O_DATA ()
    );

endmodule
