module line_buffer (clk, rst, D, conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9);

    input clk, rst;
    input [8:0] D;
    output reg [8:0] conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9; 

    integer i, j;
    reg [8:0] LB [0:454];

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            for(j = 0; j <= 454; j = j + 1) LB[j] <= 9'b0;
        end
        else begin
            for(i = 0; i <= 453; i = i + 1) begin
                LB[i] <= LB[i+1];
            end
            LB[454] <= D;
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            conv1 <= 9'b0;
            conv2 <= 9'b0;
            conv3 <= 9'b0;
            conv4 <= 9'b0;
            conv5 <= 9'b0;
            conv6 <= 9'b0;
            conv7 <= 9'b0;
            conv8 <= 9'b0;
            conv9 <= 9'b0;
        end
        else begin
            conv1 <= LB[0];
            conv2 <= LB[1];
            conv3 <= LB[2];
            conv4 <= LB[226];
            conv5 <= LB[227];
            conv6 <= LB[228];
            conv7 <= LB[452];
            conv8 <= LB[453];
            conv9 <= LB[454];            
        end
    end

endmodule