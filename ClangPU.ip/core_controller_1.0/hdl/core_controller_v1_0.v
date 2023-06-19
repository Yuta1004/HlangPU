module core_controller_v1_0 #
    (
        parameter integer C_S_AXI_DATA_WIDTH    = 32,
        parameter integer C_S_AXI_ADDR_WIDTH    = 16
    )
    (
        // COREとの接続ポート
        input wire          CCLK,
        output wire         CRST,
        output wire         CEXEC,
        output wire [31:0]  CMEM_ADDR,
        input wire          CSTAT,

        input wire  s_axi_aclk,
        input wire  s_axi_aresetn,
        input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
        input wire [2 : 0] s_axi_awprot,
        input wire  s_axi_awvalid,
        output wire  s_axi_awready,
        input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
        input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
        input wire  s_axi_wvalid,
        output wire  s_axi_wready,
        output wire [1 : 0] s_axi_bresp,
        output wire  s_axi_bvalid,
        input wire  s_axi_bready,
        input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
        input wire [2 : 0] s_axi_arprot,
        input wire  s_axi_arvalid,
        output wire  s_axi_arready,
        output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
        output wire [1 : 0] s_axi_rresp,
        output wire  s_axi_rvalid,
        input wire  s_axi_rready
    );

    core_controller_v1_0_S_AXI # (
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) core_controller_v1_0_S_AXI_inst (
        .CCLK(CCLK),
        .CRST(CRST),
        .CEXEC(CEXEC),
        .CMEM_ADDR(CMEM_ADDR),
        .CSTAT(CSTAT),
        .S_AXI_ACLK(s_axi_aclk),
        .S_AXI_ARESETN(s_axi_aresetn),
        .S_AXI_AWADDR(s_axi_awaddr),
        .S_AXI_AWPROT(s_axi_awprot),
        .S_AXI_AWVALID(s_axi_awvalid),
        .S_AXI_AWREADY(s_axi_awready),
        .S_AXI_WDATA(s_axi_wdata),
        .S_AXI_WSTRB(s_axi_wstrb),
        .S_AXI_WVALID(s_axi_wvalid),
        .S_AXI_WREADY(s_axi_wready),
        .S_AXI_BRESP(s_axi_bresp),
        .S_AXI_BVALID(s_axi_bvalid),
        .S_AXI_BREADY(s_axi_bready),
        .S_AXI_ARADDR(s_axi_araddr),
        .S_AXI_ARPROT(s_axi_arprot),
        .S_AXI_ARVALID(s_axi_arvalid),
        .S_AXI_ARREADY(s_axi_arready),
        .S_AXI_RDATA(s_axi_rdata),
        .S_AXI_RRESP(s_axi_rresp),
        .S_AXI_RVALID(s_axi_rvalid),
        .S_AXI_RREADY(s_axi_rready)
    );

endmodule
