interface mc_interface (input logic clk);
	logic reset;
	logic [1:0] addr;
	logic wr_en;
	logic rd_en;
	logic [7:0] wdata;
	logic [7:0] rdata;
	clocking driver_cb @(posedge clk);
		output addr;
		output wr_en;
		output rd_en;
		output wdata;
		input rdata;
	endclocking

	clocking monitor_cb @(posedge clk);
		input addr;
		input wr_en;
		input rd_en;
		input wdata;
		input rdata;
	endclocking
endinterface

