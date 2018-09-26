
UVM_VERBOSITY = UVM_MEDIUM
TEST = mc_test

VCS =	vsim -sverilog -uvm -timescale=1ns/1ns\
			+incdir+$(UVM_HOME)/src\
			$(UVM_HOME)/src/uvm.sv\
			$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS\
			-debug_access+all -lca -kdb -l compile.log

SIMV = ./simv +UVM_VERBOSITY=$(UVM_VERBOSITY) \
	+UVM_TESTNAME=$(TEST) +UVM_TR_RECORD +UVM_LOG_RECORD \
	+verbose=1 +ntb_random_seed=244 -l $(TEST).log\


all:	comp run 

comp:
	$(VCS) -f flist

run:
	$(SIMV)

verdi:
	verdi -ssf mc.fsdb -nologo &

clean:
	rm -rf coverage.vdb csrc DVEfiles inter.vpd simv simv.daidir ucli.key vc_hdrs.h *.log* .inter.vpd.uvm *.nfs* *.fsdb* *novas* verdiLog .*vcs* *.vpd*	*Log*




#UVM_HOME = /nfs/site/eda/data/eda_0006/accellera/uvm/1.1d/common
#UVM_VERBOSITY = UVM_MEDIUM
#
#clean:
#		rm -fr *.log csrc simv.daidir ucli.key vc_hdrs.h simv
#compile:
#	vcs -sverilog -uvm -timescale=1ns/1ns \
#	 +vpi -PP \
#	+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
#	+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
#	$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -l compile.log -debug_all +incdir+$TB/verif/mc_top.sv
#
#run:
#			./simv +UVM_VERBOSITY=$(UVM_VERBOSITY) \
#			+UVM_TR_RECORD +UVM_LOG_RECORD \
#			+verbose=1 -l run.log
	#+simv+fsdbfile+high.fsdb


#VCS =	vcs -sverilog -uvm -timescale=1ns/1ns \
	 +vpi -PP \
	+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
	+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
	$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -l compile.log -debug_access+all -lca -kdb
	#$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -l compile.log -debug_all
	#-cm line+cond+fsm+branch+tgl -cm_dir ./coverage.vdb \


#UVM_HOME = /nfs/site/eda/data/eda_0006/accellera/uvm/1.1d/common

