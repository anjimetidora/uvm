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


//              File Name : fifo_environment.sv
//              File Type: System Verilog                                 
//              Creation Date : 09-08-2017
//              Last Modified : Wed 09 Aug 2017 12:21:59 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


class fifo_environmet extends uvm_env;

`uvm_component_utils(fifo_environment)

fifo_agent env_agent;

function new(string name="fifo_environment",uvm_component parent)
	begin
		super.new(name,parent);
	end
endfunction

extern virtual function void build_phase(uvm_phase phase);

endclass



function void fifo_environment::build_phase(uvm_phase phase)
	begin
		env_agent=fifo_agent::type_id::creat(.name(env_agent),
																					.parent(this));

		uvm_config_db#(uvm_active_passive_enum)::set(.cntxt(this),
																									.inst_name("*"),
																									.field_name("is_active"),
																									.value(UVM_ACTIVE));
	end
endfunction




