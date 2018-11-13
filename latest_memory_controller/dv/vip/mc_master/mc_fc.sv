//*******************************DV_logic*************************************//

//												File Name : mc_fc.sv
//												File Type : system_verilog
//										Creation Date : 30-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//


class mc_fc extends uvm_subscriber #(mc_sequence_item);
	`uvm_component_utils(mc_fc)
	mc_sequence_item seq_item;


	covergroup cover_group;
		option.per_instance=1;
			c1:coverpoint seq_item.wr_addr{bins low={[0:50]};
																				bins mid={[51:150]};
																				bins high={[151:255]};}
			c2:coverpoint seq_item.in_data{bins low={[0:50]};
															bins mid={[51:150]};
															bins high={[151:255]};}
			c3:coverpoint seq_item.data_out{bins low={[0:50]};
															bins mid={[51:150]};
															bins high={[151:255]};}
			c4:coverpoint seq_item.slv_error;
		endgroup


	extern function new(string name="mc_fc",uvm_component parent=null);
	extern function void write(T t);
endclass

function mc_fc::new(string name="mc_fc",uvm_component parent=null);
	super.new(name,parent);
	cover_group=new();
endfunction

function void mc_fc::write(T t);
	seq_item=t;
cover_group.sample();
endfunction




