// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Jun 20 19:23:20 2023
// Host        : ArchLinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/yn0014/Develop/projects/mitou2023/ClangPU/ClangPU.ip/clangpu_1_0/src/bram_4kb/bram_4kb_sim_netlist.v
// Design      : bram_4kb
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_4kb,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module bram_4kb
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [31:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire rsta;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.96495 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "bram_4kb.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bram_4kb_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[11:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29952)
`pragma protect data_block
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
TCYMP+1eXvJM8j1cLEZL9B7TmtXjaaswr154
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
