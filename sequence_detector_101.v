module sequence_detector(
	input clk,
	input x,
	input reset,
	output reg z
);


	parameter S0=2'b00;
	parameter S1=2'b01;
	parameter S2=2'b10;

	reg[1:0] current , next;

	always@(posedge  clk or posedge  reset)
	begin
		if(reset)
			current <= S0;
		else
			current <= next;
	end

	always@(*)
	begin
		case(current)
			S0:next = x ? S1 : S0;
			S1:next = x ? S1 : S2;
			S2:next = x ? S1 : S0;
			default: next = S0;
		endcase
	end

	always@(*)
	begin
		case(current)
			S2:z= (x==1) ? 1 : 0;
			default: z=0;
		endcase
	end
endmodule

		
