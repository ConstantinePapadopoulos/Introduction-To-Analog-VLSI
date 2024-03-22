module d_flip_flop_transidtor (q,d,clk);
input d,clk;
output q;

wire not_clk,qm,not_qm,not_q,qm1,q1;

pmos p0(not_clk,VDD,clk);
nmos n0(not_clk,VSS,clk);

pmos p1(qm,qm1,clk);
nmos n1(qm,qm1,not_clk);
pmos p2(qm,d,not_clk);
nmos n2(qm,d,clk);

pmos p3(not_qm,VDD,qm);
nmos n3(not_qm,VSS,qm);

pmos p4(qm1,VDD,not_qm);
nmos n4(qm1,VSS,not_qm);

pmos p5(not_q,q1,not_clk);
nmos n5(not_q,q1,clk);
pmos p6(not_q,not_qm,clk);
nmos n6(not_q,not_qm,not_clk);

pmos p7(q,VDD,not_q);
nmos n7(q,VSS,not_q);

pmos p8(q1,VDD,q);
nmos n8(q1,VSS,q);

endmodule