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


//              File Name : fifo_driver.sv
//              File Type: System Verilog                                 
//              Creation Date : 11-08-2017
//              Last Modified : Wed 16 Aug 2017 02:41:31 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

class fifo_driver extends uvm_driver(fifo_sequence_item);

`uvm_component_utils(fifo_driver)

fifo_sequence_item drv_seq_item;

virtual fifo_interface drv_inf;

function new(string name="fifo_driver",uvm_component name);
	super.new(name,parent);
endfunction

extern virtual task reset_phase(uvm_phase phase);
extern virtual task reset_dut(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual task send_to_DUT(drv_seq_item);
extern virtual task push_operation(drv_seq_item.in_data);
extern virtual task pop_operation();
extern virtual task report_phase(uvm_phase phase);

endclass



task fifo_driver::reset_phase(uvm_phase phase);
	`uvm_info(get_name(),"reset phase is running........\n",UVM_HIGH)
	begin
		phase.raise_objection(this);
		this.reset_dut(2);
		phase.drop_objection(this);
	end
endtask


task fifo_driver::reset_dut(int no_of_cycles);
 `uvm_info(get_name(),"reseting the dut........\n",UVM_HIGH)
 	begin 
		repeat(int no_of_cycles)
			begin
				@(drv_inf.dr_cb)
					drv_inf.dr_cb.rst_n<='b0;
					drv_inf.dr_cb.pop<='b0;
					drv_inf.dr_cb.push<='b0;
					drv_inf.dr_cb.in_data<='b0;
			end
				@(drv_inf.dr_cb)
					drv_inf.dr_cb.rst_n<='b1;
	end
endtask

task fifo_driver::run_phase(uvm_phase phase);
	`uvm_info(get_name(),"inside the run_phase\n",UVM_HIGH)
		forever 
			begin
				seq_item_port.get_next_item(drv_seq_item);
				send_to_DUT(drv_seq_item);
	
				seq_item_port.item_done(drv_seq_item);
			end
	`uvm_info(get_name(),"exiting the run_phase\n",UVM_HIGH);
endtask


task fifo_driver::send_to_DUT(input drv_seq_item);
	`uvm_info(get_name(),"inside the send to dut\n",UVM_HIGH);
		begin
			`uvm_info(get_name(),"txns data inside the driver=%0s\n",drv_seq_item.sprint(),UVM_HIGH)
			case(drv_seq_item.kind)
				
				PUSH:
					push_operation(drv_seq_item.in_data);
				POP:
					pop_operation();
			endcase
		end
endtask

task fifo_driver::push_operation(input drv_seq_item);
	`uvm_info(get_name(),"inside the push_operation\n",UVM_HIGH)
		begin
			@(drv_inf.dr_cb)
					drv_inf.dr_cb.rst_n<='b1;
					drv_inf.dr_cb.push<='b1;
					drv_inf.dr_cb.pop<='b1;
					drv_inf.dr_cb.in_data<=drv_seq_item.in_data;
		end
		`uvm_info(get_name(),"push operation done........\n",UVM_HIGH)
endtask

task fifo_driver::pop_operation();
	`uvm_info(get_name(),"inside the pop_operation\n",UVM_HIGH)
		begin
			@(drv_inf.dr_cb)
				drv_inf.dr_cb.rst_n<='b1;
				drv_inf.dr_cb.push<='b0;
				drv_inf.dr_cb.pop<='b1;
		end
	`uvm_info(get_name(),"pop operation done\n",UVM_HIGH)
endtask




		












