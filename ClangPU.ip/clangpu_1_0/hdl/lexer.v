module lexer
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- 制御用 ----- */
        output reg          FOUND_EOF,

        /* ----- 入出力 ----- */
        input wire          I_VALID,
        input wire  [7:0]   I_DATA,
        output reg          O_VALID,
        output reg  [15:0]  O_DATA
    );

    function [7:0] x10add;
        input [7:0] a;
        input [7:0] b;
        if (a != 8'hff && b >= 8'h30 && b <= 8'h39)
            x10add = (a << 3) + (a << 1) + (b - 8'h30);
        else
            x10add = 8'hff;
    endfunction

    /* ----- 1. 空白文字消去 ----- */
    reg [7:0]   str_8x8 [0:7];
    reg [63:0]  str_64;
    reg [7:0]   num_8   [0:1];

    always @ (posedge CLK) begin
        if (RST) begin
            str_8x8[7] <= 8'b0;
            str_8x8[6] <= 8'b0;
            str_8x8[5] <= 8'b0;
            str_8x8[4] <= 8'b0;
            str_8x8[3] <= 8'b0;
            str_8x8[2] <= 8'b0;
            str_8x8[1] <= 8'b0;
            str_8x8[0] <= 8'b0;
            str_64 <= 64'b0;
            num_8[1] <= 8'b0;
            num_8[0] <= 8'b0;
        end
        else if(I_VALID) begin
            if (
                I_DATA == 8'h00 || I_DATA == 8'hff ||                   // EOF
                I_DATA == 8'h09 || I_DATA == 8'h0a || I_DATA == 8'h20   // ' ', '\n', '\t'
            ) begin
                str_64 <= {
                    str_8x8[7][7:0], str_8x8[6][7:0], str_8x8[5][7:0], str_8x8[4][7:0],
                    str_8x8[3][7:0], str_8x8[2][7:0], str_8x8[1][7:0], str_8x8[0][7:0]
                };
                num_8[1] <= num_8[0] == 8'hff ? 8'b0 : num_8[0];
                num_8[0] <= 8'b0;
            end
            else begin
                str_64 <= 64'b0;
                str_8x8[7] <= str_8x8[6];
                str_8x8[6] <= str_8x8[5];
                str_8x8[5] <= str_8x8[4];
                str_8x8[4] <= str_8x8[3];
                str_8x8[3] <= str_8x8[2];
                str_8x8[2] <= str_8x8[1];
                str_8x8[1] <= str_8x8[0];
                str_8x8[0] <= I_DATA;
                num_8[0] <= x10add(num_8[0], I_DATA);
            end
        end
    end

    /* ----- 2. 文字列比較 ----- */
    parameter NUM       = 8'h00;
    parameter PLUS      = 8'h01;
    parameter MINUS     = 8'h02;
    parameter EOF       = 8'h03;

    reg [63:0] o_data_ready;

    always @* begin
        casex (str_64)
            64'hxx_xx_xx_xx_xx_xx_xx_2b: o_data_ready <= { PLUS, 8'b0 };    // '+'
            64'hxx_xx_xx_xx_xx_xx_xx_2d: o_data_ready <= { MINUS, 8'b0 };   // '+'
            64'hxx_xx_xx_xx_xx_45_4f_46: o_data_ready <= { EOF, 8'b0 };     // ';'
            default:                     o_data_ready <= { NUM, num_8[1] }; // Unknown Tag or NUM
        endcase
    end

    always @ (posedge CLK) begin
        if (RST) begin
            FOUND_EOF <= 1'b0;
            O_VALID <= 1'b0;
            O_DATA <= 64'b0;
        end
        else begin
            FOUND_EOF <= FOUND_EOF | o_data_ready[15:8] == EOF;
            O_VALID <= (o_data_ready != 64'b0) && (o_data_ready != O_DATA);
            O_DATA <= o_data_ready;
        end
    end
    
endmodule
