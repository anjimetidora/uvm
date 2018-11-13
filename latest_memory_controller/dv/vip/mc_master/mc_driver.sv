class mc_driver extends uvm_driver#(mc_sequence_item);

`uvm_component_utils(mc_driver)

mc_sequence_item seq_item;

virtual mc_interface vif;

function new(string name="mc_driver",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction


function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	if(!uvm_config_db#(virtual mc_interface)::get (.cntxt(this),
																									.inst_name(""),
																									.field_name("vif"),
																									.value(vif)))
	`uvm_fatal("get_interface","virtual interface is not available")
	else
	  `uvm_info(get_name(),("virtual interface is connected"),UVM_HIGH)
endfunction

virtual task run_phase(uvm_phase phase);
//  reset();
  drive();
endtask


virtual task reset(mc_sequence_item seq_item);
  @(posedge vif.clk)
		vif.w_r<='b0;                                                    
		vif.in_data<='b0;                                                   
		vif.en<='b0;                                                      
		vif.wr_addr<='b0;  
		seq_item.print();
		`uvm_info(get_name(),("reset operation performed............."),UVM_HIGH)
		
endtask

virtual task drive();
forever
begin
  seq_item_port.get_next_item(seq_item);
  if(seq_item.w_r==1)
		write(seq_item);
	else 
		read(seq_item);
	  
		seq_item_port.item_done();
	end
endtask


task write(mc_sequence_item seq_item);
	@(posedge vif.clk);
	vif.w_r<=seq_item.w_r;
	vif.in_data<=seq_item.in_data;
	vif.en<=seq_item.en;
	vif.wr_addr<=seq_item.wr_addr;
	`uvm_info(get_name(),("write operation performed............."),UVM_HIGH)
  $display("/************************driving write sequence to dut***************************************/");
	seq_item.print();
  endtask


  task read(mc_sequence_item seq_item);
		@(posedge vif.clk);
	vif.w_r<=seq_item.w_r;
	vif.en<=seq_item.en;
	vif.wr_addr<=seq_item.wr_addr;
	`uvm_info(get_name(),("read operation performed............."),UVM_HIGH)
  $display("/************************driving read sequence to dut***************************************/");
	seq_item.print();
  endtask



endclass
