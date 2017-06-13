# TCL File Generated by Component Editor 16.1
# Tue May 16 09:12:37 CEST 2017
# DO NOT MODIFY


# 
# AspBlock "AspBlock" v1.0
# Franz Steinbacher 2017.05.16.09:12:37
# Audio Signal Processing Block with left and right channel
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module AspBlock
# 
set_module_property DESCRIPTION "Audio Signal Processing Block with left and right channel"
set_module_property NAME AspBlock
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "ASP-SoC IP/Audio"
set_module_property AUTHOR "Franz Steinbacher"
set_module_property DISPLAY_NAME AspBlock
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false

set_module_property EDITABLE false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL AspBlock
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file Flanger-Rtl-a.vhd VHDL PATH ../../../grpAudio/unitFlanger/src/Flanger-Rtl-a.vhd
add_fileset_file Flanger-e.vhd VHDL PATH ../../../grpAudio/unitFlanger/src/Flanger-e.vhd
add_fileset_file AspBlock-Struct-a.vhd VHDL PATH ../hdl/AspBlock-Struct-a.vhd
add_fileset_file Global-p.vhd VHDL PATH ../../../grpPackages/pkgGlobal/src/Global-p.vhd
add_fileset_file AspBlock-e.vhd VHDL PATH ../hdl/AspBlock-e.vhd TOP_LEVEL_FILE
add_fileset_file fixed_float_types_c.vhdl VHDL PATH ../../../grpPackages/pkgFixed/src/fixed_float_types_c.vhdl
add_fileset_file fixed_pkg_c.vhdl VHDL PATH ../../../grpPackages/pkgFixed/src/fixed_pkg_c.vhdl


# 
# parameters
# 
add_parameter gDataWidth NATURAL 24 ""
set_parameter_property gDataWidth DEFAULT_VALUE 24
set_parameter_property gDataWidth DISPLAY_NAME gDataWidth
set_parameter_property gDataWidth WIDTH ""
set_parameter_property gDataWidth TYPE NATURAL
set_parameter_property gDataWidth UNITS None
set_parameter_property gDataWidth ALLOWED_RANGES {16 24 32}
set_parameter_property gDataWidth DESCRIPTION ""
set_parameter_property gDataWidth HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock csi_clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset rsi_reset_n reset_n Input 1


# 
# connection point s0
# 
add_interface s0 avalon end
set_interface_property s0 addressUnits WORDS
set_interface_property s0 associatedClock clock
set_interface_property s0 associatedReset reset
set_interface_property s0 bitsPerSymbol 8
set_interface_property s0 burstOnBurstBoundariesOnly false
set_interface_property s0 burstcountUnits WORDS
set_interface_property s0 explicitAddressSpan 0
set_interface_property s0 holdTime 0
set_interface_property s0 linewrapBursts false
set_interface_property s0 maximumPendingReadTransactions 0
set_interface_property s0 maximumPendingWriteTransactions 0
set_interface_property s0 readLatency 0
set_interface_property s0 readWaitTime 1
set_interface_property s0 setupTime 0
set_interface_property s0 timingUnits Cycles
set_interface_property s0 writeWaitTime 0
set_interface_property s0 ENABLED true
set_interface_property s0 EXPORT_OF ""
set_interface_property s0 PORT_NAME_MAP ""
set_interface_property s0 CMSIS_SVD_VARIABLES ""
set_interface_property s0 SVD_ADDRESS_GROUP ""

add_interface_port s0 avs_s0_write write Input 1
add_interface_port s0 avs_s0_address address Input 3
add_interface_port s0 avs_s0_writedata writedata Input 32
add_interface_port s0 avs_s0_readdata readdata Output 32
set_interface_assignment s0 embeddedsw.configuration.isFlash 0
set_interface_assignment s0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point debug
# 
add_interface debug conduit end
set_interface_property debug associatedClock clock
set_interface_property debug associatedReset reset
set_interface_property debug ENABLED true
set_interface_property debug EXPORT_OF ""
set_interface_property debug PORT_NAME_MAP ""
set_interface_property debug CMSIS_SVD_VARIABLES ""
set_interface_property debug SVD_ADDRESS_GROUP ""

