quit -sim

vlib work;

vlog ../*.v

vlog *.v

vsim work.test_S_Machine -Lf 220model_ver -Lf altera_mf_ver -Lf verilog

do S_Machine.do

run 400ns