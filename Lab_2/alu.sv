module alu (
  input  logic [31:0]  a_i,
  input  logic [31:0]  b_i,
  input  logic [4:0]   alu_op_i,
  output logic         flag_o,
  output logic [31:0]  result_o
);

  import alu_opcodes_pkg::*;    // импорт параметров, содержащих
                                // коды операций для АЛУ
                                
  logic [31:0] tmp_result_add;  //Я буду использовать 2 сумматора, так что добавил
  logic [31:0] tmp_result_sub;  // 2 провода для хранения выходов с сумматоров
                                
  fulladder32 adder(
        .a_i(a_i),        
        .b_i(b_i),
        .carry_i(1'b0),         // На вход бита переноса подаем 0
        .sum_o(tmp_result_add)  // Результат записываем во временную переменную
  
  );
    
  fulladder32 suber(            //в лабе просят сделать вычитание с помощью - и не ебать голову, но...
        .a_i(a_i),              // 
        .b_i(~b_i),            // берем отрицание b_i
        .carry_i(1'b1),         //По формуле отрицательного числа , прибавим 1 к ~b_i
        .sum_o(tmp_result_sub)
                                //Не используем выходной бит переноса(выбросим на помойку)
  );
     
                                
  always_comb begin             //Использовать конструкцию case можно только в always_comb
    case(alu_op_i)
        ALU_ADD: result_o = tmp_result_add;
        ALU_SUB: result_o = tmp_result_sub;
        ALU_XOR: result_o = a_i ^ b_i;
        ALU_OR:  result_o = a_i | b_i;
        ALU_AND: result_o = a_i & b_i;
        ALU_SRA: result_o = $signed(a_i) >>> b_i[4:0]; //Для корректной работы SRA нужно, чтобы левый операнд был знаковым
        ALU_SRL: result_o = a_i >> b_i[4:0];
        ALU_SLL: result_o = a_i << b_i[4:0];
        ALU_SLTS: result_o = $signed(a_i) < $signed(b_i);   //Знаковое сравнение
        ALU_SLTU: result_o = a_i < b_i;
        default: result_o = 1'b0;       //По дефолту ставим ноль
    endcase
  end
  
    always_comb begin
    case(alu_op_i)
        ALU_LTS: flag_o = $signed(a_i) < $signed(b_i);
        ALU_LTU: flag_o = a_i < b_i;
        ALU_GES: flag_o = $signed(a_i) >= $signed(b_i);
        ALU_GEU: flag_o = a_i >= b_i;
        ALU_EQ:  flag_o = a_i == b_i;
        ALU_NE:  flag_o = a_i !== b_i;
        default: flag_o = 1'b0;
    endcase
  end

endmodule
