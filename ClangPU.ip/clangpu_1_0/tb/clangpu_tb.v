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

wire            LEX_I_VALID = core.ffifo_o_valid;
wire [7:0]      LEX_I_CHAR  = core.ffifo_o_data;
wire            LEX_O_VALID = core.lexer.O_VALID;          
wire [15:0]     LEX_O_TOKEN = core.lexer.O_DATA;
wire [63:0]     LEX_STR64   = core.lexer.str_64;

wire            PARSER_I_VALID  = core.parser.I_VALID;
wire [15:0]     PARSER_I_TOKEN  = core.parser.I_TOKEN;
wire            PARSER_RECEIVE  = core.parser.RECEIVE;
wire [3:0]      PARSER_STATE    = core.parser.state;
wire [1:0]      PARSER_ACTION   = core.parser.action;
wire [7:0]      PARSER_AVALUE   = core.parser.avalue;
wire            PARSER_S_PUSH   = core.parser.push_en;
wire [7:0]      PARSER_S_PUSHD  = core.parser.push_data;
wire            PARSER_S_POP    = core.parser.pop_en;
wire [7:0]      PARSER_S_TOP    = core.parser.top_data;
wire [7:0]      PARSER_R_MEMO   = core.parser.reduce_memo;

/* ----- 命令書き込み ----- */
task write_inst;
reg [8:0] c;
integer fd, i, num;
begin
    i = 0;
    fd = $fopen("../../../../../../ClangPU.ip/clangpu_1_0/tb/test.c", "rb");
    while ($feof(fd) == 0) begin
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][7:0]   = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][15:8]  = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][23:16] = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][31:24] = c[7:0];
        i = i + 1;
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
