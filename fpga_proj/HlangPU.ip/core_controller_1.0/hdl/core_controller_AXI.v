module core_controller_AXI #
    (
        parameter integer C_S_AXI_DATA_WIDTH    = 32,
        parameter integer C_S_AXI_ADDR_WIDTH    = 16
    )
    (
        // 回路接続
        input wire          CCLK,
        output wire         CRST,
        output wire         CEXEC,
        output wire [31:0]  CMEM_ADDR,
        input wire  [15:0]  CSTAT,

        // AXIバス
        input wire                              S_AXI_ACLK,
        input wire                              S_AXI_ARSTN,
        input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
        input wire [2:0]                        S_AXI_AWPROT,
        input wire                              S_AXI_AWVALID,
        output wire                             S_AXI_AWREADY,
        input wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
        input wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
        input wire                              S_AXI_WVALID,
        output wire                             S_AXI_WREADY,
        output wire [1:0]                       S_AXI_BRESP,
        output wire                             S_AXI_BVALID,
        input wire                              S_AXI_BREADY,
        input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,
        input wire [2:0]                        S_AXI_ARPROT,
        input wire                              S_AXI_ARVALID,
        output wire                             S_AXI_ARREADY,
        output wire [C_S_AXI_DATA_WIDTH-1:0]    S_AXI_RDATA,
        output wire [1:0]                       S_AXI_RRESP,
        output wire                             S_AXI_RVALID,
        input wire                              S_AXI_RREADY
    );

    localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
    localparam integer OPT_MEM_ADDR_BITS = 1;

    // AXI4LITE用レジスタ
    reg [C_S_AXI_ADDR_WIDTH-1:0]    axi_awaddr;
    reg                             axi_awready;
    reg                             axi_wready;
    reg [1:0]                       axi_bresp;
    reg                             axi_bvalid;
    reg [C_S_AXI_ADDR_WIDTH-1:0]    axi_araddr;
    reg                             axi_arready;
    reg [C_S_AXI_DATA_WIDTH-1:0]    axi_rdata;
    reg [1:0]                       axi_rresp;
    reg                             axi_rvalid;

    assign S_AXI_AWREADY    = axi_awready;
    assign S_AXI_WREADY     = axi_wready;
    assign S_AXI_BRESP      = axi_bresp;
    assign S_AXI_BVALID     = axi_bvalid;
    assign S_AXI_ARREADY    = axi_arready;
    assign S_AXI_RDATA      = axi_rdata;
    assign S_AXI_RRESP      = axi_rresp;
    assign S_AXI_RVALID     = axi_rvalid;

    // AWREADY信号生成
    reg aw_en;

    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_awready <= 1'b0;
            aw_en <= 1'b1;
        end
        else begin
            if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
                axi_awready <= 1'b1;
                aw_en <= 1'b0;
            end
            else if (S_AXI_BREADY && axi_bvalid) begin
                aw_en <= 1'b1;
                axi_awready <= 1'b0;
            end
            else begin
                axi_awready <= 1'b0;
            end
        end
    end

    // AWADDR信号のラッチ
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_awaddr <= 0;
        end
        else begin
            if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
                axi_awaddr <= S_AXI_AWADDR;
            end
        end
    end

    // WREADY信号生成
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_wready <= 1'b0;
        end
        else begin
            if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en) begin
                axi_wready <= 1'b1;
            end
            else begin
              axi_wready <= 1'b0;
            end
        end
    end

    // Bチャネル信号生成
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_bvalid  <= 0;
            axi_bresp   <= 2'b0;
        end
        else begin
            if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin
                axi_bvalid <= 1'b1;
                axi_bresp  <= 2'b0;
            end
            else begin
                if (S_AXI_BREADY && axi_bvalid) begin
                    axi_bvalid <= 1'b0;
                end
            end
        end
    end

    // ARREADY信号生成
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_arready <= 1'b0;
            axi_araddr  <= 32'b0;
        end
        else begin
            if (~axi_arready && S_AXI_ARVALID) begin
                axi_arready <= 1'b1;
                axi_araddr  <= S_AXI_ARADDR;
            end
            else begin
                axi_arready <= 1'b0;
            end
        end
    end

    // RVALID信号生成
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_rvalid <= 0;
            axi_rresp  <= 0;
        end
        else begin
            if (axi_arready && S_AXI_ARVALID && ~axi_rvalid) begin
                axi_rvalid <= 1'b1;
                axi_rresp  <= 2'b0;
            end
            else if (axi_rvalid && S_AXI_RREADY) begin
                axi_rvalid <= 1'b0;
            end
        end
    end

    // RDATA信号生成
    wire [C_S_AXI_DATA_WIDTH-1:0]   reg_data_out;
    wire                            slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;

    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            axi_rdata  <= 0;
        end
        else begin
            if (slv_reg_rden) begin
                axi_rdata <= reg_data_out;
            end
        end
    end

    // 自動生成したモジュールとの接続(controller_auto_generated.v)
    core_controller_auto_generated # (
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) core_controller_auto_generated_inst (
        // 回路接続
        .CCLK(CCLK),
        .CRST(CRST),
        .CEXEC(CEXEC),
        .CMEM_ADDR(CMEM_ADDR),
        .CSTAT(CSTAT),

        // AXIバス
        .S_AXI_ACLK     (S_AXI_ACLK),
        .S_AXI_ARSTN    (S_AXI_ARSTN),
        .S_AXI_AWADDR   (S_AXI_AWADDR),
        .S_AXI_AWVALID  (S_AXI_AWVALID),
        .S_AXI_AWREADY  (S_AXI_AWREADY),
        .S_AXI_WDATA    (S_AXI_WDATA),
        .S_AXI_WVALID   (S_AXI_WVALID),
        .S_AXI_WREADY   (S_AXI_WREADY),
        .S_AXI_ARADDR   (S_AXI_ARADDR),

        .reg_data_out   (reg_data_out)
    );

endmodule
