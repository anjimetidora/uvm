module mc_dut #(parameter DATA_WIDTH='b8,
						   parameter ADDR_WIDTH='b8)
						  (input reset,
						  input clk,
						  input w_r,
						  input [ADDR_WIDTH-1:0]wr_addr,
						  input en,
						  input [DATA_WIDTH-1:0]in_data,
						  output reg[DATA_WIDTH-1:0]data_out,
						  output reg slv_error);

	reg [7:0]mem[255:0];
	always @(posedge clk)
	begin
		if(!reset)
		begin
			data_out<='b0;
			slv_error<='b0;
		end
		else
		begin
			if(en)
			begin
				if(w_r)
				  mem[wr_addr]<=in_data;
				else if(!w_r)
				  data_out<=mem[wr_addr];
				else
				  slv_error<='b1;
			end
		  else

			slv_error<='b1;
		end
	end
	endmodule










