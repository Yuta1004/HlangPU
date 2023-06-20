// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Jun 20 20:09:55 2023
// Host        : ArchLinux running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/yn0014/Develop/projects/mitou2023/ClangPU/ClangPU.ip/clangpu_1_0/src/bram_4kb/bram_4kb_stub.v
// Design      : bram_4kb
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module bram_4kb(clka, rsta, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,wea[0:0],addra[9:0],dina[31:0],douta[31:0]" */;
  input clka;
  input rsta;
  input [0:0]wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
endmodule
