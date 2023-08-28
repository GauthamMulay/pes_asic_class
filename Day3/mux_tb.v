`timescale 1ns/1ps
module mux21_tb;
reg in1,in2,sel;
wire out;
mux21 uut(.in1(in1),.in2(in2),.sel(sel),.out(out));
initial 
begin
$dumpfile("mux21_tb.vcd");
$dumpvars(0,mux21_tb);
sel=0;
in1=0;
in2=0;
#300 $finish;
end
always #80 sel=~sel;
always #15 in1=~in1;
always #40 in2=~in2;
endmodule
