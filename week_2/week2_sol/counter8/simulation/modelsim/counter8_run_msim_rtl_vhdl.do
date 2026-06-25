transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/20.1/quartus/bin64/week2/counter8/counter8.vhd}

vcom -93 -work work {C:/intelFPGA_lite/20.1/quartus/bin64/week2/counter8/tb_counter8.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_counter8

add wave *
view structure
view signals
run -all
