interface mc_interface(input clk);

  logic reset;
  logic clk;
  logic w_r;
  logic [DATA_WIDTH-1:0]in_data;
  logic en;
  logic [ADDR_WIDTH-1:0]wr_addr;
  logic [DATA_WIDTH-1:0]data_out;
  logic slv_error;

clocking drv_cb@(posedge clk);
  output reset;
  output clk;
  output w_r;
  output in_data;
  output en;
  output wr_addr;
  input data_out;
  input slv_error;
endclocking

clocking mon_cb@(posedge clk);
  input reset;
  input clk;
  input w_r;
  input in_data;
  input en;
  input wr_addr;
  output data_out;
  output slv_error;
endclocking

endinterface

