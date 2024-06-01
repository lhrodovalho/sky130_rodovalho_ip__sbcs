v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 200 -340 240 -340 { lab=avdd}
N 200 -320 240 -320 { lab=avss}
N 200 -400 240 -400 { lab=en}
N 200 -380 240 -380 { lab=enb}
N 80 -120 80 -100 { lab=avss}
N 80 -200 80 -180 { lab=GND}
N 240 -120 240 -100 { lab=avss}
N 80 -100 240 -100 { lab=avss}
N 80 -200 160 -200 { lab=GND}
N 240 -200 320 -200 { lab=avdd}
N 160 -200 160 -180 { lab=GND}
N 240 -200 240 -180 { lab=avdd}
N 480 -120 480 -100 { lab=avss}
N 480 -200 560 -200 { lab=isource}
N 480 -200 480 -180 { lab=isource}
N 200 -300 240 -300 { lab=avss}
N 420 -540 460 -540 { lab=isource}
N 420 -480 460 -480 { lab=avss}
N 640 -460 640 -440 { lab=avss}
N 640 -540 720 -540 { lab=en}
N 640 -540 640 -520 { lab=en}
N 640 -320 640 -300 { lab=avss}
N 640 -400 720 -400 { lab=enb}
N 640 -300 720 -300 { lab=avss}
N 640 -400 640 -380 { lab=enb}
N 240 -100 320 -100 { lab=avss}
N 480 -100 560 -100 { lab=avss}
N 640 -440 720 -440 { lab=avss}
C {devices/title.sym} 160 -40 0 0 {name=l6 author="Luis Henrique Rodovalho"}
C {devices/lab_pin.sym} 200 -340 0 0 {name=lavdd1 sig_type=std_logic lab=avdd}
C {devices/lab_pin.sym} 200 -320 0 0 {name=lavss1 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 200 -400 0 0 {name=len1 sig_type=std_logic lab=en}
C {devices/lab_pin.sym} 200 -380 0 0 {name=lenb1 sig_type=std_logic lab=enb}
C {devices/vsource.sym} 80 -150 0 0 {name=v_avss value=xavss}
C {devices/vsource.sym} 240 -150 0 0 {name=v_avdd value="dc \{xavdd\} ac \{xavdd_ac\}"}
C {devices/lab_pin.sym} 320 -200 0 1 {name=lavdd0 sig_type=std_logic lab=avdd}
C {devices/gnd.sym} 160 -180 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 480 -150 0 0 {name=v_isource value="\{xvsource\}"}
C {devices/lab_pin.sym} 560 -200 0 1 {name=lcm0 sig_type=std_logic lab=isource}
C {devices/code_shown.sym} 40 -730 0 0 {name=header only_toplevel=false value="
* Include SkyWater sky130 device models
.lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 25
"
}
C {devices/code_shown.sym} 1060 -730 0 0 {name=control only_toplevel=false value="
.option rshunt=1e12
.option gmin = 1e-12
.option method=Gear
.ic v(avdd) = \{xavdd\}
.control
  op
  dc v_avdd 3.6 1.0 -10m
  plot i(v_isource)
  dc temp 125 -55 -5
  plot i(v_isource)
  tran 100n 20u 100n uic
  plot i(v_isource) ylimit 0 50u
  print op.i(v_isource)
.endc
"}
C {devices/code_shown.sym} 740 -730 0 0 {name=params only_toplevel=false value="
.param xavdd = 3.3
.param xavss = 0

.param xen      =  1
.param xvsource = 0

.param xavdd_ac = 1
"}
C {devices/lab_pin.sym} 200 -300 0 0 {name=lavss5 sig_type=std_logic lab=avss}
C {sbcs.sym} 240 -280 0 0 {name=Xdut}
C {devices/lab_pin.sym} 460 -540 0 1 {name=lcm1 sig_type=std_logic lab=isource}
C {devices/lab_pin.sym} 460 -480 0 1 {name=lcm2 sig_type=std_logic lab=avss
}
C {devices/vsource.sym} 640 -490 0 0 {name=v_en value="dc \{xavdd*xen\} pulse(0 \{xavdd\} 100n 10n 10n)"}
C {devices/lab_pin.sym} 720 -540 0 1 {name=lcm3 sig_type=std_logic lab=en}
C {devices/vsource.sym} 640 -350 0 0 {name=v_en1 value="dc \{xavdd*(1-xen)\} pulse(\{xavdd\} 0 100n 10n 10n)"}
C {devices/lab_pin.sym} 720 -400 0 1 {name=lcm4 sig_type=std_logic lab=enb}
C {devices/lab_pin.sym} 720 -300 0 1 {name=lavss7 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 320 -100 0 1 {name=lavss2 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 560 -100 0 1 {name=lavss3 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 720 -440 0 1 {name=lavss4 sig_type=std_logic lab=avss}
