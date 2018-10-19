class mc_monitor extends uvm_monitor;
`uvm_component_utils(mc_monitor)

virtual mc_interface vif;
uvm_analysis_port#(mc_sequence_item) data_out;

function new(string name="mc_monitor",uvm_component parent);
  super.new(name,parent);
endfunction


function build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction

function connect_phase(uvm_phase phase);
  super.connect_phase(phase);
	if(!uvm_config_db#(mc_interface)::get(.contxt(this),
										  .inst_name(""),
										  .field_name("mc_interface"),
										  .value(vif)))
  `uvm_error("get_interface""virtual interface is not available")
  else
	`uvm_info(get_name(),$sformate,"virtual interface is connected")
endfunction


task run_phase();

  forever
begin
	if(vif.mon_cb.w_r=='b1)
	begin
	data_out.reset<=vif.mon_cb.reset;
	data_out.w_r<=vif.mon_cb.w_r;
	data_out.in_data<=vif.mon_cb.in_data;
	data_out.en<=vif.mon_cb.en;
	data_out.wr_addr<=vif.mon_cb.wr_addr;
	data_out.data_out<=vif.mon_cb.data_out;
	data_out.error<=vif.mon_cb.error;
	end
	if(vif.mon_cb.w_r=='b0)
	begin
	  	if(vif.mon_cb.w_r=='b1)
	begin
	data_out.reset<=vif.mon_cb.reset;
	data_out.w_r<=vif.mon_cb.w_r;
	data_out.in_data<=vif.mon_cb.in_data;
	data_out.en<=vif.mon_cb.en;
	data_out.wr_addr<=vif.mon_cb.wr_addr;
	data_out.data_out<=vif.mon_cb.data_out;
	data_out.error<=vif.mon_cb.error;
	end

end
$monitor("data_monitor=%0p",data_out);
data_out.write(req);
endtask






