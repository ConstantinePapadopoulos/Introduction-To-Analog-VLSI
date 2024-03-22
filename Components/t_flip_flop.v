module t_flip_flop(t,clk);
input clk;
output t;

wire not_clk,qm,not_qm,qm1,not_t,t1;

pmos p0(not_clk,VDD,clk);
nmos n0(not_clk,VSS,clk);

pmos p1(qm,qm1,clk);
nmos n1(qm,qm1,not_clk);
pmos p2(qm,not_t,not_clk);
nmos n2(qm,not_t,clk);

pmos p3(not_qm,VDD,qm);
nmos n3(not_qm,VSS,qm);

pmos p4(qm1,VDD,not_qm);
nmos n4(qm1,VSS,not_qm);


pmos p5(not_t,t1,not_clk);
nmos n5(not_t,t1,clk);
pmos p6(not_t,not_qm,clk);
nmos n6(not_t,not_qm,not_clk);

pmos p7(t,VDD,not_t);
nmos n7(t,VSS,not_t);

pmos p8(t1,VDD,t);
nmos n8(t1,VSS,t);

endmodule