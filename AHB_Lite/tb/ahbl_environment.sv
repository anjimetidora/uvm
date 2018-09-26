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


//              File Name : ahbl_environment.sv
//              File Type: System Verilog                                 
//              Creation Date : 18-12-2017
//              Last Modified : Mon 18 Dec 2017 02:35:43 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


class ahbl_environment extends uvm_env;
 //factory registration
 `uvm_component_utils(ahbl_environment)

ahbl_agent env_agent;

function new(string name="ahbl_environment",uvm_component parent=null);
super.new(name,parent);
endfunction

extern virtual function void build_phase(uvm_phase phase);
endclass

function void ahbl_environment::build_phase(phase);
env_agent=ahbl_environment::type_id::create(.name("env_agent"),parent(this));
uvm_config_db #(uvm_active_passive_enum)::set(.cntxt(this),
																							.inst_name("*"),
																							.field_name("is_active"),
																							.value(UVM_ACTIVE));
endfunction






