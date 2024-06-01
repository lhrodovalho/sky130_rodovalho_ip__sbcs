v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 440 -560 480 -560 { lab=isource}
N 440 -500 480 -500 { lab=isink}
N 220 -360 260 -360 { lab=avdd}
N 220 -340 260 -340 { lab=avss}
N 220 -320 260 -320 { lab=vsub}
N 220 -420 260 -420 { lab=en}
N 220 -400 260 -400 { lab=enb}
N 220 -280 260 -280 { lab=bpa0}
N 220 -260 260 -260 { lab=bpa}
N 220 -240 260 -240 { lab=bpb}
N 220 -220 260 -220 { lab=x}
N 220 -200 260 -200 { lab=y}
N 220 -180 260 -180 { lab=bn0}
N 220 -160 260 -160 { lab=bn}
N 220 -140 260 -140 { lab=z}
C {devices/title.sym} 160 -40 0 0 {name=l1 author="Luis Henrique Rodovalho"}
C {devices/iopin.sym} 50 -570 0 0 {name=p1 lab=isink}
C {devices/iopin.sym} 50 -600 0 0 {name=p2 lab=isource}
C {devices/ipin.sym} 70 -510 0 0 {name=p3 lab=enb}
C {devices/ipin.sym} 70 -540 0 0 {name=p4 lab=en}
C {devices/iopin.sym} 50 -450 0 0 {name=p5 lab=avss}
C {devices/iopin.sym} 50 -480 0 0 {name=p6 lab=avdd}
C {sbcs_slice.sym} 260 -120 0 0 {name=xslice[1:0]}
C {devices/iopin.sym} 50 -420 0 0 {name=p7 lab=vsub}
C {devices/lab_wire.sym} 220 -360 0 0 {name=l2 sig_type=std_logic lab=avdd}
C {devices/lab_wire.sym} 220 -340 0 0 {name=l3 sig_type=std_logic lab=avss}
C {devices/lab_wire.sym} 220 -320 0 0 {name=l4 sig_type=std_logic lab=vsub}
C {devices/lab_wire.sym} 220 -420 0 0 {name=l5 sig_type=std_logic lab=en}
C {devices/lab_wire.sym} 220 -400 0 0 {name=l6 sig_type=std_logic lab=enb}
C {devices/lab_wire.sym} 220 -280 0 0 {name=l7 sig_type=std_logic lab=bpa0}
C {devices/lab_wire.sym} 220 -260 0 0 {name=l8 sig_type=std_logic lab=bpa}
C {devices/lab_wire.sym} 220 -240 0 0 {name=l9 sig_type=std_logic lab=bpb}
C {devices/lab_wire.sym} 220 -220 0 0 {name=l10 sig_type=std_logic lab=x}
C {devices/lab_wire.sym} 220 -200 0 0 {name=l11 sig_type=std_logic lab=y}
C {devices/lab_wire.sym} 220 -180 0 0 {name=l12 sig_type=std_logic lab=bn0}
C {devices/lab_wire.sym} 220 -160 0 0 {name=l13 sig_type=std_logic lab=bn}
C {devices/lab_wire.sym} 220 -140 0 0 {name=l14 sig_type=std_logic lab=z}
C {devices/lab_wire.sym} 480 -560 0 1 {name=l15 sig_type=std_logic lab=isource}
C {devices/lab_wire.sym} 480 -500 0 1 {name=l16 sig_type=std_logic lab=isink}
