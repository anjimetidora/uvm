//***************************************************************************//
//***************************************************************************//
//***************************************************************************//
//**************                                          *******************//
//**************                                          *******************//
//**************      (c) SASIC Technologies Pvt Ltd      *******************//
//**************          (c) Verilogic Solutions         *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************           www.sasictek.com               *******************//
//**************          www.verilog-ic.com              *******************//
//**************                                          *******************//
//**************           Twitter:@sasictek              *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//***************************************************************************//
//***************************************************************************//


//              File Name : fifo_interface.sv
//              File Type: System Verilog                                 
//              Creation Date : 16-08-2017
//              Last Modified : Wed 16 Aug 2017 12:33:51 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

import fifo_pkg::*;

interface fifo_interface(input logic clk);

		logic clk;
		logic rst_n;
		logic push;
		logic pop;
		logic [W_WIDTH-1:0]in_data;
		logic [D_WIDTH-1:0]data_out;
		logic full;
		logic empty;
		logic push_err_on_full;
		logic pop_err_on_empty;

clocking dr_cb(negedge clk);

		output clk;
		output rst_n;
		output pop;
		output push;
		output in_data;
		input data_out;
		input full;
		input empty;
		input push_err_on_full;
		input pop_err_on_empty;
endclocking 

clocking mon_cb(negedge clk);
		input clk;
		input rst_n;
		input pop;
		input push;
		input in_data;
		output data_out;
		output full;
		output empty;
		output push_err_on_full;
		output pop_err_on_empty;
endclocking

endinterface

	



