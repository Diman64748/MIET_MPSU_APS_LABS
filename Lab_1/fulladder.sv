module fulladder(
  input  logic    a_i,     // Входные сигналы
  input  logic    b_i,
  input  logic    carry_i,

  output logic    sum_o,   // Выходные сигналы
  output logic    carry_o
);

assign sum_o = (a_i ^ b_i) ^ carry_i;
wire tmp = (a_i & b_i) | (a_i & carry_i);
assign carry_o = (b_i & carry_i) | tmp;

endmodule