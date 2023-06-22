module exec
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- 制御用 ----- */
        output reg          RECEIVE,

        /* ----- 入出力 ----- */
        input wire          I_VALID,
        input wire [15:0]   I_SHIFT,
        input wire [15:0]   I_REDUCE,
        output reg [7:0]    O_RESULT
    );

    /* ----- 受信通知 ----- */
    always @* begin
        if (I_VALID)
            if (I_SHIFT != 16'b0)
                RECEIVE = 1'b1;
            else
                RECEIVE = state == S_EXEC;
        else
            RECEIVE = 1'b0;
    end

    /* ----- 実行用スタック ----- */
    reg         vlifo_pop_en, vlifo_push_en;
    reg  [7:0]  vlifo_push_data;
    wire [7:0]  vlifo_pop_data;

    always @* begin
        if (I_VALID && I_SHIFT != 16'b0) begin
            vlifo_push_en <= I_SHIFT[15:8] == 8'h02 || I_SHIFT[15:8] == 8'h0b;
            if (I_SHIFT[15:8] == 8'h02)
                vlifo_push_data <= I_SHIFT[7:0] - 8'h60;
            else
                vlifo_push_data <= I_SHIFT[7:0];
        end
        else begin
            vlifo_push_en <= push_exec_res;
            vlifo_push_data <= exec_res;
        end
    end

    lifo_8in_8out_1024 value_lifo (
        // クロック&リセット
        .CLK    (CLK),
        .RST    (RST),

        // メモリアクセス用信号
        // .FULL    (),
        // .EMPTY   (),
        .I_VALID    (vlifo_push_en),
        .I_DATA     (vlifo_push_data),
        .O_EN       (vlifo_pop_en),
        .O_DATA     (vlifo_pop_data)
        // .TOP_DATA(),
        // .O_VALID (),
        // .O_DATA  ()
    );

    /* ----- 実行用テーブル ----- */
    reg [7:0] popnums_table [0:16];

    always @ (posedge CLK) begin
        if (RST) begin
            popnums_table[ 0] <= 8'd0;
            popnums_table[ 1] <= 8'd0;
            popnums_table[ 2] <= 8'd1;
            popnums_table[ 3] <= 8'd1;
            popnums_table[ 4] <= 8'd2;
            popnums_table[ 5] <= 8'd3;
            popnums_table[ 6] <= 8'd2;
            popnums_table[ 7] <= 8'd2;
            popnums_table[ 8] <= 8'd1;
            popnums_table[ 9] <= 8'd2;
            popnums_table[10] <= 8'd2;
            popnums_table[11] <= 8'd1;
            popnums_table[12] <= 8'd1;
            popnums_table[13] <= 8'd1;
            popnums_table[14] <= 8'd1;
            popnums_table[15] <= 8'd0;
        end
    end

    /* ----- 実行用ステートマシン ----- */
    parameter S_READY = 2'b00;
    parameter S_VPOP  = 2'b01;
    parameter S_EXEC  = 2'b11;

    reg [1:0]   state, next_state;

    reg [7:0]   pop_nums;
    reg [7:0]   poped_values    [0:7];

    reg         push_exec_res;
    reg [7:0]   exec_res;
    reg [7:0]   registers       [0:15];

    always @ (posedge CLK) begin
        if (RST)
            state <= S_READY;
        else
            state <= next_state;
    end

    always @* begin
        case (state)
            S_READY:
                if (I_VALID && I_REDUCE != 16'b0)
                    next_state <= S_VPOP;
                else
                    next_state <= S_READY;

            S_VPOP:
                if (pop_nums == 8'b0)
                    next_state <= S_EXEC;
                else
                    next_state <= S_VPOP;

            S_EXEC:
                next_state <= S_READY;

            default:
                next_state <= S_READY;
        endcase
    end;

    always @ (posedge CLK) begin
        if (RST) begin
            vlifo_pop_en <= 1'b0;
            pop_nums <= 8'b0;
        end
        else if (state == S_READY && next_state == S_VPOP) begin
            vlifo_pop_en <= popnums_table[I_REDUCE] > 8'd0;
            pop_nums <= popnums_table[I_REDUCE];
        end
        else if (state == S_VPOP && pop_nums > 8'd0) begin
            vlifo_pop_en <= pop_nums > 8'd1;
            pop_nums <= pop_nums - 8'd1;
            poped_values[pop_nums-8'd1] <= vlifo_pop_data;
        end
    end

    always @ (posedge CLK) begin
        if (RST) begin
            O_RESULT <= 8'b0;
            push_exec_res <= 1'b0;
            exec_res <= 8'b0;
            registers[ 0] <= 8'b0;
            registers[ 1] <= 8'b0;
            registers[ 2] <= 8'b0;
            registers[ 3] <= 8'b0;
            registers[ 4] <= 8'b0;
            registers[ 5] <= 8'b0;
            registers[ 6] <= 8'b0;
            registers[ 7] <= 8'b0;
            registers[ 8] <= 8'b0;
            registers[ 9] <= 8'b0;
            registers[10] <= 8'b0;
            registers[11] <= 8'b0;
            registers[12] <= 8'b0;
            registers[13] <= 8'b0;
            registers[14] <= 8'b0;
            registers[15] <= 8'b0;
        end
        else if (state == S_EXEC)
            case (I_REDUCE)
                // ( 0) PROGRAM -> STMT PROGRAM
                8'd0: ;

                // ( 1) PROGRAM -> ''
                8'd1: ;

                // ( 2) STMT -> EXPR ;
                8'd2: ;

                // ( 3) STMT -> out EXPR ;
                8'd3:
                    O_RESULT <= poped_values[0];

                // ( 4) STMT -> var = EXPR ;
                8'd4:
                    registers[poped_values[0][3:0]] <= poped_values[1];

                // ( 5) STMT -> var = EXPR if ( EXPR ) ;
                8'd5:
                    if (poped_values[2] != 8'b0)
                        registers[poped_values[0][3:0]] <= poped_values[1];

                // ( 6) EXPR -> EXPR << TERM
                8'd6: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0] << poped_values[1];
                end

                // ( 7) EXPR -> EXPR >> TERM
                8'd7: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0] >> poped_values[1];
                end

                // ( 8) EXPR -> TERM
                8'd8: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0];
                end

                // ( 9) TERM -> TERM + FACT
                8'd9: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0] + poped_values[1];
                end

                // (10) TERM -> TERM - FACT
                8'd10: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0] - poped_values[1];
                end

                // (11) TERM -> FACT
                8'd11: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0];
                end

                // (12) FACT -> num
                8'd12: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0];
                end

                // (13) FACT -> var
                8'd13: begin
                    push_exec_res <= 1'b1;
                    exec_res <= registers[poped_values[0][3:0]];
                end

                // (14) FACT -> ( EXPR )
                8'd14: begin
                    push_exec_res <= 1'b1;
                    exec_res <= poped_values[0];
                end
            endcase
        else
            push_exec_res <= 1'b0;
    end

endmodule
