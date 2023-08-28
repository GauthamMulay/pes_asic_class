module mux21(
input in1,
input in2,
input sel,
output out);
reg y;
always@(*)
begin
if(sel)
	y<=in2;
else
	y<=in1;
end
assign out=y;
endmodule


