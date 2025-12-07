module Register_file( 
    input clk,
    input rst,

    input [1:0] ra,       // read address A
    input [1:0] rb,       // read address B
    input [1:0] rw,       // write address

    input [7:0] write_data,
    input write_enable,

    output [7:0] read_data_a,
    output [7:0] read_data_b
    );

    reg [7:0] R [0:3];

    // RESET + WRITE
    always @(posedge clk) begin
        if (rst) begin
            R[0] <= 8'd0;
            R[1] <= 8'd0;
            R[2] <= 8'd0;
            R[3] <= 8'd255;    // Stack pointer initialization
        end else if (write_enable) begin
            R[rw] <= write_data;
        end
    end

    // COMBINATIONAL READ
    assign read_data_a = R[ra];
    assign read_data_b = R[rb];

endmodule