/* ----- バス用リセット信号 ----- */
wire                            RSTN = ~AXI_RST;

/* ----- AXIバス接続用 ----- */
// AWチャネル
wire                            M_AXI_AWID;
wire [31:0]                     M_AXI_AWADDR;
wire [7:0]                      M_AXI_AWLEN;
wire [2:0]                      M_AXI_AWSIZE;
wire [1:0]                      M_AXI_AWBURST;
wire [1:0]                      M_AXI_AWLOCK;
wire [3:0]                      M_AXI_AWCACHE;
wire [2:0]                      M_AXI_AWPROT;
wire [3:0]                      M_AXI_AWQOS;
wire                            M_AXI_AWUSER;
wire                            M_AXI_AWVALID;
wire                            M_AXI_AWREADY;

// Wチャネル
wire [C_AXI_DATA_WIDTH-1:0]     M_AXI_WDATA;
wire [C_AXI_DATA_WIDTH/8-1:0]   M_AXI_WSTRB;
wire                            M_AXI_WLAST;
wire                            M_AXI_WUSER;
wire                            M_AXI_WVALID;
wire                            M_AXI_WREADY;

// Bチャネル
wire                            M_AXI_BID;
wire [1:0]                      M_AXI_BRESP;
wire                            M_AXI_BUSER;
wire                            M_AXI_BVALID;
wire                            M_AXI_BREADY;

// ARチャネル
wire                            M_AXI_ARID;
wire [31:0]                     M_AXI_ARADDR;
wire [7:0]                      M_AXI_ARLEN;
wire [2:0]                      M_AXI_ARSIZE;
wire [1:0]                      M_AXI_ARBURST;
wire [1:0]                      M_AXI_ARLOCK;
wire [3:0]                      M_AXI_ARCACHE;
wire [2:0]                      M_AXI_ARPROT;
wire [3:0]                      M_AXI_ARQOS;
wire                            M_AXI_ARUSER;
wire                            M_AXI_ARVALID;
wire                            M_AXI_ARREADY;

// Rチャネル
wire                            M_AXI_RID;
wire [C_AXI_DATA_WIDTH-1:0]     M_AXI_RDATA;
wire [1:0]                      M_AXI_RRESP;
wire                            M_AXI_RLAST;
wire                            M_AXI_RUSER;
wire                            M_AXI_RVALID;
wire                            M_AXI_RREADY;

/* ----- ClangPU接続 ----- */
core # (
    .C_M_AXI_DATA_WIDTH (C_AXI_DATA_WIDTH)
) core (
    // ClangPU制御
    .CCLK       (CCLK),
    .CRST       (CRST),
    .CEXEC      (CEXEC),
    .CMEM_ADDR  (CMEM_ADDR),
    .CSTAT      (CSTAT),

    // AWチャネル
    .M_AXI_AWID     (M_AXI_AWID),
    .M_AXI_AWADDR   (M_AXI_AWADDR),
    .M_AXI_AWLEN    (M_AXI_AWLEN),
    .M_AXI_AWSIZE   (M_AXI_AWSIZE),
    .M_AXI_AWBURST  (M_AXI_AWBURST),
    .M_AXI_AWLOCK   (M_AXI_AWLOCK),
    .M_AXI_AWCACHE  (M_AXI_AWCACHE),
    .M_AXI_AWPROT   (M_AXI_AWPROT),
    .M_AXI_AWQOS    (M_AXI_AWQOS),
    .M_AXI_AWUSER   (M_AXI_AWUSER),
    .M_AXI_AWVALID  (M_AXI_AWVALID),
    .M_AXI_AWREADY  (M_AXI_AWREADY),

    // Wチャネル
    .M_AXI_WDATA    (M_AXI_WDATA),
    .M_AXI_WSTRB    (M_AXI_WSTRB),
    .M_AXI_WLAST    (M_AXI_WLAST),
    .M_AXI_WUSER    (M_AXI_WUSER),
    .M_AXI_WVALID   (M_AXI_WVALID),
    .M_AXI_WREADY   (M_AXI_WREADY),

    // Bチャネル
    .M_AXI_BID      (M_AXI_BID),
    .M_AXI_BRESP    (M_AXI_BRESP),
    .M_AXI_BUSER    (M_AXI_BUSER),
    .M_AXI_BVALID   (M_AXI_BVALID),
    .M_AXI_BREADY   (M_AXI_BREADY),

    // ARチャネル
    .M_AXI_ARID     (M_AXI_ARID),
    .M_AXI_ARADDR   (M_AXI_ARADDR),
    .M_AXI_ARLEN    (M_AXI_ARLEN),
    .M_AXI_ARSIZE   (M_AXI_ARSIZE),
    .M_AXI_ARBURST  (M_AXI_ARBURST),
    .M_AXI_ARLOCK   (M_AXI_ARLOCK),
    .M_AXI_ARCACHE  (M_AXI_ARCACHE),
    .M_AXI_ARPROT   (M_AXI_ARPROT),
    .M_AXI_ARQOS    (M_AXI_ARQOS),
    .M_AXI_ARUSER   (M_AXI_ARUSER),
    .M_AXI_ARVALID  (M_AXI_ARVALID),
    .M_AXI_ARREADY  (M_AXI_ARREADY),

    // Rチャネル
    .M_AXI_RID      (M_AXI_RID),
    .M_AXI_RDATA    (M_AXI_RDATA),
    .M_AXI_RRESP    (M_AXI_RRESP),
    .M_AXI_RLAST    (M_AXI_RLAST),
    .M_AXI_RUSER    (M_AXI_RUSER),
    .M_AXI_RVALID   (M_AXI_RVALID),
    .M_AXI_RREADY   (M_AXI_RREADY)
);


