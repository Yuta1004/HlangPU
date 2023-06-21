module parser
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- 制御 ----- */
        output reg          RECEIVE,

        /* ----- 入出力 ----- */
        input wire          I_VALID,
        input wire  [15:0]  I_TOKEN,
        output reg          O_VALID,
        output reg  [15:0]  O_RULE
    );

    function [4:0] idx_8x4;
        input [7:0] row;
        input [7:0] col;
        idx_8x4 = ({ 2'b0, row[2:0] } << 2) + { 3'b0, col[1:0] };
    endfunction

    /* ----- LR表 ----- */
    parameter ERROR     = 2'h0;
    parameter SHIFT     = 2'h1;
    parameter REDUCE    = 2'h2;
    parameter ACCEPT    = 2'h3;

    reg [9:0]   action_table [0:8*4-1]; // 8(States) x 4(Tokens)
    reg [7:0]   reduce_table [0:4*1-1]; // 4(Rules)
    reg [7:0]   goto_table   [0:8*4-1]; // 8(States) x 4(Rules)

    wire [1:0]  action  = action_table[idx_8x4(top_data, I_TOKEN[15:8])][9:8];
    wire [7:0]  avalue  = action_table[idx_8x4(top_data, I_TOKEN[15:8])][7:0];

    always @ (posedge CLK) begin
        if (RST) begin
            action_table[ 0] <= 10'h1_03; action_table[ 1] <= 10'h0_00; action_table[ 2] <= 10'h0_00; action_table[ 3] <= 10'h0_00;
            action_table[ 4] <= 10'h0_00; action_table[ 5] <= 10'h1_04; action_table[ 6] <= 10'h0_00; action_table[ 7] <= 10'h3_00;
            action_table[ 8] <= 10'h0_00; action_table[ 9] <= 10'h2_01; action_table[10] <= 10'h1_05; action_table[11] <= 10'h2_01;
            action_table[12] <= 10'h0_00; action_table[13] <= 10'h2_03; action_table[14] <= 10'h2_03; action_table[15] <= 10'h2_03;
            action_table[16] <= 10'h1_03; action_table[17] <= 10'h0_00; action_table[18] <= 10'h0_00; action_table[19] <= 10'h0_00;
            action_table[20] <= 10'h1_07; action_table[21] <= 10'h0_00; action_table[22] <= 10'h0_00; action_table[23] <= 10'h0_00;
            action_table[24] <= 10'h0_00; action_table[25] <= 10'h2_00; action_table[26] <= 10'h1_05; action_table[27] <= 10'h2_00;
            action_table[28] <= 10'h0_00; action_table[29] <= 10'h2_02; action_table[30] <= 10'h2_02; action_table[31] <= 10'h2_02;

            reduce_table[0] <= 8'h03; reduce_table[1] <= 8'h01; reduce_table[2] <= 8'h03; reduce_table[3] <= 8'h01;

            goto_table[ 0] <= 8'h01; goto_table[ 1] <= 8'h01; goto_table[ 2] <= 8'h02; goto_table[ 3] <= 8'h02;
            goto_table[ 4] <= 8'h00; goto_table[ 5] <= 8'h00; goto_table[ 6] <= 8'h00; goto_table[ 7] <= 8'h00;
            goto_table[ 8] <= 8'h00; goto_table[ 9] <= 8'h00; goto_table[10] <= 8'h00; goto_table[11] <= 8'h00;
            goto_table[12] <= 8'h00; goto_table[13] <= 8'h00; goto_table[14] <= 8'h00; goto_table[15] <= 8'h00;
            goto_table[16] <= 8'h00; goto_table[17] <= 8'h00; goto_table[18] <= 8'h06; goto_table[19] <= 8'h06;
            goto_table[20] <= 8'h00; goto_table[21] <= 8'h00; goto_table[22] <= 8'h00; goto_table[23] <= 8'h00;
            goto_table[24] <= 8'h00; goto_table[25] <= 8'h00; goto_table[26] <= 8'h00; goto_table[27] <= 8'h00;
            goto_table[28] <= 8'h00; goto_table[29] <= 8'h00; goto_table[30] <= 8'h00; goto_table[31] <= 8'h00;
        end
    end

    /* ----- 解析ステートマシン ----- */
    parameter S_WAIT    = 3'b000;
    parameter S_MOVE    = 3'b001;
    parameter S_SHIFT   = 3'b011;
    parameter S_REDUCE  = 3'b010;
    parameter S_ACCEPT  = 3'b110;
    parameter S_ERROR   = 3'b111;

    reg  [3:0]  state, next_state; 

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
            O_RULE <= 16'b0;
        end
        else if (state == S_REDUCE && next_state == S_MOVE) begin
            O_VALID <= 1'b1;
            O_RULE <= reduce_memo;
        end
        else begin
            O_VALID <= 1'b0;
            O_RULE <= 1'b0;
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
            if (reduce_pop_nums > 8'b1) begin
                pop_en <= 1'b1;
                reduce_pop_nums <= reduce_pop_nums - 8'b1;
            end
            else if (reduce_pop_nums == 8'b1) begin
                pop_en <= 1'b0;
                push_en <= 1'b1;
                push_data <= goto_table[idx_8x4(top_data, reduce_memo)];
                reduce_pop_nums <= reduce_pop_nums - 8'b1;
            end
            else if (reduce_pop_nums == 8'b0)
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
