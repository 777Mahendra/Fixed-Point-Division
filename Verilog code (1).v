module fixed_point_division;
    parameter N = 8;
    parameter SCALE = 1 << N;
    parameter D = 23;
    parameter NUM = 15;
    
    reg [16:0] D_fixed;
    reg [16:0] x_fixed;
    reg [16:0] temp;
    integer i;
    
    initial begin
        D_fixed = D * SCALE;  // Fixed-point representation of D
        x_fixed = (SCALE / 17); // Initial approximation of 1/D
        
        for (i = 0; i < 5; i = i + 1) begin
            temp = x_fixed * (2 * SCALE - ((x_fixed * D_fixed) >> N));
            x_fixed = temp >> N;
        end
        
        // Multiply by NUM and compute the final result
        temp = NUM * x_fixed;
        
        // Display results
        $display("D_fixed: %d", D_fixed);
        $display("Final x_fixed: %d", x_fixed);
        $display("Result Fixed: %d", temp);
        $display("Result Floating: %f", temp * 1.0 / SCALE);
        
        $stop;
    end
endmodule