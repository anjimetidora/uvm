`include "uvm_macros.svh"
import uvm_pkg::*;
import mc_package::*;

module mc_tb;

bit clk;

//interface instance 
mc_interface vif;

//dut instance 
mc_dut dut_insta(.clk(vif.clk),
				  .reset(vif.reset),
				  .w_r(vif.w_r),
				  .in_data(vif.in_data),
				  .en(vif.en),
				  .wr_addr(vif.wr_addr),
				  .data_out(vif.data_out),
				  .slv_error(vif.slv_error));



// clock generation

initial begin
  clk='b0;
  forever #5 clk=~clk;
end



  initial begin
uvm_config_db #(virtual mc_interface)::set(.cntxt(null),
											.inst_name("*"),
											.field_name("vif"),
											.value(vif));

	  run_test("read_test");
	  #10000 $finish;

  end


endmodule
