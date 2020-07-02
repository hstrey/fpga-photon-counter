set projDir "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/vivado"
set projName "photorate"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/au_top_0.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/reset_conditioner_1.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/multi_seven_seg_2.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/counter_3.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/timer_4.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/bin_to_dec_5.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/count_pulses_6.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/counter_7.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/seven_seg_8.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/decoder_9.v" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/verilog/edge_detector_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/constraint/io.xdc" "/home/streylab/Documents/programming/fpga-photon-counter/photorate/work/constraint/alchitry.xdc" "/home/streylab/Desktop/fpga/alchitry-labs-1.1.5/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
