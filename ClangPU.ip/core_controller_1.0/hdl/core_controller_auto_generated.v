module core_controller_auto_generated #
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
        input wire          CSTAT,

        // AXIバス
        input wire                              S_AXI_ACLK,
        input wire                              S_AXI_ARSTN,
        input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
        input wire                              S_AXI_AWVALID,
        output wire                             S_AXI_AWREADY,
        input wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
        input wire                              S_AXI_WVALID,
        output wire                             S_AXI_WREADY,
        input wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,

        output reg [C_S_AXI_DATA_WIDTH-1:0]     reg_data_out
    );

    /* ----- AXIバス ==> 接続回路 ----- */

    // 書き込みチェック信号
    assign slv_reg_wren = S_AXI_WREADY && S_AXI_WVALID && S_AXI_AWREADY && S_AXI_AWVALID;

    // SLVレジスタ書き込み
    reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg0,slv_reg1,slv_reg2;

    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            slv_reg0 <= 32'b0;
            slv_reg1 <= 32'b0;
            slv_reg2 <= 32'b0;
        end
        else begin
            if (slv_reg_wren) begin
                case (S_AXI_AWADDR)
                    16'h0000: slv_reg0 <= S_AXI_WDATA;
                    16'h0004: slv_reg1 <= S_AXI_WDATA;
                    16'h0008: slv_reg2 <= S_AXI_WDATA;
                endcase
            end
        end
    end

    // 接続回路への出力
    reg  ocache_slv_reg0 [0:1];
    reg  ocache_slv_reg1 [0:1];
    reg [31:0] ocache_slv_reg2 [0:1];

    assign CRST = ocache_slv_reg0[1];
    assign CEXEC = ocache_slv_reg1[1];
    assign CMEM_ADDR = ocache_slv_reg2[1];

    always @ (posedge CCLK) begin
        if (S_AXI_ARSTN == 1'b0) begin
            ocache_slv_reg0[0] <= 1'b0; ocache_slv_reg0[1] <= 1'b0;
            ocache_slv_reg1[0] <= 1'b0; ocache_slv_reg1[1] <= 1'b0;
            ocache_slv_reg2[0] <= 32'b0; ocache_slv_reg2[1] <= 32'b0;
        end
        else begin
            ocache_slv_reg0[1] <= ocache_slv_reg0[0]; ocache_slv_reg0[0] <= slv_reg0;
            ocache_slv_reg1[1] <= ocache_slv_reg1[0]; ocache_slv_reg1[0] <= slv_reg1;
            ocache_slv_reg2[1] <= ocache_slv_reg2[0]; ocache_slv_reg2[0] <= slv_reg2;
        end
    end

    /* ----- 接続回路 ==> AXIバス ----- */

    // 接続回路からの入力
    reg icache_slv_reg3 [0:1];

    always @ (posedge S_AXI_ACLK) begin
        icache_slv_reg3[1] <= icache_slv_reg3[0]; icache_slv_reg3[0] <= CSTAT;
    end

    // AXIバスへの出力生成
    always @* begin
        case (S_AXI_ARADDR)
            16'h000c:   reg_data_out <= icache_slv_reg3[1];
            default:    reg_data_out <= 0;
        endcase
    end

endmodule
