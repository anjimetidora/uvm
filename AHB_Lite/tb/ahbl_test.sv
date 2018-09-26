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


//              File Name : ahbl_test.sv
//              File Type: System Verilog                                 
//              Creation Date : 18-12-2017
//              Last Modified : Mon 18 Dec 2017 02:35:52 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//


`include "ahbl_sequence"

class ahbl_test extends uvm_test;

//factory registration 
`uvm_component_utils(ahbl_test)
ahbl_sequence test_seq;
ahbl_environment test_env;

function new(string name="ahbl_test",uvm_component parent=null);
super.new(name,parent);
endfunction

extern virtual function void build_phase(uvm_phase phase);
extern virtual task main_phase(uvm_phase phase);

endclass


function void ahbl_test::build_phase(uvm_phase phase);
super.build_phase(phase);
test_env=ahbl_environment::type_id::create(.name("test_env"),parent(this));
test_seq=ahbl_sequence::type_id::create(.name("test_seq"));
endfunction:buil_phase



task ahbl_test::main_phase(phase);
	phase.raise_objection(this);
	`uvm_info("test is running .......\n",UVM_LOW)
	#1000
	`uvm_info("test is complete.......\n",UVM_LOW)
	phase.drop_objection(this);
endtask:main_phase


