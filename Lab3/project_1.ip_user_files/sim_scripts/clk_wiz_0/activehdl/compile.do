transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {}
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic" -l xpm -l xil_defaultlib \
"/home/jcr/mnt/vivado/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/jcr/mnt/vivado/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" -l xpm -l xil_defaultlib \
"../../../../project_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../project_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

