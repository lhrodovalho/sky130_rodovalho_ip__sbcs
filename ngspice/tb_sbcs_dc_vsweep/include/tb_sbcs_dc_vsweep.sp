* num: #num corner: #corner vdd: #vdd temp: #temp

* Include SkyWater sky130 device models
.lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice #corner
.temp #temp

.include ../../netlists/sbcs.spice

* Simulation parameters
.param xavdd  = #vdd
.param xavss  = 0

.param xavdd_ac = 1
.param xen      =  1
.param xvsource = 0

* Voltage supplies
v_avdd avdd avss dc {xavdd} ac {xavdd_ac} 
v_avss 0    avss xavss
v_en  en  avss dc {xavdd*xen} pulse(0 {xavdd} 100n 10n 10n) 
v_enb enb avss dc {xavdd*(1-xen)} pulse({xavdd} 0 100n 10n 10n) 
v_isource isource avss {xvsource} 

* Design Under Test
Xdut isource avss en enb avdd avss avss sbcs

* Simulation control
.option rshunt = 1e12
.control
  dc v_avdd 3.6 1.0 -10m
  let io   = i(v_isource)
  let psrr = 20*log10(abs(io/deriv(io)))
  meas dc io3p3   find io   at=3.3
  meas dc psrr3p3 find psrr at=3.3

  plot io
  plot psrr
  
  print io3p3
  echo "num,corner,vdd,i3p3" > ./meas/tb_sbcs_dc_vsweep.meas#num
  echo "#num,#corner,#vdd,$&io3p3" >> ./meas/tb_sbcs_dc_vsweep.meas#num

  wrdata ./data/tb_sbcs_dc_vsweep_io.dat#num   io
  wrdata ./data/tb_sbcs_dc_vsweep_psrr.dat#num psrr

.endc

.end 
