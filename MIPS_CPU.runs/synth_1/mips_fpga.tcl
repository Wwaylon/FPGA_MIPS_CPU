# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.cache/wt [current_project]
set_property parent.project_path C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo c:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/cmpe140ass7/memfile.dat
read_verilog -library xil_defaultlib {
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/adder.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/alu.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/control_unit/auxdec.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/basys3_single_cycle_mips_validation/button_debouncer.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/basys3_single_cycle_mips_validation/clk_gen.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/control_unit/controlunit.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/d_e_stage_reg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/datapath.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/memory/dmem.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/dreg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/e_m_stage_reg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/f_d_stage_reg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/basys3_single_cycle_mips_validation/hex_to_7seg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/hilo_reg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/memory/imem.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/basys3_single_cycle_mips_validation/led_mux.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/m_wb_stage_reg.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/control_unit/maindec.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/mips/mips.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/mips/mips_top.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/multiply.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/mux2.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/new/mux3.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/regfile.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/single_cycle_mips_source_initial/datapath/signext.v
  C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/sources_1/imports/basys3_single_cycle_mips_validation/mips_fpga.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/constrs_1/imports/basys3_single_cycle_mips_validation/mips_fpga.xdc
set_property used_in_implementation false [get_files C:/Users/Waylon/Desktop/Code/MIPS_CPU/MIPS_CPU.srcs/constrs_1/imports/basys3_single_cycle_mips_validation/mips_fpga.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top mips_fpga -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mips_fpga.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mips_fpga_utilization_synth.rpt -pb mips_fpga_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
