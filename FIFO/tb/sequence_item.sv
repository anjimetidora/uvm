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


//              File Name : sequence_item.sv
//              File Type: System Verilog                                 
//              Creation Date : 08-08-2017
//              Last Modified : Wed 16 Aug 2017 01:13:12 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

`include "fifo_package.sv"
typedef enum {PUSH,POP,RST} kind;


class fifo_sequence_item extends sequence_item;
`uvm_object_utils(fifo_sequence_item)
	
	function new(string name="fifo_sequence_item");
	super.new(name);
	endfunction
		
		logic clk;
		logic rst_n;
		logic push;
		logic pop;
		randc logic [W_WIDTH-1:0]in_data;
		logic [D_WIDTH-1:0]data_out;
		logic full;
		logic empty;
		logic push_err_on_full;
		logic pop_err_on_empty;


constraint fifo_constraint(in_data>100;
													 in_data<250;)

`uvm_object_utils_begin(fifo_sequence_item)
	`uvm_field_int(clk,UVM_ALL_ON)
	`uvm_field_int(rst_n,UVM_ALL_ON)
	`uvm_field_int(push,UVM_ALL_ON)
	`uvm_field_int(pop,UVM_ALL_ON)
	`uvm_field_int(in_data,UVM_ALL_ON)
	`uvm_field_int(data_out,UVM_ALL_ON)
	`uvm_field_int(full,UVM_ALL_ON)
	`uvm_field_int(empty,UVM_ALL_ON)
	`uvm_field_int(push_err_on_full,UVM_ALL_ON)
	`uvm_field_int(pop_err_on_empty,UVM_ALL_ON)
`uvm_object_utils_end

endclass

