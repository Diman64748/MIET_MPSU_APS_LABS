
module register_file(
  input  logic        clk_i,
  input  logic        write_enable_i,

  input  logic [ 4:0] write_addr_i,
  input  logic [ 4:0] read_addr1_i,
  input  logic [ 4:0] read_addr2_i,

  input  logic [31:0] write_data_i,
  output logic [31:0] read_data1_o,
  output logic [31:0] read_data2_o
);
    logic [31:0] rf_mem [31:0]; //создали 32 ячейки по 32 бита
    
    always_comb begin //для конструкции case буду использовать always_comb
        case(read_addr1_i)    // Проверяем адрес
            1'b0:    read_data1_o = 1'b0; // если адрес 0 , то возвращаем 0
            default: read_data1_o = rf_mem[read_addr1_i]; // в ином случае смотрим в нужный адрес
        endcase
    end
    
    always_comb begin //аналогично
        case(read_addr2_i)
            1'b0:    read_data2_o = 1'b0;
            default: read_data2_o = rf_mem[read_addr2_i];
        endcase
    end
    
    always_ff @(posedge clk_i) begin //по ПОЛОЖИТЕЛЬНОМУ сигналу clk 
        if(write_enable_i) begin     // если разрешена запись , производим запись в нужный адрес
            rf_mem[write_addr_i] <= write_data_i; // в блоке always_ff надо использовать "<="
        end
    end

endmodule