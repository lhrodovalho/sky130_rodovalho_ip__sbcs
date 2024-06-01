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
  let run = 1
  echo "num,corner,vdd,run,io" > ./meas/tb_sbcs_mc.meas#num
  dowhile run <= 1000
    reset
    *op
    *let io   = i(v_isource)
    tran 100n 10u uic
    meas tran io find i(v_isource) at=10u
    print io
    echo "#num,#corner,#vdd,$&run,$&io" >> ./meas/tb_sbcs_mc.meas#num
    destroy all
    let run = run+1
  end		  
.endc

.end 
