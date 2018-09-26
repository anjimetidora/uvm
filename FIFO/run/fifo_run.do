
# clear the console
clear

# create project library and make sure it is empty
alib work
adel -all

#transcript file lab9_factory_fifo_comp.log

# compile project's source file (alongside the UVM library)
alog $UVMCOMP -dbg  -f flist 

transcript file lab9_factory_fifo_run.log

# run simulation
# asim +access +rw $UVMSIM top +UVM_TESTNAME=rand_test +UVM_VERBOSITY=UVM_HIGH 
asim +access +rw $UVMSIM top +UVM_VERBOSITY=UVM_HIGH 
wave -rec sim:/top/*
run -all
fcover report -html

