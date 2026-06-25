transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Devangi/Documents/SOC_2026/week3/vending_machine/vending_machine.vhd}

vcom -93 -work work {C:/Users/Devangi/Documents/SOC_2026/week3/vending_machine/tb_vending_machine.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_vending_machine

add wave *
view structure
view signals
run -all