/* ----- BFM接続 ----- */
axi_slave_bfm # (
    .READ_RANDOM_WAIT       (1),
    .C_S_AXI_DATA_WIDTH     (C_AXI_DATA_WIDTH),
    .READ_DATA_IS_INCREMENT (0),
    .C_OFFSET_WIDTH         (C_OFFSET_WIDTH),
    .ARREADY_IS_USUALLY_HIGH(0)
) axi_slave_bfm_inst (
    // クロック
    .ACLK           (AXI_CLK),
    .ARESETN        (RSTN),

    // AWチャネル
    .S_AXI_AWID     (M_AXI_AWID),
    .S_AXI_AWADDR   (M_AXI_AWADDR),
    .S_AXI_AWLEN    (M_AXI_AWLEN),
    .S_AXI_AWSIZE   (M_AXI_AWSIZE),
    .S_AXI_AWBURST  (M_AXI_AWBURST),
    .S_AXI_AWLOCK   (M_AXI_AWLOCK),
    .S_AXI_AWCACHE  (M_AXI_AWCACHE),
    .S_AXI_AWPROT   (M_AXI_AWPROT),
    .S_AXI_AWQOS    (M_AXI_AWQOS),
    .S_AXI_AWUSER   (M_AXI_AWUSER),
    .S_AXI_AWVALID  (M_AXI_AWVALID),
    .S_AXI_AWREADY  (M_AXI_AWREADY),

    // Wチャネル
    .S_AXI_WDATA    (M_AXI_WDATA),
    .S_AXI_WSTRB    (M_AXI_WSTRB),
    .S_AXI_WLAST    (M_AXI_WLAST),
    .S_AXI_WUSER    (M_AXI_WUSER),
    .S_AXI_WVALID   (M_AXI_WVALID),
    .S_AXI_WREADY   (M_AXI_WREADY),

    // Bチャネル
    .S_AXI_BID      (M_AXI_BID),
    .S_AXI_BRESP    (M_AXI_BRESP),
    .S_AXI_BUSER    (M_AXI_BUSER),
    .S_AXI_BVALID   (M_AXI_BVALID),
    .S_AXI_BREADY   (M_AXI_BREADY),

    // ARチャネル
    .S_AXI_ARID     (M_AXI_ARID),
    .S_AXI_ARADDR   (M_AXI_ARADDR),
    .S_AXI_ARLEN    (M_AXI_ARLEN),
    .S_AXI_ARSIZE   (M_AXI_ARSIZE),
    .S_AXI_ARBURST  (M_AXI_ARBURST),
    .S_AXI_ARLOCK   (M_AXI_ARLOCK),
    .S_AXI_ARCACHE  (M_AXI_ARCACHE),
    .S_AXI_ARPROT   (M_AXI_ARPROT),
    .S_AXI_ARQOS    (M_AXI_ARQOS),
    .S_AXI_ARUSER   (M_AXI_ARUSER),
    .S_AXI_ARVALID  (M_AXI_ARVALID),
    .S_AXI_ARREADY  (M_AXI_ARREADY),

    // Rチャネル
    .S_AXI_RID      (M_AXI_RID),
    .S_AXI_RDATA    (M_AXI_RDATA),
    .S_AXI_RRESP    (M_AXI_RRESP),
    .S_AXI_RLAST    (M_AXI_RLAST),
    .S_AXI_RUSER    (M_AXI_RUSER),
    .S_AXI_RVALID   (M_AXI_RVALID),
    .S_AXI_RREADY   (M_AXI_RREADY)
);
