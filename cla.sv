module cla_4b (
	input logic CI,
	input logic [3:0] A, B,
	output logic CO,
	output logic [3:0] S
);
	logic [2:0] C;
	logic [3:0] g, p;

	// Compute p's
	assign p[0] = A[0] ^ B[0];
	assign p[1] = A[1] ^ B[1];
	assign p[2] = A[2] ^ B[2];
	assign p[3] = A[3] ^ B[3];

	// Compute g's
	assign g[0] = A[0] & B[0];
	assign g[1] = A[1] & B[1];
	assign g[2] = A[2] & B[2];
	assign g[3] = A[3] & B[3];

	// Compute the all the carries
	assign C[0] = g[0] | (p[0] & CI);
	assign C[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & CI);
	assign C[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & CI);
	assign CO = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & CI);

	// Compute the sum
	assign S[0] = p[0] ^ CI;
	assign S[1] = p[1] ^ C[0];
	assign S[2] = p[2] ^ C[1];
	assign S[3] = p[3] ^ C[2];

endmodule