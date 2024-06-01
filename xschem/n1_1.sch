v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -80 -0 -40 0 { lab=G}
N 0 150 0 200 { lab=S}
N -0 -80 -0 -30 { lab=D}
N 0 30 -0 90 { lab=X[1:0]}
N -60 -0 -60 120 { lab=G}
N -60 120 -40 120 { lab=G}
N 40 120 80 120 { lab=B}
N 0 120 40 120 { lab=B}
N 40 0 40 120 { lab=B}
N 0 -0 40 0 { lab=B}
N 0 60 80 60 { lab=X[1:0]}
C {devices/lab_pin.sym} -80 0 0 0 {name=l1 sig_type=std_logic lab=G}
C {devices/lab_pin.sym} 0 -80 3 1 {name=l3 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 0 200 1 1 {name=l4 sig_type=std_logic lab=S}
C {devices/iopin.sym} 150 0 0 0 {name=p1 lab=D}
C {devices/iopin.sym} 150 40 0 0 {name=p2 lab=G}
C {devices/iopin.sym} 150 80 0 0 {name=p3 lab=S}
C {devices/iopin.sym} 150 120 0 0 {name=p4 lab=B}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -20 0 0 0 {name=MD[3:0]
L=1.0
W=7
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -20 120 0 0 {name=MS[3:0]
L=1.0
W=7
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 80 60 0 1 {name=l5 sig_type=std_logic lab=X[3:0]}
C {devices/lab_pin.sym} 80 120 0 1 {name=l6 sig_type=std_logic lab=B}
