parameter NUM       = 8'h00;
parameter OUT       = 8'h01;    // "out"
parameter VAR_A     = 8'h02;    // "a"
parameter EQUAL     = 8'h03;    // "="
parameter VAR_B     = 8'h04;    // "b"
parameter VAR_C     = 8'h05;    // "c"
parameter IF        = 8'h06;    // "if"
parameter BRACKET_A = 8'h07;    // "("
parameter BRACKET_B = 8'h08;    // ")"
parameter PLUS      = 8'h09;    // "+"
parameter MINUS     = 8'h0a;    // "-"
parameter SEMICOLON = 8'h0b;    // ";"
parameter EOF       = 8'h0c;    // "EOF"

always @* begin
    casex (str_64)
        64'hxx_xx_xx_xx_xx_xx_xx_61: o_data_ready <= { VAR_A, 8'b0 };       // "a"
        64'hxx_xx_xx_xx_xx_xx_xx_62: o_data_ready <= { VAR_B, 8'b0 };       // "b"
        64'hxx_xx_xx_xx_xx_xx_xx_63: o_data_ready <= { VAR_C, 8'b0 };       // "c"
        64'hxx_xx_xx_xx_xx_xx_xx_28: o_data_ready <= { BRACKET_A, 8'b0 };   // "("
        64'hxx_xx_xx_xx_xx_xx_xx_29: o_data_ready <= { BRACKET_B, 8'b0 };   // ")"
        64'hxx_xx_xx_xx_xx_xx_xx_3d: o_data_ready <= { EQUAL, 8'b0 };       // "="
        64'hxx_xx_xx_xx_xx_xx_xx_2b: o_data_ready <= { PLUS, 8'b0 };        // "+"
        64'hxx_xx_xx_xx_xx_xx_xx_2d: o_data_ready <= { MINUS, 8'b0 };       // "-"
        64'hxx_xx_xx_xx_xx_xx_xx_3b: o_data_ready <= { SEMICOLON, 8'b0 };   // "-"
        64'hxx_xx_xx_xx_xx_xx_69_66: o_data_ready <= { IF, 8'b0 };          // "if"
        64'hxx_xx_xx_xx_xx_6f_75_74: o_data_ready <= { OUT, 8'b0 };         // "out"
        64'hxx_xx_xx_xx_xx_45_4f_46: o_data_ready <= { EOF, 8'b0 };         // "eof"
        default:                     o_data_ready <= { NUM, num_8[1] };     // Unknown Tag or NUM
    endcase
end
