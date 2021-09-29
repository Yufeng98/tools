`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
//
//    Module Name:    Kogge-Stone-Adder
//
//    Date:           09/28/2021
//
//    Author:         Yufeng Gu
//
//    Description:    8-bits and 32-bits Kogge-Stone-Adder
//
//					  8-bits https://www.researchgate.net/figure/8-bit-Kogge-stone-Adder_fig3_282268660
//                    32-bits http://patricklomenzo.com/wp-content/uploads/2018/09/AVLSI_Report_KoggeStone_Adder.pdf
//
///////////////////////////////////////////////////////////////////////////////

module BitwiseP(
		input Ai,
		input Bi,
		output Pi
    );

xor #0.1 (Pi,Ai,Bi);

endmodule

module BitwiseG(
	input Ai,
	input Bi,
	output Gi
    );

and #0.1 (Gi,Ai,Bi);

endmodule

module BlackCell(
	input Gik,
	input Pik,
	input Gk_1j,
	input Pk_1j,
	output Gij,
	output Pij
    );
	 
wire net1;

and #0.1 (net1,Pik,Gk_1j);
or #0.1 (Gij,Gik,net1);		// output Gij generated here

and #0.1 (Pij,Pik,Pk_1j);		// output Pij generated

endmodule

module GrayCell(
	input Gik,
	input Pik,
	input Gk_1j,
	output Gij
    );

wire net1;

and #0.1 (net1,Pik,Gk_1j);
or #0.1 (Gij,Gik,net1);		// output Gij generated here

endmodule

module TriangleBuffer(
	input Gi,
	output Go
    );
	 
assign #0.1 Go = Gi;

endmodule

module SumGen(
		input ci_1,
		input Pii,
		output Sum
    );

xor #0.1 (Sum,ci_1,Pii);

endmodule


module KSA8 #(
  	parameter DATA_WIDTH = 8
)(
	input [DATA_WIDTH-1:0] A,
	input [DATA_WIDTH-1:0] B,
	input Cin,
	output [DATA_WIDTH-1:0] S,
	output Cout
);

wire [DATA_WIDTH-1:0] level1G;
wire [DATA_WIDTH-1:0] level1P;
wire [DATA_WIDTH-1:0] level2G;
wire [DATA_WIDTH-2:0] level2P;
wire [DATA_WIDTH-1:0] level3G;
wire [DATA_WIDTH-4:0] level3P;
wire [DATA_WIDTH-1:0] level4G;

// level 1 start
genvar i;
generate
	for(i=0;i<DATA_WIDTH;i=i+1) begin
		BitwiseG G(A[i], B[i], level1G[i]);
		BitwiseP P(A[i], B[i], level1P[i]);
	end
endgenerate
// level 1 end

// level 2 start
GrayCell GrayCell20(level1G[0],level1P[0],Cin,level2G[0]);
generate
	for(i=1;i<DATA_WIDTH;i=i+1) begin
		BlackCell BC20(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i-1]);
	end
endgenerate
// level 2 end

// level 3 start
TriangleBuffer TriangleBuffer30(level2G[0], level3G[0]);
GrayCell GrayCell30(level2G[1],level2P[0],Cin,level3G[1]);
GrayCell GrayCell31(level2G[2],level2P[1],level2G[0],level3G[2]);
generate
	for(i=3;i<DATA_WIDTH;i=i+1) begin
		BlackCell BC30(level2G[i],level2P[i-1],level2G[i-2],level2P[i-3],level3G[i],level3P[i-3]);
	end
endgenerate
// level 3 end

// level 4 start
TriangleBuffer TriangleBuffer40(level3G[0], level4G[0]);
TriangleBuffer TriangleBuffer41(level3G[1], level4G[1]);
TriangleBuffer TriangleBuffer42(level3G[2], level4G[2]);
GrayCell GrayCell40(level3G[3],level3P[0],Cin,level4G[3]);
GrayCell GrayCell41(level3G[4],level3P[1],level3G[0],level4G[4]);
GrayCell GrayCell42(level3G[5],level3P[2],level3G[1],level4G[5]);
GrayCell GrayCell43(level3G[6],level3P[3],level3G[2],level4G[6]);
GrayCell GrayCell44(level3G[7],level3P[4],level3G[3],level4G[7]);
// level 4 end

// sum start
generate
	xor #0.1 XPS1(S[0],level1P[0],Cin);
	for(i=1;i<DATA_WIDTH;i=i+1) begin
		SumGen SG(level1P[i],level4G[i-1],S[i]);
	end
endgenerate
assign Cout=level4G[7];
// sum end

endmodule


module KSA32 #(
  	parameter DATA_WIDTH = 32
)(
		input [DATA_WIDTH-1:0] A,
		input [DATA_WIDTH-1:0] B,
		input Cin,
		output [DATA_WIDTH-1:0] S,
		output Cout
    );

wire [DATA_WIDTH-1:0] level1G;
wire [DATA_WIDTH-1:0] level1P;
wire [DATA_WIDTH-1:0] level2G;
wire [DATA_WIDTH-2:0] level2P;
wire [DATA_WIDTH-1:0] level3G;
wire [DATA_WIDTH-4:0] level3P;
wire [DATA_WIDTH-1:0] level4G;
wire [DATA_WIDTH-8:0] level4P;
wire [DATA_WIDTH-1:0] level5G;
wire [DATA_WIDTH-16:0] level5P;
wire [DATA_WIDTH-1:0] level6G;

// level 1 start
genvar i;
generate
	for(i=0;i<32;i=i+1) begin
		BitwiseG G(A[i], B[i], level1G[i]);
		BitwiseP P(A[i], B[i], level1P[i]);
	end
endgenerate
// level 1 end

// level 2 start
GrayCell GrayCell20(level1G[0],level1P[0],Cin,level2G[0]);
generate
	for(i=1;i<32;i=i+1) begin
		BlackCell BC20(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i-1]);
	end
endgenerate
// level 2 end

// level 3 start
TriangleBuffer TriangleBuffer30(level2G[0], level3G[0]);
GrayCell GrayCell30(level2G[1],level2P[0],Cin,level3G[1]);
GrayCell GrayCell31(level2G[2],level2P[1],level2G[0],level3G[2]);
generate
	for(i=3;i<32;i=i+1) begin
		BlackCell BC30(level2G[i],level2P[i-1],level2G[i-2],level2P[i-3],level3G[i],level3P[i-3]);
	end
endgenerate
// level 3 end

// level 4 start
TriangleBuffer TriangleBuffer40(level3G[0], level4G[0]);
TriangleBuffer TriangleBuffer41(level3G[1], level4G[1]);
TriangleBuffer TriangleBuffer42(level3G[2], level4G[2]);
GrayCell GrayCell40(level3G[3],level3P[0],Cin,level4G[3]);
GrayCell GrayCell41(level3G[4],level3P[1],level3G[0],level4G[4]);
GrayCell GrayCell42(level3G[5],level3P[2],level3G[1],level4G[5]);
GrayCell GrayCell43(level3G[6],level3P[3],level3G[2],level4G[6]);
generate
	for(i=7;i<32;i=i+1) begin
		BlackCell BC40(level3G[i],level3P[i-3],level3G[i-4],level3P[i-7],level4G[i],level4P[i-7]);
	end
endgenerate
// level 4 end

// level 5 start
generate
	for(i=0;i<7;i=i+1) begin
		TriangleBuffer TriangleBuffer50(level4G[i], level5G[i]);
	end
endgenerate

GrayCell GrayCell5(level4G[7],level4P[0],Cin,level5G[7]);
generate
	for(i=8;i<15;i=i+1) begin
		GrayCell GrayCell50(level4G[i],level4P[i-7],level4G[i-8],level5G[i]);
	end
endgenerate
generate
	for(i=15;i<32;i=i+1) begin
		BlackCell BC50(level4G[i],level4P[i-7],level4G[i-8],level4P[i-15],level5G[i],level5P[i-15]);
	end
endgenerate
// level 5 end


// level 6 start
generate
	for(i=0;i<15;i=i+1) begin
		TriangleBuffer TriangleBuffer60(level5G[i], level6G[i]);
	end
endgenerate

GrayCell GrayCell6(level5G[15],level5P[0],Cin,level6G[15]);
generate
	for(i=16;i<32;i=i+1) begin
		GrayCell GrayCell60(level5G[i],level5P[i-15],level6G[i-16],level6G[i]);
	end
endgenerate
// level 6 end

// sum start
generate
	xor #0.1 XPS1(S[0],level1P[0],Cin);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level6G[i-1],S[i]);
	end
endgenerate
assign Cout=level6G[31];
// sum end

endmodule
