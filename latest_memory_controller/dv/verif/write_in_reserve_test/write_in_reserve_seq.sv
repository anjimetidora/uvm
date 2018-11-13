//*******************************DV_logic*************************************//

//												File Name : write_in_reserve_seq.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class write_in_reserve_seq extends base_sequence;
  `uvm_object_utils(write_in_reserve_seq)
mc_sequence_item seq_item;
  
  function new(string name="write_in_reserve_seq");
	super.new(name);
  endfunction

  task body();
		`uvm_do_with(seq_item,{seq_item.w_r=='b1;
														seq_item.en=='b1;
														seq_item.wr_addr>200;
														seq_item.wr_addr<250;});
	`uvm_info(get_name(),"write_in_reserve_seq sequence is running..........................",UVM_HIGH)
	   endtask
		
	endclass
