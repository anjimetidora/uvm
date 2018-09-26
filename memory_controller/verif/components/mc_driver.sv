class mc_driver extends uvm_driver #(mc_seq_item);
	`uvm_component_utils(mc_driver)

	virtual mc_interface inf;
	mc_seq_item req;

	function new(string name="mc_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	if(!uvm_config_db#(virtual mc_interface)::get(this,"","mc_inf",inf))
		`uvm_fatal("NO_VIF",{"virtual inf must be set for:",get_full_name(),".inf"});
	endfunction
	task pre_rest_phase(uvm_phase phase);
		phase.raise_objection(this);
		inf.reset<='b1;
		$display("pre_reset_phase");
		#1;
		phase.drop_objection(this);
	endtask
	task reset_phase(uvm_phase phase);
		phase.raise_objection(this);
		inf.reset='b0;
		$display("reset_phase");
		#10
		inf.reset='b1;
		$display("not reset_phase");
		phase.drop_objection(this);
	endtask

	task run_phase(uvm_phase phase);
	forever begin
		$display("driver run_phase after forever");
		seq_item_port.get_next_item(req);
		$display("driver run_phase before drive task");
		drive(req);
		$display("driver run_phase after drive task");
		seq_item_port.item_done();
		$display("driver run_phase after item");
	req.print();
	end
endtask

task drive(mc_seq_item req);
$display("driver_1");
inf.driver_cb.wr_en<='b0;
inf.driver_cb.rd_en<='b0;
$display("driver_1.1");
@(posedge inf.clk);
$display("driver_2");
inf.driver_cb.addr<=req.addr;
if(req.wr_en)
begin
$display("driver_3");
	inf.driver_cb.wr_en<=req.wr_en;
	inf.driver_cb.wdata<=req.wdata;
	end
	if(req.rd_en)
	begin
		inf.driver_cb.rd_en<=req.rd_en;
		@(posedge inf.clk);
		inf.driver_cb.rd_en<='b0;
	end
	$display("-------------------------------------------------");
endtask
endclass

