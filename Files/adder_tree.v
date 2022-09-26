module adder_tree (clk, rst, PE_out1, PE_out2, PE_out3, PE_out4, PE_out5, PE_out6, PE_out7, PE_out8, PE_out9, add_out);

    input clk, rst;
    input signed [24:0] PE_out1, PE_out2, PE_out3, PE_out4, PE_out5, PE_out6, PE_out7, PE_out8, PE_out9;
    output reg signed [28:0] add_out;

    reg signed [28:0] add1_1, add1_2, add1_3, add1_4, add1_5;
    reg signed [28:0] add2_1, add2_2, add2_3;
    reg signed [28:0] add3_1, add3_2;




//stage1-----------------------------------

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            add1_1 <= 29'b0;
            add1_2 <= 29'b0;
            add1_3 <= 29'b0;
            add1_4 <= 29'b0;
            add1_5 <= 29'b0;
        end
        else begin
            add1_1 <= PE_out1 + PE_out2;
            add1_2 <= PE_out3 + PE_out4;
            add1_3 <= PE_out5 + PE_out6;
            add1_4 <= PE_out7 + PE_out8;
            add1_5 <= PE_out9;
        end
    end

//stage2-----------------------------------

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            add2_1 <= 29'b0;
            add2_2 <= 29'b0;
            add2_3 <= 29'b0;
        end
        else begin
            add2_1 <= add1_1 + add1_2;
            add2_2 <= add1_3 + add1_4;
            add2_3 <= add1_5;
        end
    end

//stage3-----------------------------------

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            add3_1 <= 29'b0;
            add3_2 <= 29'b0;
        end
        else begin
            add3_1 <= add2_1 + add2_2;
            add3_2 <= add2_3;
        end
    end

//stage4-----------------------------------

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            add_out <= 29'b0;
        end
        else begin
            add_out <= add3_1 + add3_2;
        end
    end

endmodule