quit -sim

vlib work;

vlog *.v

vsim work.test_Inst -Lf 220model_ver -Lf altera_mf_ver -Lf verilog

do Inst.do

run 50ns