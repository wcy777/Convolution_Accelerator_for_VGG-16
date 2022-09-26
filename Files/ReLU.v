module ReLU (add_inR, add_inB, add_inG, Bias, relu_out);
    
    input signed [28:0] add_inR, add_inB, add_inG;
    input signed [15:0] Bias;
    output reg [7:0] relu_out;

    reg signed [30:0] r1, add_sum;

    always @(*) begin
        r1 = add_inR + add_inB + add_inG + Bias;
    end

    // always @(*) begin
    //     add_sum = (add_inR + add_inB + add_inG) / 3;
    //     r1 = add_sum + Bias;
    // end

    always @(r1) begin
       if(r1 <= 0)  relu_out = 8'b0;
       else begin
           relu_out = r1[13:6];
       end
    end

endmodule