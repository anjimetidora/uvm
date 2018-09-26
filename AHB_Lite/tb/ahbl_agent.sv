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


//              File Name : ahbl_agent.sv
//              File Type: System Verilog                                 
//              Creation Date : 18-12-2017
//              Last Modified : Tue 19 Jul 2016 04:08:48 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


class ahbl_agent extends uvm_agent;
//factory registration
`uvm_component_utils(ahbl_agent)
//components hadles creation
ahbl_sequencer agn_sequencer;
ahbl_driver agn_driver;
ahbl_monitor agn_mon;
ahbl_fcoverage agn_fc;
ahbl_scoreboard agn_sc;

uvm_active_passive_enum is_active

function new(string name="ahbl_agent",uvm_component parent);
super.new(name,parent);
endfunction


extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);

endclass


function ahbl_agent::build_phase(phase);
super.build_phase(phase);
if(uvm_config_db #(uvm_active_passive_enum)::get(.contxt(this),
																									.insta_name(""),
																									.field_name("is_active"),
																									.value(is_active)))
	begin
	`uvm_warning(get_name(),$sformatf("no override for is_active: using is _acitve as:%s",this.is_active.name))
	end
	`uvm_info(get_name(),$sformatf("is active is set to %s",this.is_active.name),UVM_MEDIUM)

	agn_sc=ahbl_scoreboard::type_id::create(.name("agn_sc"),parent(this));
	agn_fc=ahbl_fcoverage::type_id::create(.name("agn_fc"),parent(this));
	agn_mon=ahbl_monitor::type_id::create(.name("agn_mon"),parent(this));

	if(is_active==UVM_ACTIVE)
	begin
		agn_sequencer=ahbl_sequencer::type_id::create(.name("agn_sequencer"),parent(this));
		agn_driver=ahbl_driver::type_id::create(.name("agn_driver"),parent(this));
		end
endfunction

