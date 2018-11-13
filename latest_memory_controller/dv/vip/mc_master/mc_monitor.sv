class mc_monitor extends uvm_monitor;
`uvm_component_utils(mc_monitor)

mc_sequence_item mon_req;

virtual mc_interface vif;
uvm_analysis_port#(mc_sequence_item) ap;

function new(string name="mc_monitor",uvm_component parent);
  super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
  super.build_phase(phase);
   this.ap=new("ap",this);  
   mon_req=mc_sequence_item::type_id::create("mon_req",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
	if(!uvm_config_db#(virtual mc_interface)::get(.cntxt(this),
																								.inst_name(""),
																								.field_name("vif"),
																							  .value(vif)))
  `uvm_error("get_interface","virtual interface is not available")
  else
	`uvm_info(get_name(),$sformatf("virtual interface is connected"),UVM_HIGH)
endfunction


virtual task run_phase(uvm_phase phase);
	$display("/******************************before forever******************************************/");
forever
begin
	@(posedge vif.clk);
		mon_req.w_r=vif.mon_cb.w_r;
	mon_req.in_data=vif.mon_cb.in_data;
	mon_req.en=vif.mon_cb.en;
	mon_req.wr_addr=vif.mon_cb.wr_addr;
	mon_req.data_out=vif.mon_cb.data_out;
	mon_req.slv_error=vif.mon_cb.slv_error;
	$display("/******************************monitor block  signals******************************************/");
	mon_req.print();
ap.write(mon_req);
//end
//	if(!vif.w_r)
//	begin
//			mon_req.w_r=vif.mon_cb.w_r;
//	mon_req.in_data=vif.mon_cb.in_data;
//	mon_req.en=vif.mon_cb.en;
//	mon_req.wr_addr=vif.mon_cb.wr_addr;
//	mon_req.data_out=vif.mon_cb.data_out;
//	mon_req.slv_error=vif.mon_cb.slv_error;
//	$display("/******************************monitor block read signals******************************************/");
//	mon_req.print();
//
//	end
end
endtask
//  forever
//	  $display("this is monitor block......................///////////////////////");
//begin
//	@(posedge vif.mon_cb.clk)
//  if(vif.mon_cb.w_r=='b1)
//	begin
//	  $display("this is monitor block......................///////////////////////");
//	mon_req.w_r=vif.mon_cb.w_r;
//	mon_req.in_data=vif.mon_cb.in_data;
//	mon_req.en=vif.mon_cb.en;
//	mon_req.wr_addr=vif.mon_cb.wr_addr;
//	mon_req.data_out=vif.mon_cb.data_out;
//	mon_req.slv_error=vif.mon_cb.slv_error;
//	mon_req.print();
//    end
//	if(vif.mon_cb.w_r=='b0)
//	begin
//	mon_req.w_r=vif.mon_cb.w_r;
//	mon_req.in_data=vif.mon_cb.in_data;
//	mon_req.en=vif.mon_cb.en;
//	mon_req.wr_addr=vif.mon_cb.wr_addr;
//	mon_req.data_out=vif.mon_cb.data_out;
//	mon_req.slv_error=vif.mon_cb.slv_error;
//    end
//	mon_req.print();
//	$display("monitor data=%0p",mon_req);
//end
//
//endtask
endclass






