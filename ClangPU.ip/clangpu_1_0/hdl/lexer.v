module lexer
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- 入出力 ----- */
        input wire          I_VALID,
        input wire  [7:0]   I_DATA,
        output wire         O_VALID,
        output reg  [15:0]  O_DATA
    );

    /* ----- 1. 空白文字消去 ----- */
    reg [7:0] str_8x8 [0:7];

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
        end
        else if(I_VALID) begin
            if (
                I_DATA == 8'h00 || I_DATA == 8'hff ||                   // EOF
                I_DATA == 8'h09 || I_DATA == 8'h0a || I_DATA == 8'h20   // ' ', '\n', '\t'
            ) begin
                str_64_valid <= 1'b1;
                str_64 <= {
                    str_8x8[7][7:0], str_8x8[6][7:0], str_8x8[5][7:0], str_8x8[4][7:0],
                    str_8x8[3][7:0], str_8x8[2][7:0], str_8x8[1][7:0], str_8x8[0][7:0]
                };
            end
            else begin
                str_64_valid <= 1'b0;
                str_8x8[7] <= str_8x8[6];
                str_8x8[6] <= str_8x8[5];
                str_8x8[5] <= str_8x8[4];
                str_8x8[4] <= str_8x8[3];
                str_8x8[3] <= str_8x8[2];
                str_8x8[2] <= str_8x8[1];
                str_8x8[1] <= str_8x8[0];
                str_8x8[0] <= I_DATA;
            end
        end
    end

    /* ----- 2. 文字列比較 ----- */
    reg         str_64_valid;
    reg [63:0]  str_64;

    parameter CHAR      = 8'd1;
    parameter FOR       = 8'd2;
    parameter WHILE     = 8'd3;

    assign O_VALID = O_DATA != 16'b0;

    always @ (posedge CLK) begin
        if (RST) begin
            str_64_valid <= 1'b0;
            str_64 <= 64'b0;
            O_DATA <= 1'b0;
        end
        else if (str_64_valid && O_DATA == 16'b0)
            casex (str_64)
                64'hxx_xx_xx_xx_63_68_61_72: O_DATA <= { CHAR, 8'b0 };     // "char"
                64'hxx_xx_xx_xx_xx_66_6f_72: O_DATA <= { FOR, 8'b0 };      // "for"
                64'hxx_xx_xx_77_68_69_6c_65: O_DATA <= { WHILE, 8'b0 };    // "while"
                default:                     O_DATA <= 16'b0;              // Unknown Token
            endcase
        else
            O_DATA <= 16'b0;
    end
    
endmodule
