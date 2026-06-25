transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/20.1/quartus/bin64/week2/mod_counter/mod_counter.vhd}

vcom -93 -work work {C:/intelFPGA_lite/20.1/quartus/bin64/week2/mod_counter/tb_mod_counter.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_mod_counter

add wave *
view structure
view signals
run -all
