module PE (en, conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9, 
            kernal1_1, kernal1_2, kernal1_3, kernal1_4, kernal1_5, kernal1_6, kernal1_7, kernal1_8, kernal1_9,
            kernal2_1, kernal2_2, kernal2_3, kernal2_4, kernal2_5, kernal2_6, kernal2_7, kernal2_8, kernal2_9,
            kernal3_1, kernal3_2, kernal3_3, kernal3_4, kernal3_5, kernal3_6, kernal3_7, kernal3_8, kernal3_9,
            kernal4_1, kernal4_2, kernal4_3, kernal4_4, kernal4_5, kernal4_6, kernal4_7, kernal4_8, kernal4_9,
            PE_out1_1, PE_out1_2, PE_out1_3, PE_out1_4, PE_out1_5, PE_out1_6, PE_out1_7, PE_out1_8, PE_out1_9,
            PE_out2_1, PE_out2_2, PE_out2_3, PE_out2_4, PE_out2_5, PE_out2_6, PE_out2_7, PE_out2_8, PE_out2_9,
            PE_out3_1, PE_out3_2, PE_out3_3, PE_out3_4, PE_out3_5, PE_out3_6, PE_out3_7, PE_out3_8, PE_out3_9,
            PE_out4_1, PE_out4_2, PE_out4_3, PE_out4_4, PE_out4_5, PE_out4_6, PE_out4_7, PE_out4_8, PE_out4_9);

    input en;
    input signed [8:0] conv1, conv2, conv3, conv4, conv5, conv6, conv7, conv8, conv9;
    input signed [15:0] kernal1_1, kernal1_2, kernal1_3, kernal1_4, kernal1_5, kernal1_6, kernal1_7, kernal1_8, kernal1_9,
                kernal2_1, kernal2_2, kernal2_3, kernal2_4, kernal2_5, kernal2_6, kernal2_7, kernal2_8, kernal2_9,
                kernal3_1, kernal3_2, kernal3_3, kernal3_4, kernal3_5, kernal3_6, kernal3_7, kernal3_8, kernal3_9,
                kernal4_1, kernal4_2, kernal4_3, kernal4_4, kernal4_5, kernal4_6, kernal4_7, kernal4_8, kernal4_9;

    output reg signed [24:0] PE_out1_1, PE_out1_2, PE_out1_3, PE_out1_4, PE_out1_5, PE_out1_6, PE_out1_7, PE_out1_8, PE_out1_9,
                    PE_out2_1, PE_out2_2, PE_out2_3, PE_out2_4, PE_out2_5, PE_out2_6, PE_out2_7, PE_out2_8, PE_out2_9,
                    PE_out3_1, PE_out3_2, PE_out3_3, PE_out3_4, PE_out3_5, PE_out3_6, PE_out3_7, PE_out3_8, PE_out3_9,
                    PE_out4_1, PE_out4_2, PE_out4_3, PE_out4_4, PE_out4_5, PE_out4_6, PE_out4_7, PE_out4_8, PE_out4_9;



    always @(*) begin
        if(en) begin
            PE_out1_1 = conv1 * kernal1_1;
            PE_out1_2 = conv2 * kernal1_2;
            PE_out1_3 = conv3 * kernal1_3;
            PE_out1_4 = conv4 * kernal1_4;
            PE_out1_5 = conv5 * kernal1_5;
            PE_out1_6 = conv6 * kernal1_6;
            PE_out1_7 = conv7 * kernal1_7;
            PE_out1_8 = conv8 * kernal1_8;
            PE_out1_9 = conv9 * kernal1_9;

            PE_out2_1 = conv1 * kernal2_1;
            PE_out2_2 = conv2 * kernal2_2;
            PE_out2_3 = conv3 * kernal2_3;
            PE_out2_4 = conv4 * kernal2_4;
            PE_out2_5 = conv5 * kernal2_5;
            PE_out2_6 = conv6 * kernal2_6;
            PE_out2_7 = conv7 * kernal2_7;
            PE_out2_8 = conv8 * kernal2_8;
            PE_out2_9 = conv9 * kernal2_9;

            PE_out3_1 = conv1 * kernal3_1;
            PE_out3_2 = conv2 * kernal3_2;
            PE_out3_3 = conv3 * kernal3_3;
            PE_out3_4 = conv4 * kernal3_4;
            PE_out3_5 = conv5 * kernal3_5;
            PE_out3_6 = conv6 * kernal3_6;
            PE_out3_7 = conv7 * kernal3_7;
            PE_out3_8 = conv8 * kernal3_8;
            PE_out3_9 = conv9 * kernal3_9;

            PE_out4_1 = conv1 * kernal4_1;
            PE_out4_2 = conv2 * kernal4_2;
            PE_out4_3 = conv3 * kernal4_3;
            PE_out4_4 = conv4 * kernal4_4;
            PE_out4_5 = conv5 * kernal4_5;
            PE_out4_6 = conv6 * kernal4_6;
            PE_out4_7 = conv7 * kernal4_7;
            PE_out4_8 = conv8 * kernal4_8;
            PE_out4_9 = conv9 * kernal4_9;
        end
        else begin
            PE_out1_1 = 25'b0;
            PE_out1_2 = 25'b0;
            PE_out1_3 = 25'b0;
            PE_out1_4 = 25'b0;
            PE_out1_5 = 25'b0;
            PE_out1_6 = 25'b0;
            PE_out1_7 = 25'b0;
            PE_out1_8 = 25'b0;
            PE_out1_9 = 25'b0;

            PE_out2_1 = 25'b0;
            PE_out2_2 = 25'b0;
            PE_out2_3 = 25'b0;
            PE_out2_4 = 25'b0;
            PE_out2_5 = 25'b0;
            PE_out2_6 = 25'b0;
            PE_out2_7 = 25'b0;
            PE_out2_8 = 25'b0;
            PE_out2_9 = 25'b0;

            PE_out3_1 = 25'b0;
            PE_out3_2 = 25'b0;
            PE_out3_3 = 25'b0;
            PE_out3_4 = 25'b0;
            PE_out3_5 = 25'b0;
            PE_out3_6 = 25'b0;
            PE_out3_7 = 25'b0;
            PE_out3_8 = 25'b0;
            PE_out3_9 = 25'b0;

            PE_out4_1 = 25'b0;
            PE_out4_2 = 25'b0;
            PE_out4_3 = 25'b0;
            PE_out4_4 = 25'b0;
            PE_out4_5 = 25'b0;
            PE_out4_6 = 25'b0;
            PE_out4_7 = 25'b0;
            PE_out4_8 = 25'b0;
            PE_out4_9 = 25'b0;
        end
    end

    // always @(y1) begin
    //     if(y1 > 100000) Y1 = 8'd255;
    //     else Y1 = 8'd0;
    // end

    // always @(y2) begin
    //     if(y2 > 100000) Y2 = 8'd255;
    //     else Y2 = 8'd0;
    // end

endmodule