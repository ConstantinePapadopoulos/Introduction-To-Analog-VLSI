module ALU(out_0,out_1,out_2,out_3,A0,B0,A1,B1,A2,B2,op_1,op_0,cin_0,B_inv);
output out_0,out_1,out_2,out_3;
input A0,B0,A1,B1,A2,B2,op_1,op_0,cin_0,B_inv;
wire cout_0,cout_1,cout_2,sout_0,sout_1,sout_2;
wire x01,x02,xor0,f01,f02,f03,f04,f05,d00,d01,m011,m012,m013,mux0,m021,m022,m023;
wire x11,x12,xor1,f11,f12,f13,f14,f15,d10,d11,m111,m112,m113,mux1,m121,m122,m123;
wire x21,x22,xor2,f21,f22,f23,f24,f25,d20,d21,m211,m212,m213,mux2,m221,m222,m223;
wire x31,x32,xor3,X;

//1st alu

//xor 
nor(x01,B0,op_0);
and(x02,B0,op_0);
nor(xor0,x01,x02);

//full adder 
nand(f01,A0,xor0);
or(f02,A0,xor0);
and(f03,f01,f02);
or(f04,f03,op_0);
nand(f05,f03,op_0);
and(sout_0,f04,f05);
nand(cout_0,f01,f05);

//mux 1
or(d00,A0,B0);
and(d01,A0,B0);

not(m011,op_0);
and(m012,m011,d00);
and(m013,op_0,d01);
or(mux0,m012,m013);

//mux2
not(m021,op_1);
and(m022,m021,sout_0);
and(m023,op_1,mux0);
or(out_0,m022,m023);

//2nd alu

//xor 
nor(x11,B1,op_0);
and(x12,B1,op_0);
nor(xor1,x11,x12);

//full adder 
nand(f11,A1,xor1);
or(f12,A1,xor1);
and(f13,f11,f12);
or(f14,f13,cout_0);
nand(f15,f13,cout_0);
and(sout_1,f14,f15);
nand(cout_1,f11,f15);

//mux1
or(d10,A1,B1);
and(d11,A1,B1);

not(m111,op_0);
and(m112,m111,d10);
and(m113,op_0,d11);
or(mux1,m112,m113);

//mux2
not(m121,op_1);
and(m122,m121,sout_1);
and(m123,op_1,mux1);
or(out_1,m122,m123);


//3rd alu

//xor 
nor(x21,B2,op_0);
and(x22,B2,op_0);
nor(xor2,x21,x22);

//full adder 
nand(f21,A2,xor2);
or(f22,A2,xor2);
and(f23,f21,f22);
or(f24,f23,cout_1);
nand(f25,f23,cout_1);
and(sout_2,f24,f25);
nand(cout_2,f21,f25);

//mux1
or(d20,A2,B2);
and(d21,A2,B2);

not(m211,op_0);
and(m212,m211,d20);
and(m213,op_0,d21);
or(mux2,m212,m213);

//mux2
not(m221,op_1);
and(m222,m221,sout_2);
and(m223,op_1,mux2);
or(out_2,m222,m223);

//make out_3

//xor 
nor(x31,cout_2,op_0);
and(x32,cout_2,op_0);
nor(xor3,x31,x32);

not(X,op_1);
and(out_3,xor3,X);

endmodule





