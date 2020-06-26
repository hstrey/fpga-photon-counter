set projDir "/home/parallels/Desktop/fpga/complicated_blinker/work/vivado"
set projName "complicated_blinker"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/parallels/Desktop/fpga/complicated_blinker/work/verilog/au_top_0.v" "/home/parallels/Desktop/fpga/complicated_blinker/work/verilog/reset_conditioner_1.v" "/home/parallels/Desktop/fpga/complicated_blinker/work/verilog/edge_detector_2.v" "/home/parallels/Desktop/fpga/complicated_blinker/work/verilog/cblinker_3.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/parallels/tools/alchitry-labs-1.1.5/library/components/au.xdc" "/home/parallels/Desktop/fpga/complicated_blinker/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
