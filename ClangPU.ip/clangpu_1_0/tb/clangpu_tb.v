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
wire [31:0]     I_ADDR      = core.fetch.I_ADDR;
wire            I_VALID     = core.fetch.I_VALID;
wire [31:0]     O_ADDR      = core.fetch.O_ADDR;
wire            O_VALID     = core.fetch.O_VALID;
wire [31:0]     O_DATA      = core.fetch.O_DATA;
wire            MEM_WAIT    = core.fetch.MEM_WAIT;

/* ----- 命令書き込み ----- */
task write_inst;
integer i, num;
begin
    num = 32'd0;
    for (i = 32'd0; i < 32'd4096; i = i + 32'd1) begin
        axi_slave_bfm_inst.ram_array[i][7:0]   =  num    % 256;
        axi_slave_bfm_inst.ram_array[i][15:8]  = (num+1) % 256;
        axi_slave_bfm_inst.ram_array[i][23:16] = (num+2) % 256;
        axi_slave_bfm_inst.ram_array[i][31:24] = (num+3) % 256;
        num = num + 32'd4;
    end
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