add_interface_port debug coe_debug export Output 24


# 
# connection point enable
# 
add_interface enable conduit end
set_interface_property enable associatedClock clock
set_interface_property enable associatedReset ""
set_interface_property enable ENABLED true
set_interface_property enable EXPORT_OF ""
set_interface_property enable PORT_NAME_MAP ""
set_interface_property enable CMSIS_SVD_VARIABLES ""
set_interface_property enable SVD_ADDRESS_GROUP ""

add_interface_port enable coe_enable export Input 1


# 
# connection point left_source
# 
add_interface left_source avalon_streaming start
set_interface_property left_source associatedClock clock
set_interface_property left_source associatedReset reset
set_interface_property left_source dataBitsPerSymbol 8
set_interface_property left_source errorDescriptor ""
set_interface_property left_source firstSymbolInHighOrderBits true
set_interface_property left_source maxChannel 0
set_interface_property left_source readyLatency 0
set_interface_property left_source ENABLED true
set_interface_property left_source EXPORT_OF ""
set_interface_property left_source PORT_NAME_MAP ""
set_interface_property left_source CMSIS_SVD_VARIABLES ""
set_interface_property left_source SVD_ADDRESS_GROUP ""

add_interface_port left_source aso_left_data data Output gdatawidth
add_interface_port left_source aso_left_valid valid Output 1


# 
# connection point right_source
# 
add_interface right_source avalon_streaming start
set_interface_property right_source associatedClock clock
set_interface_property right_source associatedReset reset
set_interface_property right_source dataBitsPerSymbol 8
set_interface_property right_source errorDescriptor ""
set_interface_property right_source firstSymbolInHighOrderBits true
set_interface_property right_source maxChannel 0
set_interface_property right_source readyLatency 0
set_interface_property right_source ENABLED true
set_interface_property right_source EXPORT_OF ""
set_interface_property right_source PORT_NAME_MAP ""
set_interface_property right_source CMSIS_SVD_VARIABLES ""
set_interface_property right_source SVD_ADDRESS_GROUP ""

add_interface_port right_source aso_right_data data Output gdatawidth
add_interface_port right_source aso_right_valid valid Output 1


# 
# connection point right_sink
# 
add_interface right_sink avalon_streaming end
set_interface_property right_sink associatedClock clock
set_interface_property right_sink associatedReset reset
set_interface_property right_sink dataBitsPerSymbol 8
set_interface_property right_sink errorDescriptor ""
set_interface_property right_sink firstSymbolInHighOrderBits true
set_interface_property right_sink maxChannel 0
set_interface_property right_sink readyLatency 0
set_interface_property right_sink ENABLED true
set_interface_property right_sink EXPORT_OF ""
set_interface_property right_sink PORT_NAME_MAP ""
set_interface_property right_sink CMSIS_SVD_VARIABLES ""
set_interface_property right_sink SVD_ADDRESS_GROUP ""

add_interface_port right_sink asi_right_data data Input gdatawidth
add_interface_port right_sink asi_right_valid valid Input 1


# 
# connection point left_sink
# 
add_interface left_sink avalon_streaming end
set_interface_property left_sink associatedClock clock
set_interface_property left_sink associatedReset reset
set_interface_property left_sink dataBitsPerSymbol 8
set_interface_property left_sink errorDescriptor ""
set_interface_property left_sink firstSymbolInHighOrderBits true
set_interface_property left_sink maxChannel 0
set_interface_property left_sink readyLatency 0
set_interface_property left_sink ENABLED true
set_interface_property left_sink EXPORT_OF ""
set_interface_property left_sink PORT_NAME_MAP ""
set_interface_property left_sink CMSIS_SVD_VARIABLES ""
set_interface_property left_sink SVD_ADDRESS_GROUP ""

add_interface_port left_sink asi_left_data data Input gdatawidth
add_interface_port left_sink asi_left_valid valid Input 1
