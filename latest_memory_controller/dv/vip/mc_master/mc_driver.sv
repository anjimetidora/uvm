class mc_driver extends uvm_driver#(mc_sequence_item);

`uvm_component_utils(mc_driver)

virtual mc_interface vif;
function new(string name="mc_driver",uvm_component parent);
  super.new(name,parent);
endfunction
function build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction


function connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	if(!uvm_config_db#(virtual mc_interface)::get (.cntxt(this),
													.inst_name(""),
													.field_name("vif"),
													.value(vif)))
	`uvm_fatal("get_interface""virtual interface is not available")
	else
	  `uvm_vifo(get_name(),$sformate ("virtual interface is connected"),UVM_HIGH)

endfunction

task run_phase();
  reset();
  drive();
endtask


task reset();
  `uvm_info(get_name(),"reset operation performed.............")
  vif.drv_cb.reset='b0;
  @(posedge vif.clk)
	vif.drv_cb.reset='b1;	
endtask

task drive(mc_sequence_item seq_item);
	  if(vif.wr==1)
		write(seq_item);
	  else 
		read(seq_item);
endtask


task write(seq_item);
	vif.drv_cb.reset<='b1;
	vif.drv_cb.w_r<=seq_item.w_r;
	vif.drv_cb.in_data<='d24;
	vif.drv_cb.en<=seq_item.en;
	vif.drv_cb.wr_addr<=seq_item.wr_addr;
	`uvm_info(get_name(),"write operation performed.............")
  endtask


  task read(seq_item);
	vif.drv_cb.reset<='b1;
	vif.drv_cb.w_r<=seq_item.w_r;
	vif.drv_cb.en<=seq_item.en;
	vif.drv_cb.wr_addr<=seq_item.wr_addr;
	`uvm_info(get_name(),"read operation performed.............")
  endtask

endtask


endclass
