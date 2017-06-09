`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:25 03/15/2017 
// Design Name: 
// Module Name:    RingOscillator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RingOsc2(Mode, Stress, OUT);
	parameter LENGTH = 15;
	input Mode, Stress;
	output wire OUT;
	(* S = "TRUE"*)wire [LENGTH : 0] connect_wire;
	
	//LUTout, a, b, c, e, d, f, g, h, i, j, k, l, m;
	
	
	
	LUTSel LUTSel1(.Mode(Mode), .Stress(Stress), .INSel(OUT), .OUTSel(connect_wire[0]));
	assign OUT = connect_wire[LENGTH];
	genvar i;  
	generate  
		for (i=1; i <= LENGTH; i = i+1)  
			begin: Lut  
				inverter Lut(connect_wire[i], connect_wire[i-1]); 				
			end  
		//inverter last(OUT, connect_wire[LENGTH]);
	endgenerate  
	
	
	
	/* inverter Lut2(a,LUTout);
	inverter Lut3(b,a);
	inverter Lut4(c,b);
	inverter Lut5(d,c);
	inverter Lut6(e,d);	
	inverter Lut7(f,e);
	inverter Lut8(g,f);
	inverter Lut9(h,g);
	inverter Lut10(i,h);
	inverter Lut11(j,i);
	inverter Lut12(k,j);
	inverter Lut13(l,k);
	inverter Lut14(m,l);
	inverter Lut15(OUT,m); */
	
	
endmodule

