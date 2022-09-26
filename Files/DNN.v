module DNN (clk, rst, en, pe_ready, D_R, D_B, D_G,
            Bias1, Bias2, Bias3, Bias4,
            kernal_R, kernal_B, kernal_G,
            relu_out1, relu_out2, relu_out3, relu_out4);

    input clk, rst, en, pe_ready;
    input [8:0] D_R, D_B, D_G;
    input signed [15:0] Bias1, Bias2, Bias3, Bias4;
    input signed [15:0] kernal_R, kernal_B, kernal_G;
    output [7:0] relu_out1, relu_out2, relu_out3, relu_out4;


    wire signed [8:0] conv_R1, conv_R2, conv_R3, conv_R4, conv_R5, conv_R6, conv_R7, conv_R8, conv_R9;
    wire signed [8:0] conv_B1, conv_B2, conv_B3, conv_B4, conv_B5, conv_B6, conv_B7, conv_B8, conv_B9;
    wire signed [8:0] conv_G1, conv_G2, conv_G3, conv_G4, conv_G5, conv_G6, conv_G7, conv_G8, conv_G9;

    wire signed [24:0] PE_out_R_1_1, PE_out_R_1_2, PE_out_R_1_3, PE_out_R_1_4, PE_out_R_1_5, PE_out_R_1_6, PE_out_R_1_7, PE_out_R_1_8, PE_out_R_1_9,
                PE_out_R_2_1, PE_out_R_2_2, PE_out_R_2_3, PE_out_R_2_4, PE_out_R_2_5, PE_out_R_2_6, PE_out_R_2_7, PE_out_R_2_8, PE_out_R_2_9,
                PE_out_R_3_1, PE_out_R_3_2, PE_out_R_3_3, PE_out_R_3_4, PE_out_R_3_5, PE_out_R_3_6, PE_out_R_3_7, PE_out_R_3_8, PE_out_R_3_9,
                PE_out_R_4_1, PE_out_R_4_2, PE_out_R_4_3, PE_out_R_4_4, PE_out_R_4_5, PE_out_R_4_6, PE_out_R_4_7, PE_out_R_4_8, PE_out_R_4_9;
   wire signed [24:0] PE_out_B_1_1, PE_out_B_1_2, PE_out_B_1_3, PE_out_B_1_4, PE_out_B_1_5, PE_out_B_1_6, PE_out_B_1_7, PE_out_B_1_8, PE_out_B_1_9,
                PE_out_B_2_1, PE_out_B_2_2, PE_out_B_2_3, PE_out_B_2_4, PE_out_B_2_5, PE_out_B_2_6, PE_out_B_2_7, PE_out_B_2_8, PE_out_B_2_9,
                PE_out_B_3_1, PE_out_B_3_2, PE_out_B_3_3, PE_out_B_3_4, PE_out_B_3_5, PE_out_B_3_6, PE_out_B_3_7, PE_out_B_3_8, PE_out_B_3_9,
                PE_out_B_4_1, PE_out_B_4_2, PE_out_B_4_3, PE_out_B_4_4, PE_out_B_4_5, PE_out_B_4_6, PE_out_B_4_7, PE_out_B_4_8, PE_out_B_4_9;
   wire signed [24:0] PE_out_G_1_1, PE_out_G_1_2, PE_out_G_1_3, PE_out_G_1_4, PE_out_G_1_5, PE_out_G_1_6, PE_out_G_1_7, PE_out_G_1_8, PE_out_G_1_9,
                PE_out_G_2_1, PE_out_G_2_2, PE_out_G_2_3, PE_out_G_2_4, PE_out_G_2_5, PE_out_G_2_6, PE_out_G_2_7, PE_out_G_2_8, PE_out_G_2_9,
                PE_out_G_3_1, PE_out_G_3_2, PE_out_G_3_3, PE_out_G_3_4, PE_out_G_3_5, PE_out_G_3_6, PE_out_G_3_7, PE_out_G_3_8, PE_out_G_3_9,
                PE_out_G_4_1, PE_out_G_4_2, PE_out_G_4_3, PE_out_G_4_4, PE_out_G_4_5, PE_out_G_4_6, PE_out_G_4_7, PE_out_G_4_8, PE_out_G_4_9;

    wire signed [15:0] kernal_R_1_1, kernal_R_1_2, kernal_R_1_3, kernal_R_1_4, kernal_R_1_5, kernal_R_1_6, kernal_R_1_7, kernal_R_1_8, kernal_R_1_9,
                kernal_R_2_1, kernal_R_2_2, kernal_R_2_3, kernal_R_2_4, kernal_R_2_5, kernal_R_2_6, kernal_R_2_7, kernal_R_2_8, kernal_R_2_9,
                kernal_R_3_1, kernal_R_3_2, kernal_R_3_3, kernal_R_3_4, kernal_R_3_5, kernal_R_3_6, kernal_R_3_7, kernal_R_3_8, kernal_R_3_9,
                kernal_R_4_1, kernal_R_4_2, kernal_R_4_3, kernal_R_4_4, kernal_R_4_5, kernal_R_4_6, kernal_R_4_7, kernal_R_4_8, kernal_R_4_9;
    wire signed [15:0] kernal_B_1_1, kernal_B_1_2, kernal_B_1_3, kernal_B_1_4, kernal_B_1_5, kernal_B_1_6, kernal_B_1_7, kernal_B_1_8, kernal_B_1_9,
                kernal_B_2_1, kernal_B_2_2, kernal_B_2_3, kernal_B_2_4, kernal_B_2_5, kernal_B_2_6, kernal_B_2_7, kernal_B_2_8, kernal_B_2_9,
                kernal_B_3_1, kernal_B_3_2, kernal_B_3_3, kernal_B_3_4, kernal_B_3_5, kernal_B_3_6, kernal_B_3_7, kernal_B_3_8, kernal_B_3_9,
                kernal_B_4_1, kernal_B_4_2, kernal_B_4_3, kernal_B_4_4, kernal_B_4_5, kernal_B_4_6, kernal_B_4_7, kernal_B_4_8, kernal_B_4_9;
    wire signed [15:0] kernal_G_1_1, kernal_G_1_2, kernal_G_1_3, kernal_G_1_4, kernal_G_1_5, kernal_G_1_6, kernal_G_1_7, kernal_G_1_8, kernal_G_1_9,
                kernal_G_2_1, kernal_G_2_2, kernal_G_2_3, kernal_G_2_4, kernal_G_2_5, kernal_G_2_6, kernal_G_2_7, kernal_G_2_8, kernal_G_2_9,
                kernal_G_3_1, kernal_G_3_2, kernal_G_3_3, kernal_G_3_4, kernal_G_3_5, kernal_G_3_6, kernal_G_3_7, kernal_G_3_8, kernal_G_3_9,
                kernal_G_4_1, kernal_G_4_2, kernal_G_4_3, kernal_G_4_4, kernal_G_4_5, kernal_G_4_6, kernal_G_4_7, kernal_G_4_8, kernal_G_4_9;

    wire signed [28:0] add_out_R1, add_out_R2, add_out_R3, add_out_R4;
    wire signed [28:0] add_out_B1, add_out_B2, add_out_B3, add_out_B4;
    wire signed [28:0] add_out_G1, add_out_G2, add_out_G3, add_out_G4;


    line_buffer lbR (.clk(clk), .rst(rst), .D(D_R), .conv1(conv_R1), .conv2(conv_R2), .conv3(conv_R3), .conv4(conv_R4), .conv5(conv_R5), .conv6(conv_R6), .conv7(conv_R7), .conv8(conv_R8), .conv9(conv_R9));
    line_buffer lbB (.clk(clk), .rst(rst), .D(D_B), .conv1(conv_B1), .conv2(conv_B2), .conv3(conv_B3), .conv4(conv_B4), .conv5(conv_B5), .conv6(conv_B6), .conv7(conv_B7), .conv8(conv_B8), .conv9(conv_B9));
    line_buffer lbG (.clk(clk), .rst(rst), .D(D_G), .conv1(conv_G1), .conv2(conv_G2), .conv3(conv_G3), .conv4(conv_G4), .conv5(conv_G5), .conv6(conv_G6), .conv7(conv_G7), .conv8(conv_G8), .conv9(conv_G9));

    PE_buffer pe_bufferR (.clk(clk), .rst(rst), .pe_ready(pe_ready), .kernal(kernal_R), 
                        .kernal1_1(kernal_R_1_1), .kernal1_2(kernal_R_1_2), .kernal1_3(kernal_R_1_3), .kernal1_4(kernal_R_1_4), .kernal1_5(kernal_R_1_5), .kernal1_6(kernal_R_1_6), .kernal1_7(kernal_R_1_7), .kernal1_8(kernal_R_1_8), .kernal1_9(kernal_R_1_9),
                        .kernal2_1(kernal_R_2_1), .kernal2_2(kernal_R_2_2), .kernal2_3(kernal_R_2_3), .kernal2_4(kernal_R_2_4), .kernal2_5(kernal_R_2_5), .kernal2_6(kernal_R_2_6), .kernal2_7(kernal_R_2_7), .kernal2_8(kernal_R_2_8), .kernal2_9(kernal_R_2_9),
                        .kernal3_1(kernal_R_3_1), .kernal3_2(kernal_R_3_2), .kernal3_3(kernal_R_3_3), .kernal3_4(kernal_R_3_4), .kernal3_5(kernal_R_3_5), .kernal3_6(kernal_R_3_6), .kernal3_7(kernal_R_3_7), .kernal3_8(kernal_R_3_8), .kernal3_9(kernal_R_3_9),
                        .kernal4_1(kernal_R_4_1), .kernal4_2(kernal_R_4_2), .kernal4_3(kernal_R_4_3), .kernal4_4(kernal_R_4_4), .kernal4_5(kernal_R_4_5), .kernal4_6(kernal_R_4_6), .kernal4_7(kernal_R_4_7), .kernal4_8(kernal_R_4_8), .kernal4_9(kernal_R_4_9));
    PE_buffer pe_bufferB (.clk(clk), .rst(rst), .pe_ready(pe_ready), .kernal(kernal_B), 
                        .kernal1_1(kernal_B_1_1), .kernal1_2(kernal_B_1_2), .kernal1_3(kernal_B_1_3), .kernal1_4(kernal_B_1_4), .kernal1_5(kernal_B_1_5), .kernal1_6(kernal_B_1_6), .kernal1_7(kernal_B_1_7), .kernal1_8(kernal_B_1_8), .kernal1_9(kernal_B_1_9),
                        .kernal2_1(kernal_B_2_1), .kernal2_2(kernal_B_2_2), .kernal2_3(kernal_B_2_3), .kernal2_4(kernal_B_2_4), .kernal2_5(kernal_B_2_5), .kernal2_6(kernal_B_2_6), .kernal2_7(kernal_B_2_7), .kernal2_8(kernal_B_2_8), .kernal2_9(kernal_B_2_9),
                        .kernal3_1(kernal_B_3_1), .kernal3_2(kernal_B_3_2), .kernal3_3(kernal_B_3_3), .kernal3_4(kernal_B_3_4), .kernal3_5(kernal_B_3_5), .kernal3_6(kernal_B_3_6), .kernal3_7(kernal_B_3_7), .kernal3_8(kernal_B_3_8), .kernal3_9(kernal_B_3_9),
                        .kernal4_1(kernal_B_4_1), .kernal4_2(kernal_B_4_2), .kernal4_3(kernal_B_4_3), .kernal4_4(kernal_B_4_4), .kernal4_5(kernal_B_4_5), .kernal4_6(kernal_B_4_6), .kernal4_7(kernal_B_4_7), .kernal4_8(kernal_B_4_8), .kernal4_9(kernal_B_4_9));                    
    PE_buffer pe_bufferG (.clk(clk), .rst(rst), .pe_ready(pe_ready), .kernal(kernal_G), 
                        .kernal1_1(kernal_G_1_1), .kernal1_2(kernal_G_1_2), .kernal1_3(kernal_G_1_3), .kernal1_4(kernal_G_1_4), .kernal1_5(kernal_G_1_5), .kernal1_6(kernal_G_1_6), .kernal1_7(kernal_G_1_7), .kernal1_8(kernal_G_1_8), .kernal1_9(kernal_G_1_9),
                        .kernal2_1(kernal_G_2_1), .kernal2_2(kernal_G_2_2), .kernal2_3(kernal_G_2_3), .kernal2_4(kernal_G_2_4), .kernal2_5(kernal_G_2_5), .kernal2_6(kernal_G_2_6), .kernal2_7(kernal_G_2_7), .kernal2_8(kernal_G_2_8), .kernal2_9(kernal_G_2_9),
                        .kernal3_1(kernal_G_3_1), .kernal3_2(kernal_G_3_2), .kernal3_3(kernal_G_3_3), .kernal3_4(kernal_G_3_4), .kernal3_5(kernal_G_3_5), .kernal3_6(kernal_G_3_6), .kernal3_7(kernal_G_3_7), .kernal3_8(kernal_G_3_8), .kernal3_9(kernal_G_3_9),
                        .kernal4_1(kernal_G_4_1), .kernal4_2(kernal_G_4_2), .kernal4_3(kernal_G_4_3), .kernal4_4(kernal_G_4_4), .kernal4_5(kernal_G_4_5), .kernal4_6(kernal_G_4_6), .kernal4_7(kernal_G_4_7), .kernal4_8(kernal_G_4_8), .kernal4_9(kernal_G_4_9));


    PE peR (.en(en), .conv1(conv_R1), .conv2(conv_R2), .conv3(conv_R3), .conv4(conv_R4), .conv5(conv_R5), .conv6(conv_R6), .conv7(conv_R7), .conv8(conv_R8), .conv9(conv_R9),
            .kernal1_1(kernal_R_1_1), .kernal1_2(kernal_R_1_2), .kernal1_3(kernal_R_1_3), .kernal1_4(kernal_R_1_4), .kernal1_5(kernal_R_1_5), .kernal1_6(kernal_R_1_6), .kernal1_7(kernal_R_1_7), .kernal1_8(kernal_R_1_8), .kernal1_9(kernal_R_1_9),
            .kernal2_1(kernal_R_2_1), .kernal2_2(kernal_R_2_2), .kernal2_3(kernal_R_2_3), .kernal2_4(kernal_R_2_4), .kernal2_5(kernal_R_2_5), .kernal2_6(kernal_R_2_6), .kernal2_7(kernal_R_2_7), .kernal2_8(kernal_R_2_8), .kernal2_9(kernal_R_2_9),
            .kernal3_1(kernal_R_3_1), .kernal3_2(kernal_R_3_2), .kernal3_3(kernal_R_3_3), .kernal3_4(kernal_R_3_4), .kernal3_5(kernal_R_3_5), .kernal3_6(kernal_R_3_6), .kernal3_7(kernal_R_3_7), .kernal3_8(kernal_R_3_8), .kernal3_9(kernal_R_3_9),
            .kernal4_1(kernal_R_4_1), .kernal4_2(kernal_R_4_2), .kernal4_3(kernal_R_4_3), .kernal4_4(kernal_R_4_4), .kernal4_5(kernal_R_4_5), .kernal4_6(kernal_R_4_6), .kernal4_7(kernal_R_4_7), .kernal4_8(kernal_R_4_8), .kernal4_9(kernal_R_4_9),
            .PE_out1_1(PE_out_R_1_1), .PE_out1_2(PE_out_R_1_2), .PE_out1_3(PE_out_R_1_3), .PE_out1_4(PE_out_R_1_4), .PE_out1_5(PE_out_R_1_5), .PE_out1_6(PE_out_R_1_6), .PE_out1_7(PE_out_R_1_7), .PE_out1_8(PE_out_R_1_8), .PE_out1_9(PE_out_R_1_9),
            .PE_out2_1(PE_out_R_2_1), .PE_out2_2(PE_out_R_2_2), .PE_out2_3(PE_out_R_2_3), .PE_out2_4(PE_out_R_2_4), .PE_out2_5(PE_out_R_2_5), .PE_out2_6(PE_out_R_2_6), .PE_out2_7(PE_out_R_2_7), .PE_out2_8(PE_out_R_2_8), .PE_out2_9(PE_out_R_2_9),
            .PE_out3_1(PE_out_R_3_1), .PE_out3_2(PE_out_R_3_2), .PE_out3_3(PE_out_R_3_3), .PE_out3_4(PE_out_R_3_4), .PE_out3_5(PE_out_R_3_5), .PE_out3_6(PE_out_R_3_6), .PE_out3_7(PE_out_R_3_7), .PE_out3_8(PE_out_R_3_8), .PE_out3_9(PE_out_R_3_9),
            .PE_out4_1(PE_out_R_4_1), .PE_out4_2(PE_out_R_4_2), .PE_out4_3(PE_out_R_4_3), .PE_out4_4(PE_out_R_4_4), .PE_out4_5(PE_out_R_4_5), .PE_out4_6(PE_out_R_4_6), .PE_out4_7(PE_out_R_4_7), .PE_out4_8(PE_out_R_4_8), .PE_out4_9(PE_out_R_4_9));
    PE peB (.en(en), .conv1(conv_B1), .conv2(conv_B2), .conv3(conv_B3), .conv4(conv_B4), .conv5(conv_B5), .conv6(conv_B6), .conv7(conv_B7), .conv8(conv_B8), .conv9(conv_B9),
            .kernal1_1(kernal_B_1_1), .kernal1_2(kernal_B_1_2), .kernal1_3(kernal_B_1_3), .kernal1_4(kernal_B_1_4), .kernal1_5(kernal_B_1_5), .kernal1_6(kernal_B_1_6), .kernal1_7(kernal_B_1_7), .kernal1_8(kernal_B_1_8), .kernal1_9(kernal_B_1_9),
            .kernal2_1(kernal_B_2_1), .kernal2_2(kernal_B_2_2), .kernal2_3(kernal_B_2_3), .kernal2_4(kernal_B_2_4), .kernal2_5(kernal_B_2_5), .kernal2_6(kernal_B_2_6), .kernal2_7(kernal_B_2_7), .kernal2_8(kernal_B_2_8), .kernal2_9(kernal_B_2_9),
            .kernal3_1(kernal_B_3_1), .kernal3_2(kernal_B_3_2), .kernal3_3(kernal_B_3_3), .kernal3_4(kernal_B_3_4), .kernal3_5(kernal_B_3_5), .kernal3_6(kernal_B_3_6), .kernal3_7(kernal_B_3_7), .kernal3_8(kernal_B_3_8), .kernal3_9(kernal_B_3_9),
            .kernal4_1(kernal_B_4_1), .kernal4_2(kernal_B_4_2), .kernal4_3(kernal_B_4_3), .kernal4_4(kernal_B_4_4), .kernal4_5(kernal_B_4_5), .kernal4_6(kernal_B_4_6), .kernal4_7(kernal_B_4_7), .kernal4_8(kernal_B_4_8), .kernal4_9(kernal_B_4_9),
            .PE_out1_1(PE_out_B_1_1), .PE_out1_2(PE_out_B_1_2), .PE_out1_3(PE_out_B_1_3), .PE_out1_4(PE_out_B_1_4), .PE_out1_5(PE_out_B_1_5), .PE_out1_6(PE_out_B_1_6), .PE_out1_7(PE_out_B_1_7), .PE_out1_8(PE_out_B_1_8), .PE_out1_9(PE_out_B_1_9),
            .PE_out2_1(PE_out_B_2_1), .PE_out2_2(PE_out_B_2_2), .PE_out2_3(PE_out_B_2_3), .PE_out2_4(PE_out_B_2_4), .PE_out2_5(PE_out_B_2_5), .PE_out2_6(PE_out_B_2_6), .PE_out2_7(PE_out_B_2_7), .PE_out2_8(PE_out_B_2_8), .PE_out2_9(PE_out_B_2_9),
            .PE_out3_1(PE_out_B_3_1), .PE_out3_2(PE_out_B_3_2), .PE_out3_3(PE_out_B_3_3), .PE_out3_4(PE_out_B_3_4), .PE_out3_5(PE_out_B_3_5), .PE_out3_6(PE_out_B_3_6), .PE_out3_7(PE_out_B_3_7), .PE_out3_8(PE_out_B_3_8), .PE_out3_9(PE_out_B_3_9),
            .PE_out4_1(PE_out_B_4_1), .PE_out4_2(PE_out_B_4_2), .PE_out4_3(PE_out_B_4_3), .PE_out4_4(PE_out_B_4_4), .PE_out4_5(PE_out_B_4_5), .PE_out4_6(PE_out_B_4_6), .PE_out4_7(PE_out_B_4_7), .PE_out4_8(PE_out_B_4_8), .PE_out4_9(PE_out_B_4_9));
    PE peG (.en(en), .conv1(conv_G1), .conv2(conv_G2), .conv3(conv_G3), .conv4(conv_G4), .conv5(conv_G5), .conv6(conv_G6), .conv7(conv_G7), .conv8(conv_G8), .conv9(conv_G9),
            .kernal1_1(kernal_G_1_1), .kernal1_2(kernal_G_1_2), .kernal1_3(kernal_G_1_3), .kernal1_4(kernal_G_1_4), .kernal1_5(kernal_G_1_5), .kernal1_6(kernal_G_1_6), .kernal1_7(kernal_G_1_7), .kernal1_8(kernal_G_1_8), .kernal1_9(kernal_G_1_9),
            .kernal2_1(kernal_G_2_1), .kernal2_2(kernal_G_2_2), .kernal2_3(kernal_G_2_3), .kernal2_4(kernal_G_2_4), .kernal2_5(kernal_G_2_5), .kernal2_6(kernal_G_2_6), .kernal2_7(kernal_G_2_7), .kernal2_8(kernal_G_2_8), .kernal2_9(kernal_G_2_9),
            .kernal3_1(kernal_G_3_1), .kernal3_2(kernal_G_3_2), .kernal3_3(kernal_G_3_3), .kernal3_4(kernal_G_3_4), .kernal3_5(kernal_G_3_5), .kernal3_6(kernal_G_3_6), .kernal3_7(kernal_G_3_7), .kernal3_8(kernal_G_3_8), .kernal3_9(kernal_G_3_9),
            .kernal4_1(kernal_G_4_1), .kernal4_2(kernal_G_4_2), .kernal4_3(kernal_G_4_3), .kernal4_4(kernal_G_4_4), .kernal4_5(kernal_G_4_5), .kernal4_6(kernal_G_4_6), .kernal4_7(kernal_G_4_7), .kernal4_8(kernal_G_4_8), .kernal4_9(kernal_G_4_9),
            .PE_out1_1(PE_out_G_1_1), .PE_out1_2(PE_out_G_1_2), .PE_out1_3(PE_out_G_1_3), .PE_out1_4(PE_out_G_1_4), .PE_out1_5(PE_out_G_1_5), .PE_out1_6(PE_out_G_1_6), .PE_out1_7(PE_out_G_1_7), .PE_out1_8(PE_out_G_1_8), .PE_out1_9(PE_out_G_1_9),
            .PE_out2_1(PE_out_G_2_1), .PE_out2_2(PE_out_G_2_2), .PE_out2_3(PE_out_G_2_3), .PE_out2_4(PE_out_G_2_4), .PE_out2_5(PE_out_G_2_5), .PE_out2_6(PE_out_G_2_6), .PE_out2_7(PE_out_G_2_7), .PE_out2_8(PE_out_G_2_8), .PE_out2_9(PE_out_G_2_9),
            .PE_out3_1(PE_out_G_3_1), .PE_out3_2(PE_out_G_3_2), .PE_out3_3(PE_out_G_3_3), .PE_out3_4(PE_out_G_3_4), .PE_out3_5(PE_out_G_3_5), .PE_out3_6(PE_out_G_3_6), .PE_out3_7(PE_out_G_3_7), .PE_out3_8(PE_out_G_3_8), .PE_out3_9(PE_out_G_3_9),
            .PE_out4_1(PE_out_G_4_1), .PE_out4_2(PE_out_G_4_2), .PE_out4_3(PE_out_G_4_3), .PE_out4_4(PE_out_G_4_4), .PE_out4_5(PE_out_G_4_5), .PE_out4_6(PE_out_G_4_6), .PE_out4_7(PE_out_G_4_7), .PE_out4_8(PE_out_G_4_8), .PE_out4_9(PE_out_G_4_9));

    adder_tree adtR1 (.clk(clk), .rst(rst), .PE_out1(PE_out_R_1_1), .PE_out2(PE_out_R_1_2), .PE_out3(PE_out_R_1_3), .PE_out4(PE_out_R_1_4), .PE_out5(PE_out_R_1_5), .PE_out6(PE_out_R_1_6), .PE_out7(PE_out_R_1_7), .PE_out8(PE_out_R_1_8), .PE_out9(PE_out_R_1_9), .add_out(add_out_R1));
    adder_tree adtR2 (.clk(clk), .rst(rst), .PE_out1(PE_out_R_2_1), .PE_out2(PE_out_R_2_2), .PE_out3(PE_out_R_2_3), .PE_out4(PE_out_R_2_4), .PE_out5(PE_out_R_2_5), .PE_out6(PE_out_R_2_6), .PE_out7(PE_out_R_2_7), .PE_out8(PE_out_R_2_8), .PE_out9(PE_out_R_2_9), .add_out(add_out_R2));
    adder_tree adtR3 (.clk(clk), .rst(rst), .PE_out1(PE_out_R_3_1), .PE_out2(PE_out_R_3_2), .PE_out3(PE_out_R_3_3), .PE_out4(PE_out_R_3_4), .PE_out5(PE_out_R_3_5), .PE_out6(PE_out_R_3_6), .PE_out7(PE_out_R_3_7), .PE_out8(PE_out_R_3_8), .PE_out9(PE_out_R_3_9), .add_out(add_out_R3));
    adder_tree adtR4 (.clk(clk), .rst(rst), .PE_out1(PE_out_R_4_1), .PE_out2(PE_out_R_4_2), .PE_out3(PE_out_R_4_3), .PE_out4(PE_out_R_4_4), .PE_out5(PE_out_R_4_5), .PE_out6(PE_out_R_4_6), .PE_out7(PE_out_R_4_7), .PE_out8(PE_out_R_4_8), .PE_out9(PE_out_R_4_9), .add_out(add_out_R4));

    adder_tree adtB1 (.clk(clk), .rst(rst), .PE_out1(PE_out_B_1_1), .PE_out2(PE_out_B_1_2), .PE_out3(PE_out_B_1_3), .PE_out4(PE_out_B_1_4), .PE_out5(PE_out_B_1_5), .PE_out6(PE_out_B_1_6), .PE_out7(PE_out_B_1_7), .PE_out8(PE_out_B_1_8), .PE_out9(PE_out_B_1_9), .add_out(add_out_B1));
    adder_tree adtB2 (.clk(clk), .rst(rst), .PE_out1(PE_out_B_2_1), .PE_out2(PE_out_B_2_2), .PE_out3(PE_out_B_2_3), .PE_out4(PE_out_B_2_4), .PE_out5(PE_out_B_2_5), .PE_out6(PE_out_B_2_6), .PE_out7(PE_out_B_2_7), .PE_out8(PE_out_B_2_8), .PE_out9(PE_out_B_2_9), .add_out(add_out_B2));
    adder_tree adtB3 (.clk(clk), .rst(rst), .PE_out1(PE_out_B_3_1), .PE_out2(PE_out_B_3_2), .PE_out3(PE_out_B_3_3), .PE_out4(PE_out_B_3_4), .PE_out5(PE_out_B_3_5), .PE_out6(PE_out_B_3_6), .PE_out7(PE_out_B_3_7), .PE_out8(PE_out_B_3_8), .PE_out9(PE_out_B_3_9), .add_out(add_out_B3));
    adder_tree adtB4 (.clk(clk), .rst(rst), .PE_out1(PE_out_B_4_1), .PE_out2(PE_out_B_4_2), .PE_out3(PE_out_B_4_3), .PE_out4(PE_out_B_4_4), .PE_out5(PE_out_B_4_5), .PE_out6(PE_out_B_4_6), .PE_out7(PE_out_B_4_7), .PE_out8(PE_out_B_4_8), .PE_out9(PE_out_B_4_9), .add_out(add_out_B4));

    adder_tree adtG1 (.clk(clk), .rst(rst), .PE_out1(PE_out_G_1_1), .PE_out2(PE_out_G_1_2), .PE_out3(PE_out_G_1_3), .PE_out4(PE_out_G_1_4), .PE_out5(PE_out_G_1_5), .PE_out6(PE_out_G_1_6), .PE_out7(PE_out_G_1_7), .PE_out8(PE_out_G_1_8), .PE_out9(PE_out_G_1_9), .add_out(add_out_G1));
    adder_tree adtG2 (.clk(clk), .rst(rst), .PE_out1(PE_out_G_2_1), .PE_out2(PE_out_G_2_2), .PE_out3(PE_out_G_2_3), .PE_out4(PE_out_G_2_4), .PE_out5(PE_out_G_2_5), .PE_out6(PE_out_G_2_6), .PE_out7(PE_out_G_2_7), .PE_out8(PE_out_G_2_8), .PE_out9(PE_out_G_2_9), .add_out(add_out_G2));
    adder_tree adtG3 (.clk(clk), .rst(rst), .PE_out1(PE_out_G_3_1), .PE_out2(PE_out_G_3_2), .PE_out3(PE_out_G_3_3), .PE_out4(PE_out_G_3_4), .PE_out5(PE_out_G_3_5), .PE_out6(PE_out_G_3_6), .PE_out7(PE_out_G_3_7), .PE_out8(PE_out_G_3_8), .PE_out9(PE_out_G_3_9), .add_out(add_out_G3));
    adder_tree adtG4 (.clk(clk), .rst(rst), .PE_out1(PE_out_G_4_1), .PE_out2(PE_out_G_4_2), .PE_out3(PE_out_G_4_3), .PE_out4(PE_out_G_4_4), .PE_out5(PE_out_G_4_5), .PE_out6(PE_out_G_4_6), .PE_out7(PE_out_G_4_7), .PE_out8(PE_out_G_4_8), .PE_out9(PE_out_G_4_9), .add_out(add_out_G4));

    ReLU relu1 (.add_inR(add_out_R1), .add_inB(add_out_B1), .add_inG(add_out_G1), .Bias(Bias1), .relu_out(relu_out1));
    ReLU relu2 (.add_inR(add_out_R2), .add_inB(add_out_B2), .add_inG(add_out_G2), .Bias(Bias2), .relu_out(relu_out2));
    ReLU relu3 (.add_inR(add_out_R3), .add_inB(add_out_B3), .add_inG(add_out_G3), .Bias(Bias3), .relu_out(relu_out3));
    ReLU relu4 (.add_inR(add_out_R4), .add_inB(add_out_B4), .add_inG(add_out_G4), .Bias(Bias4), .relu_out(relu_out4));




endmodule