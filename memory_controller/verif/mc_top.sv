module mc_top;
reg reset;
logic clk;

//clock generation
initial begin
	clk='b0;
	forever #5 clk=~clk;
end
//assign top_inf.clk=clk;
assign top_inf.reset=reset;

initial begin
	reset=1;
#5 reset=0;
end

//creating the instance of interface inorder to connecting the DUT
mc_interface top_inf(.clk(clk));
//DUT instantiation, dut signals are connected to top tb
mc dut_insta(.clk(top_inf.clk),
							.reset(top_inf.reset),
							.addr(top_inf.addr),
							.wr_en(top_inf.wr_en),
							.rd_en(top_inf.rd_en),
							.wdata(top_inf.wdata),
							.rdata(top_inf.rdata)
						);

initial begin
	uvm_config_db #(virtual mc_interface)::set(uvm_root::get(),//null,	//contxt(starting point of inf)
																			"*",							//scope of the inf(end point of the inf) 
																			"mc_inf",					//field name (it should be inf class name)
																			top_inf);				//value (inf class handle name)
		end
		initial begin
			$display("before run test");
			run_test();
			$display("after run test");
		end
		initial begin
			$fsdbDumpfile("mc.fsdb");
			$fsdbDumpvars(0,mc_top);
		//	$dumpfile("mc.fsdb");
			//$dumpvars(0,mc_top);
		end

		endmodule



