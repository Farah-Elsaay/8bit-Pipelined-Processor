module pc (
input wire rst ,
input wire [7:0] pc_in ,
output reg [7:0] pc_out
);

always @(*)
	begin
		if(~rst)
			begin
				pc_out = 'd0 ;
			end
		else
			begin
				pc_out = pc_in ;
			end
	end
	
endmodule
