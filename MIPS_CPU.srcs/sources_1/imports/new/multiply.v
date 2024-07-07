module multiply(
  input [31:0] a,
  input [31:0] b,
  output [31:0] lo,
  output [31:0] hi
);

  reg [31:0] a_reg, b_reg;
  reg [63:0] mult_result;

  always @* begin
    a_reg = a;
    b_reg = b;
    mult_result = a_reg * b_reg;
  end

  assign lo = mult_result[31:0];
  assign hi = mult_result[63:32];

endmodule