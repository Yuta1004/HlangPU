module lifo_8in_8out_1024
    (
        /* ----- クロック&リセット ----- */
        input wire CLK,
        input wire RST,

        /* ----- メモリアクセス用信号 ----- */
        // 制御用
        output wire         FULL,
        output wire         EMPTY,

        // 入出力
        input wire          I_VALID,
        input wire  [7:0]   I_DATA,
        input wire          O_EN,
        output reg          O_VALID,
        output reg  [7:0]   O_DATA,
        output wire [7:0]   TOP_DATA
    );

    reg [9:0]   sp;
    reg [7:0]   mem [0:1023];

    assign FULL     = sp == 10'h3ff;
    assign EMPTY    = sp == 10'b1;

    assign TOP_DATA = (I_VALID && !FULL) ? I_DATA :
                      (O_EN && !EMPTY)   ? sp < 10'd2 ? 8'b0 : mem[sp-10'd2] : mem[sp-10'd1];

    always @ (posedge CLK) begin
        if (RST) begin
            sp <= 10'b1;
            mem[0] <= 8'b0;
        end
        else if (I_VALID && !FULL) begin
            sp <= sp + 10'b1;
            mem[sp] <= I_DATA;
        end
        else if (O_EN && !EMPTY) begin
            sp <= sp - 10'b1;
            O_VALID <= 1'b1;
            O_DATA <= mem[sp-10'd1];
        end
        else
            O_VALID <= 1'b0;
    end

endmodule
