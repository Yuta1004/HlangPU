`timescale 1ns/1ps

module core_tb;

/* ----- 各種定数 ----- */
localparam integer C_AXI_DATA_WIDTH = 32;
localparam integer C_OFFSET_WIDTH = 32;
localparam integer STEP = 1000 / 50;   // 50Mhz

/* ----- ClangPU接続用 ----- */
reg             CEXEC;
reg  [31:0]     CMEM_ADDR;
wire [7:0]      CSTAT;

/* ----- クロック ----- */
reg AXI_CLK, CCLK;
reg AXI_RST, CRST;

always begin
    AXI_CLK = 0; CCLK = 0; #(STEP/2);
    AXI_CLK = 1; CCLK = 1; #(STEP/2);
end

/* ----- AXI-bfmとの接続 ----- */
`include "hlangpu_axibfm.vh"

/* ----- 監視対象信号 ----- */
wire [31:0]     I_ADDR      = core.fetch.I_ADDR;
wire            I_VALID     = core.fetch.I_VALID;
wire [31:0]     O_ADDR      = core.fetch.O_ADDR;
wire            O_VALID     = core.fetch.O_VALID;
wire [31:0]     O_DATA      = core.fetch.O_DATA;
wire            MEM_WAIT    = core.fetch.MEM_WAIT;

// wire            LEX_FOUND_EOF   = core.lexer.FOUND_EOF;
wire            LEX_I_VALID     = core.ffifo_o_valid;
wire [7:0]      LEX_I_CHAR      = core.ffifo_o_data;
wire            LEX_O_VALID     = core.lexer.O_VALID;
wire [15:0]     LEX_O_TOKEN     = core.lexer.O_DATA;
// wire [63:0]     LEX_STR64       = core.lexer.str_64;
// wire [15:0]     LEX_READY_O     = core.lexer.o_data_ready;

wire            PARSER_I_VALID  = core.parser.I_VALID;
wire [15:0]     PARSER_I_TOKEN  = core.parser.I_TOKEN;
wire            PARSER_O_VALID  = core.parser.O_VALID;
wire [15:0]     PARSER_O_SHIFT  = core.parser.O_SHIFT;
wire [15:0]     PARSER_O_REDUCE = core.parser.O_REDUCE;
// wire            PARSER_RECEIVE  = core.parser.RECEIVE;
// wire [3:0]      PARSER_STATE    = core.parser.state;
// wire [1:0]      PARSER_ACTION   = core.parser.action;
// wire [7:0]      PARSER_AVALUE   = core.parser.avalue;
// wire            PARSER_S_PUSH   = core.parser.push_en;
// wire [7:0]      PARSER_S_PUSHD  = core.parser.push_data;
// wire            PARSER_S_POP    = core.parser.pop_en;
// wire [7:0]      PARSER_S_TOP    = core.parser.top_data;
// wire [7:0]      PARSER_R_MEMO   = core.parser.reduce_memo;

wire            EXEC_I_VALID    = core.exec.I_VALID;
wire [15:0]     EXEC_I_SHIFT    = core.exec.I_SHIFT;
wire [15:0]     EXEC_I_REDUCE   = core.exec.I_REDUCE;
wire [7:0]      EXEC_O_RESULT   = core.exec.O_RESULT;
// wire            EXEC_RECEIVE    = core.exec.RECEIVE;
// wire [7:0]      EXEC_POPNUMS    = core.exec.pop_nums;
// wire            EXEC_PUSH       = core.exec.vlifo_push_en;
// wire [7:0]      EXEC_PUSHD      = core.exec.vlifo_push_data;
// wire            EXEC_POP        = core.exec.vlifo_pop_en;
// wire [7:0]      EXEC_POPD       = core.exec.vlifo_pop_data;
// wire [7:0]      EXEC_PDATA_0    = core.exec.poped_values[0];
// wire [7:0]      EXEC_PDATA_1    = core.exec.poped_values[1];
// wire [7:0]      EXEC_PDATA_2    = core.exec.poped_values[2];
// wire [7:0]      EXEC_PDATA_3    = core.exec.poped_values[3];
// wire [7:0]      EXEC_PDATA_4    = core.exec.poped_values[4];
// wire [7:0]      EXEC_PDATA_5    = core.exec.poped_values[5];
// wire [7:0]      EXEC_PDATA_6    = core.exec.poped_values[6];
// wire [7:0]      EXEC_PDATA_7    = core.exec.poped_values[7];
wire [7:0]      EXEC_VAR_A      = core.exec.registers[1];
wire [7:0]      EXEC_VAR_B      = core.exec.registers[2];
wire [7:0]      EXEC_VAR_C      = core.exec.registers[3];
wire [7:0]      EXEC_VAR_D      = core.exec.registers[4];
wire [7:0]      EXEC_VAR_E      = core.exec.registers[5];
wire [7:0]      EXEC_VAR_F      = core.exec.registers[6];
wire [7:0]      EXEC_VAR_G      = core.exec.registers[7];
wire [7:0]      EXEC_VAR_H      = core.exec.registers[8];

/* ----- 命令書き込み ----- */
task write_inst;
reg [8:0] c;
integer fd, i, num;
begin
    i = 0;
    fd = $fopen("../../../../../../HlangPU.ip/hlangpu_1_0/tb/test.c", "rb");
    while ($feof(fd) == 0) begin
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][7:0]    = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][15:8]   = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][23:16]  = c[7:0];
        c = $fgetc(fd); axi_slave_bfm_inst.ram_array[i][31:24]  = c[7:0];
        i = i + 1;
    end
end
endtask

/* ----- テストベンチ本体 ----- */
initial begin
    AXI_RST = 0; CRST = 0;
    CEXEC = 0;
    CMEM_ADDR = 32'h0000_0000;
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
