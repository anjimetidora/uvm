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


//              File Name : fifo_agent.sv
//              File Type: System Verilog                                 
//              Creation Date : 09-08-2017
//              Last Modified : Wed 16 Aug 2017 02:35:39 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


class fifo_agent extends uvm_agent;


`uvm_component_utils(fifo_agent)	//registering the factory

`uvm_component_utils_begin(fifo_agent)
	`uvm_field_enum(uvm_active_passive_enum,is_active,UVM_ALL_ON)
`uvm_component_utils_end


fifo_driver ag_driver;
fifo_monitor ag_monitor;
fifo_sequencer ag_sequencer;

function new(string name="fifo_agent",uvm_component parent);
	begin
		super.new(name,parent);
	end
endfunction

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);

endclass


function void fifo_agent::build_phase(uvm_phase phase);
	`uvm_info(get_name(),"inside the build phase of the agent\n",UVM_HIGH)
		if(!uvm_config_db#(uvm_active_passive_enum)::get(this,"","is_active",is_active))
			`uvm_warning(get_name(),"is_active bit not set\n")

		if(is_active==UVM_ACTIVE)
			begin
				ag_driver=fifo_driver::type_id::create("ag_driver",this);
				ag_sequencer=fifo_sequencer::type_id::create("ag_sequencer",this);
			end
				ag_monitor=fifo_monitor::type_id::create("ag_monitor",this);
endfunction

function void fifo_agent::connect_phase(uvm_phase phase);
	`uvm_info(get_name(),"inside the connect_phase of the agent\n",UVM_HIGH)
		super.connect_phase(phase);
	
		if(get_is_active()==UVM_ACTIVE)
			begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
			end
endfunction





