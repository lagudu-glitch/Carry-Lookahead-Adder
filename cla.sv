module com_pg (
	input logic [15:0] A, B,
	output logic [15:0] p, g
);
	// Compute p's
	assign p[0] = A[0] ^ B[0];
	assign p[1] = A[1] ^ B[1];
	assign p[2] = A[2] ^ B[2];
	assign p[3] = A[3] ^ B[3];
	assign p[4] = A[4] ^ B[4];
	assign p[5] = A[5] ^ B[5];
	assign p[6] = A[6] ^ B[6];
	assign p[7] = A[7] ^ B[7];
	assign p[8] = A[8] ^ B[8];
	assign p[9] = A[9] ^ B[9];
	assign p[10] = A[10] ^ B[10];
	assign p[11] = A[11] ^ B[11];
	assign p[12] = A[12] ^ B[12];
	assign p[13] = A[13] ^ B[13];
	assign p[14] = A[14] ^ B[14];
	assign p[15] = A[15] ^ B[15];

	// Compute g's
	assign g[0] = A[0] & B[0];
	assign g[1] = A[1] & B[1];
	assign g[2] = A[2] & B[2];
	assign g[3] = A[3] & B[3];
	assign g[4] = A[4] & B[4];
	assign g[5] = A[5] & B[5];
	assign g[6] = A[6] & B[6];
	assign g[7] = A[7] & B[7];
	assign g[8] = A[8] & B[8];
	assign g[9] = A[9] & B[9];
	assign g[10] = A[10] & B[10];
	assign g[11] = A[11] & B[11];
	assign g[12] = A[12] & B[12];
	assign g[13] = A[13] & B[13];
	assign g[14] = A[14] & B[14];
	assign g[15] = A[15] & B[15];

endmodule

module cla_4b (
	input logic CI,
	input logic [3:0] p, g,
	output logic [3:0] S
);
	logic [2:0] C;

	// Compute the all the carries
	assign C[0] = g[0] | (p[0] & CI);
	assign C[1] = g[1] | (p[1] & g[0]) | (&p[1:0] & CI);
	assign C[2] = g[2] | (p[2] & g[1]) | (&p[2:1] & g[0]) | (&p[2:0] & CI);

	// Compute the sum
	assign S[0] = p[0] ^ CI;
	assign S[1] = p[1] ^ C[0];
	assign S[2] = p[2] ^ C[1];
	assign S[3] = p[3] ^ C[2];

endmodule

module cla_16b (
	input logic CI,
	input logic [15:0] A, B,
	output logic CO,
	output logic [15:0] S
);
	logic [2:0] C;
	logic [3:0] P, G;
	logic [15:0] p, g;

	// Compute the p's and g's
	com_pg pg (.A(A), .B(B), .p(p), .g(g));

	// Compute P's
	assign P[0] = &p[3:0];
	assign P[1] = &p[7:4];
	assign P[2] = &p[11:8];
	assign P[3] = &p[15:12];

	// Compute G's
	assign G[0] = g[3] | (p[3] & g[2]) | (&p[3:2] & g[1]) | (&p[3:1] & g[0]);
	assign G[1] = g[7] | (p[7] & g[6]) | (&p[7:6] & g[5]) | (&p[7:5] & g[4]);
	assign G[2] = g[11] | (p[11] & g[10]) | (&p[11:10] & g[9]) | (&p[11:9] & g[8]);
	assign G[3] = g[15] | (p[15] & g[14]) | (&p[15:14] & g[13]) | (&p[15:13] & g[12]);

	// Compute the carries
	assign C[0] = G[0] | (P[0] & CI);
	assign C[1] = G[1] | (P[1] & G[0]) | (&P[1:0] & CI);
	assign C[2] = G[2] | (P[2] & G[1]) | (&P[2:1] & G[0]) | (&P[2:0] & CI);
	assign CO = G[3] | (P[3] & G[2]) | (&P[3:2] & G[1]) | (&P[3:1] & G[0]) | (&P[3:0] & CI);

	// Compute the sums
	cla_4b s1 (.CI(CI), .p(p[3:0]), .g(g[3:0]), .S(S[3:0]));
	cla_4b s2 (.CI(C[0]), .p(p[7:4]), .g(g[7:4]), .S(S[7:4]));
	cla_4b s3 (.CI(C[1]), .p(p[11:8]), .g(g[11:8]), .S(S[11:8]));
	cla_4b s4 (.CI(C[2]), .p(p[15:12]), .g(g[15:12]), .S(S[15:12]));

endmodule