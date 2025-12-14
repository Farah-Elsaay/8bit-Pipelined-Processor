module CCR
(
//Declaring inputs 
    input wire CLK,
    input wire RST,
    input wire [ 3 :0 ] IN,
    input wire F_Save,
    input wire F_Restore,

//Declaring output
output reg [ 3 : 0 ] OUT
);

reg [ 3 : 0 ] Stacked_flags;

always@( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                OUT <= 4'b0;
                Stacked_flags <= 4'b0;
            end
        else if ( F_Save )
            begin
                Stacked_flags <= IN;
            end

        else if ( F_Restore )
            begin
                OUT <= Stacked_flags;
            end
        
    end


endmodule 
