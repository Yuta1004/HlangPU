// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Jun 20 20:09:55 2023
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
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire rsta;
  wire [0:0]wea;
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
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.95215 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
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
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
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
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27904)
`pragma protect data_block
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
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
