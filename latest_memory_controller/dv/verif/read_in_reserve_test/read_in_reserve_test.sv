//*******************************DV_logic*************************************//

//												File Name : read_in_reserve_test.sv
//												File Type : system_verilog
//										Creation Date : 26-10-2018
//												File Type : system_verilog
//													 Author : Dorababu

//****************************************************************************//
class read_in_reserve_test extends base_test;
`uvm_component_utils(read_in_reserve_test)
read_in_reserve_seq r_seq_reserv;
//mc_env env;
function new(string name="read_in_reserve_test",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	r_seq_reserv=read_in_reserve_seq::type_id::create("r_seq_reserv",this);
  //      env=mc_env::type_id::create("env",this);
	  endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  r_seq_reserv.start(env.agnt.seqr);
	`uvm_info(get_name(),"read_in_reserve_test is running.....................",UVM_HIGH)
	//memory_data();
	phase.drop_objection(this);
endtask
endclass
