module bidir_buffer(
    inout wire bus,         
    input wire data_in,    
    output wire data_out,  
    input wire ctrl         
);
    assign bus = ctrl ? data_in : 1'bz;
    assign data_out = bus;
endmodule
