module wave(out,a,clk);
input a,clk;
output out;
wire nclk,nt0,nt1,nt2,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,t2,t1,t0;

//make the inverse of clock
pmos (nclk,VDD,clk);
nmos (nclk,VSS,clk);

//t flip flop for nt0
pmos (w0,w1,clk);
nmos (w0,w1,nclk);
pmos (w0,nt0,nclk);
nmos (w0,nt0,clk);

pmos (w2,VDD,w0);
nmos (w2,VSS,w0);

pmos (w1,VDD,w2);
nmos (w1,VSS,w2);

pmos (nt0,w3,nclk);
nmos (nt0,w3,clk);
pmos (nt0,w2,clk);
nmos (nt0,w2,nclk);

pmos (t0,VDD,nt0);
nmos (t0,VSS,nt0);

pmos (w3,VDD,t0);
nmos (w3,VSS,t0);

//t flip flop for nt1
pmos (w4,w5,t0);
nmos (w4,w41,nt0);
pmos (w4,nt1,nt0);
nmos (w4,nt1,t0);

pmos (w6,VDD,w4);
nmos (w6,VSS,w4);

pmos (w5,VDD,w6);
nmos (w5,VSS,w6);

pmos (nt1,w7,nt0);
nmos (nt1,w7,t0);
pmos (nt1,w6,t0);
nmos (nt1,w6,nt0);

pmos (t1,VDD,nt1);
nmos (t1,VSS,nt1);

pmos (w7,VDD,t1);
nmos (w7,VSS,t1);

//t flip flop for nt2
pmos (w8,w9,t1);
nmos (w8,w9,nt1);
pmos (w8,nt2,nt1);
nmos (w8,nt2,t1);

pmos (w10,VDD,w8);
nmos (w10,VSS,w8);

pmos (w9,VDD,w10);
nmos (w9,VSS,w10);


pmos (nt2,w11,nt1);
nmos (nt2,w11,t1);
pmos (nt2,w10,t1);
nmos (nt2,w10,nt1);

pmos (t2,VDD,nt2);
nmos (t2,VSS,nt2);

pmos (w11,VDD,t2);
nmos (w11,VSS,t2);

wire outxor,w12;
nor (w12,t0,t1);
assign outxor=~w12|(t0,t1);

wire w13,w14;
//13->and t0,t2
//14->and outxor,t2'=nt2
and(w13,t0,t2);
and(w14,outxor,nt2);

wire partialout1;
or(partialout1,w13,w14);

wire partialout2;
nand(partialout2,t0,t1,t2,a);

nand(out,partialout1,partialout2);

endmodule



















