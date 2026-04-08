
module fulladder4(
  input  logic [3:0] a_i,
  input  logic [3:0] b_i,
  input  logic       carry_i,
  output logic [3:0] sum_o,
  output logic       carry_o
);

logic c0, c1 ,c2;

fulladder add_0(
    .a_i(a_i[0]),
    .b_i(b_i[0]),
    .carry_i(carry_i),
    .sum_o(sum_o[0]),
    .carry_o(c0)
);

fulladder add_1(   
    .a_i(a_i[1]),
    .b_i(b_i[1]),
    .carry_i(c0),
    .sum_o(sum_o[1]),
    .carry_o(c1)
);

fulladder add_2(   
    .a_i(a_i[2]),
    .b_i(b_i[2]),
    .carry_i(c1),
    .sum_o(sum_o[2]),
    .carry_o(c2)
);

fulladder add_3(   
    .a_i(a_i[3]),
    .b_i(b_i[3]),
    .carry_i(c2),
    .sum_o(sum_o[3]),
    .carry_o(carry_o)
);

endmodule
