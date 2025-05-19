# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "gnd" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vdd" -parent ${Page_0}


}

proc update_PARAM_VALUE.gnd { PARAM_VALUE.gnd } {
	# Procedure called to update gnd when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.gnd { PARAM_VALUE.gnd } {
	# Procedure called to validate gnd
	return true
}

proc update_PARAM_VALUE.vdd { PARAM_VALUE.vdd } {
	# Procedure called to update vdd when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vdd { PARAM_VALUE.vdd } {
	# Procedure called to validate vdd
	return true
}


proc update_MODELPARAM_VALUE.vdd { MODELPARAM_VALUE.vdd PARAM_VALUE.vdd } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vdd}] ${MODELPARAM_VALUE.vdd}
}

proc update_MODELPARAM_VALUE.gnd { MODELPARAM_VALUE.gnd PARAM_VALUE.gnd } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.gnd}] ${MODELPARAM_VALUE.gnd}
}

