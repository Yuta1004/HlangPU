// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Jun 20 20:36:17 2023
// Host        : ArchLinux running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/yn0014/Develop/projects/mitou2023/ClangPU/ClangPU.ip/clangpu_1_0/src/fifo_32in_8out_2048/fifo_32in_8out_2048_stub.v
// Design      : fifo_32in_8out_2048
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *)
module fifo_32in_8out_2048(clk, srst, din, wr_en, rd_en, dout, full, empty, valid, 
  wr_data_count)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[31:0],wr_en,rd_en,dout[7:0],full,empty,valid,wr_data_count[11:0]" */;
  input clk;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output empty;
  output valid;
  output [11:0]wr_data_count;
endmodule
