quit -sim

vlib work;

vlog *.v

vsim work.test_FSM -Lf 220model_ver -Lf altera_mf_ver -Lf verilog

do FSM.do

run 100ns