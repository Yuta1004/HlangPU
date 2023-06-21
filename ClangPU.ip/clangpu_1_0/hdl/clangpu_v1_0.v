module core #
    (
        parameter integer C_M_AXI_THREAD_ID_WIDTH = 1,
        parameter integer C_M_AXI_BURST_LEN       = 1,
        parameter integer C_M_AXI_ID_WIDTH        = 1,
        parameter integer C_M_AXI_ADDR_WIDTH      = 32,
        parameter integer C_M_AXI_DATA_WIDTH      = 32,
        parameter integer C_M_AXI_AWUSER_WIDTH    = 1,
        parameter integer C_M_AXI_ARUSER_WIDTH    = 1,
        parameter integer C_M_AXI_WUSER_WIDTH     = 4,
        parameter integer C_M_AXI_RUSER_WIDTH     = 4,
        parameter integer C_M_AXI_BUSER_WIDTH     = 1
    )
    (
        /* ----- AXIバス ----- */
        // クロック・リセット
        input wire          ACLK,
        input wire          ARESETN,

        // AWチャネル
        output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_AWID,
        output wire [C_M_AXI_ADDR_WIDTH-1:0]        M_AXI_AWADDR,
        output wire [8-1:0]                         M_AXI_AWLEN,
        output wire [3-1:0]                         M_AXI_AWSIZE,
        output wire [2-1:0]                         M_AXI_AWBURST,
        output wire [2-1:0]                         M_AXI_AWLOCK,
        output wire [4-1:0]                         M_AXI_AWCACHE,
        output wire [3-1:0]                         M_AXI_AWPROT,
        output wire [4-1:0]                         M_AXI_AWQOS,
        output wire [C_M_AXI_AWUSER_WIDTH-1:0]      M_AXI_AWUSER,
        output wire                                 M_AXI_AWVALID,
        input  wire                                 M_AXI_AWREADY,

        // Wチャネル
        output wire [C_M_AXI_DATA_WIDTH-1:0]        M_AXI_WDATA,
        output wire [C_M_AXI_DATA_WIDTH/8-1:0]      M_AXI_WSTRB,
        output wire                                 M_AXI_WLAST,
        output wire [C_M_AXI_WUSER_WIDTH-1:0]       M_AXI_WUSER,
        output wire                                 M_AXI_WVALID,
        input  wire                                 M_AXI_WREADY,

        // Bチャネル
        input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_BID,
        input  wire [2-1:0]                         M_AXI_BRESP,
        input  wire [C_M_AXI_BUSER_WIDTH-1:0]       M_AXI_BUSER,
        input  wire                                 M_AXI_BVALID,
        output wire                                 M_AXI_BREADY,

        // ARチャネル
        output wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_ARID,
        output wire [C_M_AXI_ADDR_WIDTH-1:0]        M_AXI_ARADDR,
        output wire [8-1:0]                         M_AXI_ARLEN,
        output wire [3-1:0]                         M_AXI_ARSIZE,
        output wire [2-1:0]                         M_AXI_ARBURST,
        output wire [2-1:0]                         M_AXI_ARLOCK,
        output wire [4-1:0]                         M_AXI_ARCACHE,
        output wire [3-1:0]                         M_AXI_ARPROT,
        output wire [4-1:0]                         M_AXI_ARQOS,
        output wire [C_M_AXI_ARUSER_WIDTH-1:0]      M_AXI_ARUSER,
        output wire                                 M_AXI_ARVALID,
        input  wire                                 M_AXI_ARREADY,

        // Rチャネル
        input  wire [C_M_AXI_THREAD_ID_WIDTH-1:0]   M_AXI_RID,
        input  wire [C_M_AXI_DATA_WIDTH-1:0]        M_AXI_RDATA,
        input  wire [2-1:0]                         M_AXI_RRESP,
        input  wire                                 M_AXI_RLAST,
        input  wire [C_M_AXI_RUSER_WIDTH-1:0]       M_AXI_RUSER,
        input  wire                                 M_AXI_RVALID,
        output wire                                 M_AXI_RREADY,

        /* ----- CPU制御用 ----- */
        input wire          CCLK,
        input wire          CRST,
        input wire          CEXEC,
        input wire  [31:0]  CMEM_ADDR,
        output wire         CSTAT
    );

    /* ----- AXIバス設定 ----- */
    // AWチャネル
    assign M_AXI_AWID    = 'b0;
    assign M_AXI_AWADDR  = 32'b0;   // *
    assign M_AXI_AWLEN   = 8'b0;    // *
    assign M_AXI_AWSIZE  = 3'b010;
    assign M_AXI_AWBURST = 2'b01;
    assign M_AXI_AWLOCK  = 2'b00;
    assign M_AXI_AWCACHE = 4'b0011;
    assign M_AXI_AWPROT  = 3'h0;
    assign M_AXI_AWQOS   = 4'h0;
    assign M_AXI_AWUSER  = 'b0;
    assign M_AXI_AWVALID = 1'b0;    // *

    // Wチャネル
    assign M_AXI_WDATA   = 32'b0;   // *
    assign M_AXI_WSTRB  = 4'b1111;
    assign M_AXI_WLAST   = 1'b0;    // *
    assign M_AXI_WUSER  = 'b0;
    assign M_AXI_WVALID = 1'b0;     // *

    // Bチャネル
    assign M_AXI_BREADY = 1'b0;     // *

    /* ----- 状態 ----- */
    assign CSTAT = 1'b1;

    /* ----- フェッチ部 ----- */
    wire        mem_wait, fetch_o_valid;
    wire [31:0] fetch_o_data;
    reg         fetch_i_valid;
    reg  [31:0] fetch_i_addr;

    wire        ffifo_o_empty, ffifo_o_valid, lexer_o_valid;
    wire [11:0] ffifo_wr_data_count;
    wire [7:0]  ffifo_o_data;
    reg         ffifo_o_en;

    always @ (posedge CCLK) begin
        if (CRST) begin
            fetch_i_addr <= 32'hffff_fffc;
            fetch_i_valid <= 1'b0;
        end
        else if (ffifo_wr_data_count >= 1024) begin
            fetch_i_valid <= 1'b0;
        end
        else if (CEXEC && !mem_wait) begin
            fetch_i_addr <= fetch_i_addr + 32'd4;
            fetch_i_valid <= 1'b1;
        end
    end

    fetch fetch (
        // クロック&リセット
        .CLK        (CCLK),
        .RST        (CRST),

        // 制御
        .MEM_WAIT   (mem_wait),

        // 入出力 
        .I_ADDR     (fetch_i_addr),
        .I_VALID    (fetch_i_valid),
        // .O_ADDR  (),
        .O_VALID    (fetch_o_valid),
        .O_DATA     (fetch_o_data),

        // AXIバス
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
        .M_AXI_RID      (M_AXI_RID),
        .M_AXI_RDATA    (M_AXI_RDATA),
        .M_AXI_RRESP    (M_AXI_RRESP),
        .M_AXI_RLAST    (M_AXI_RLAST),
        .M_AXI_RUSER    (M_AXI_RUSER),
        .M_AXI_RVALID   (M_AXI_RVALID),
        .M_AXI_RREADY   (M_AXI_RREADY)
    );

    fifo_32in_8out_2048 ffifo (
        // クロック&リセット
        .clk    (CCLK),
        .srst   (CRST),

        // 入出力
        // .full        (),
        .din            (fetch_o_data),
        .wr_en          (fetch_o_valid),
        .wr_data_count  (ffifo_wr_data_count),
        .dout           (ffifo_o_data),
        .rd_en          (ffifo_o_en),
        .empty          (ffifo_o_empty),
        .valid          (ffifo_o_valid)
    );

    /* ----- レキサ ----- */
    wire [15:0] lexer_o_data;

    wire        lfifo_o_valid, lfifo_o_empty;
    wire [15:0] lfifo_o_data;
    reg         lfifo_o_en;

    always @ (posedge CCLK) begin
        if (CRST)
            ffifo_o_en <= 1'b0;
        else
            ffifo_o_en <= !ffifo_o_empty;
    end

    lexer lexer (
        // クロック&リセット
        .CLK    (CCLK),
        .RST    (CRST),

        // 入出力
        .I_VALID(ffifo_o_valid),
        .I_DATA (ffifo_o_data),
        .O_VALID(lexer_o_valid),
        .O_DATA (lexer_o_data)
    );

    fifo_16in_16out_1024 lfifo (
        // クロック&リセット
        .clk    (CCLK),
        .srst   (CRST),

        // 入出力
        // .full        (),
        .din            (lexer_o_data),
        .wr_en          (lexer_o_valid),
        .dout           (lfifo_o_data),
        .rd_en          (lfifo_o_en),
        .empty          (lfifo_o_empty),
        .valid          (lfifo_o_valid)
    );

    /* ----- パーサ ----- */
    parameter S_P_READY = 2'b00;
    parameter S_P_FWAIT = 2'b01;
    parameter S_P_PWAIT = 2'b11;

    reg [1:0]   p_state, p_next_state;

    wire        parser_receive, parser_o_valid;
    wire [15:0] parser_o_rule;
    reg         parser_i_valid;
    reg  [15:0] parser_i_token;

    always @ (posedge CCLK) begin
        if (CRST)
            p_state <= S_P_READY;
        else
            p_state <= p_next_state;
    end

    always @* begin
        case (p_state)
            S_P_READY:
                if (!lfifo_o_empty)
                    p_next_state <= S_P_FWAIT;
                else
                    p_next_state <= S_P_READY;

            S_P_FWAIT:
                if (lfifo_o_valid)
                    p_next_state <= S_P_PWAIT;
                else
                    p_next_state <= S_P_FWAIT;
            
            S_P_PWAIT:
                if (parser_receive)
                    p_next_state <= S_P_READY;
                else
                    p_next_state <= S_P_PWAIT;
            
            default:
                p_next_state <= S_P_READY;
        endcase
    end

    always @ (posedge CCLK) begin
        if (CRST)
            lfifo_o_en <= 1'b0;
        else if (p_state == S_P_READY && p_next_state == S_P_FWAIT)
            lfifo_o_en <= 1'b1;
        else if (p_state == S_P_FWAIT)
            lfifo_o_en <= 1'b0;
    end

    always @ (posedge CCLK) begin
        if (CRST) begin
            parser_i_valid <= 1'b0;
            parser_i_token <= 16'b0;
        end
        else if (p_state == S_P_FWAIT && p_next_state == S_P_PWAIT) begin
            parser_i_valid <= 1'b1;
            parser_i_token <= lfifo_o_data;
        end
        else if (p_state == S_P_PWAIT && p_next_state == S_P_READY)
            parser_i_valid <= 1'b0;
    end

    parser parser (
        // クロック&リセット
        .CLK    (CCLK),
        .RST    (CRST),

        // 制御
        .RECEIVE(parser_receive),
        
        // 入出力
        .I_VALID(parser_i_valid),
        .I_TOKEN(parser_i_token),
        .O_VALID(parser_o_valid),
        .O_RULE (parser_o_rule)
    );

endmodule
