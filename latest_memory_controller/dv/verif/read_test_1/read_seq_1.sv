//*******************************DV_logic*************************************//

//												File Name : read_seq_1.sv
//												File Type : system_verilog
//										Creation Date : 25-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_seq1 extends base_sequence;

`uvm_object_utils(read_seq1)
mc_sequence_item seq_item;

function new(string name="read_seq1");
	super.new(name);
endfunction

task body();
	repeat(15)
begin
	`uvm_do_with(seq_item,{seq_item.w_r=='b0;
													seq_item.en=='b1;
													seq_item.wr_addr>50;
													seq_item.wr_addr<200;});
end
  `uvm_info(get_name(),"read_seq1 is running.................",UVM_HIGH)
  endtask
endclass

