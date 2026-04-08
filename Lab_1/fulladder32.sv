
module fulladder32(
    input  logic [31:0] a_i,
    input  logic [31:0] b_i,
    input  logic        carry_i,
    output logic [31:0] sum_o,
    output logic        carry_o
);

logic c0 , c1 ,c2 ,c3 , c4 ,c5 ,c6 ;

fulladder4 f_a_4_0(
    .a_i(a_i[3:0]),
    .b_i(b_i[3:0]),
    .carry_i(carry_i),
    .sum_o(sum_o[3:0]),
    .carry_o(c0)
);

fulladder4 f_a_4_1(
    .a_i(a_i[7:4]),
    .b_i(b_i[7:4]),
    .carry_i(c0),
    .sum_o(sum_o[7:4]),
    .carry_o(c1)
);

fulladder4 f_a_4_2(
    .a_i(a_i[11:8]),
    .b_i(b_i[11:8]),
    .carry_i(c1),
    .sum_o(sum_o[11:8]),
    .carry_o(c2)
);

fulladder4 f_a_4_3(
    .a_i(a_i[15:12]),
    .b_i(b_i[15:12]),
    .carry_i(c2),
    .sum_o(sum_o[15:12]),
    .carry_o(c3)
);

fulladder4 f_a_4_4(
    .a_i(a_i[19:16]),
    .b_i(b_i[19:16]),
    .carry_i(c3),
    .sum_o(sum_o[19:16]),
    .carry_o(c4)
);

fulladder4 f_a_4_5(
    .a_i(a_i[23:20]),
    .b_i(b_i[23:20]),
    .carry_i(c4),
    .sum_o(sum_o[23:20]),
    .carry_o(c5)
);

fulladder4 f_a_4_6(
    .a_i(a_i[27:24]),
    .b_i(b_i[27:24]),
    .carry_i(c5),
    .sum_o(sum_o[27:24]),
    .carry_o(c6)
);

fulladder4 f_a_4_7(
    .a_i(a_i[31:28]),
    .b_i(b_i[31:28]),
    .carry_i(c6),
    .sum_o(sum_o[31:28]),
    .carry_o(carry_o)
);

endmodule