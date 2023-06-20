`timescale 1ns/1ps

module core_tb;

/* ----- 各種定数 ----- */
localparam integer C_AXI_DATA_WIDTH = 32;
localparam integer C_OFFSET_WIDTH = 32;
localparam integer STEP = 1000 / 50;   // 50Mhz

/* ----- ClangPU接続用 ----- */
reg             CEXEC;
reg             CMEM_ADDR;
wire            CSTAT;

/* ----- クロック ----- */
reg AXI_CLK, CCLK;
reg AXI_RST, CRST;

always begin
    AXI_CLK = 0; CCLK = 0; #(STEP/2);
    AXI_CLK = 1; CCLK = 1; #(STEP/2);
end

/* ----- AXI-bfmとの接続 ----- */
`include "clangpu_axibfm.vh"

/* ----- 監視対象信号 ----- */


/* ----- 命令書き込み ----- */
task write_inst;
integer i;
begin
    axi_slave_bfm_inst.ram_array[i] = 32'h4d20_0093;
end 
endtask

/* ----- テストベンチ本体 ----- */
initial begin
    AXI_RST = 0; CRST = 0;
    CEXEC = 0;
    #(STEP*10)

    write_inst;

    AXI_RST = 1; CRST = 1;
    #(STEP*10);
    AXI_RST = 0; CRST = 0;

    #(STEP*5);
    CEXEC = 1;
    #(STEP*4500);

    $stop;
end

endmodule
