module PE_buffer (clk, rst, pe_ready, kernal, 
                kernal1_1, kernal1_2, kernal1_3, kernal1_4, kernal1_5, kernal1_6, kernal1_7, kernal1_8, kernal1_9,
                kernal2_1, kernal2_2, kernal2_3, kernal2_4, kernal2_5, kernal2_6, kernal2_7, kernal2_8, kernal2_9,
                kernal3_1, kernal3_2, kernal3_3, kernal3_4, kernal3_5, kernal3_6, kernal3_7, kernal3_8, kernal3_9,
                kernal4_1, kernal4_2, kernal4_3, kernal4_4, kernal4_5, kernal4_6, kernal4_7, kernal4_8, kernal4_9);

    input clk, rst, pe_ready;
    input signed [15:0] kernal;

    output reg signed [15:0] kernal1_1, kernal1_2, kernal1_3, kernal1_4, kernal1_5, kernal1_6, kernal1_7, kernal1_8, kernal1_9,
                kernal2_1, kernal2_2, kernal2_3, kernal2_4, kernal2_5, kernal2_6, kernal2_7, kernal2_8, kernal2_9,
                kernal3_1, kernal3_2, kernal3_3, kernal3_4, kernal3_5, kernal3_6, kernal3_7, kernal3_8, kernal3_9,
                kernal4_1, kernal4_2, kernal4_3, kernal4_4, kernal4_5, kernal4_6, kernal4_7, kernal4_8, kernal4_9;


    integer i;
    reg signed [15:0] kerl [0:35];

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            for(i = 0; i <= 35; i = i + 1) kerl[i] <= 16'b0;
        end
        else if(pe_ready) begin
            for(i = 0; i <= 34; i = i + 1) begin
                kerl[i] <= kerl[i+1];
            end
            kerl[35] <= kernal;
        end
        else begin
            for(i = 0; i <= 35; i = i + 1) begin
                kerl[i] <= kerl[i];
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            kernal1_1 <= 16'b0;
            kernal1_2 <= 16'b0;
            kernal1_3 <= 16'b0;
            kernal1_4 <= 16'b0;
            kernal1_5 <= 16'b0;
            kernal1_6 <= 16'b0;
            kernal1_7 <= 16'b0;
            kernal1_8 <= 16'b0;
            kernal1_9 <= 16'b0;

            kernal2_1 <= 16'b0;
            kernal2_2 <= 16'b0;
            kernal2_3 <= 16'b0;
            kernal2_4 <= 16'b0;
            kernal2_5 <= 16'b0;
            kernal2_6 <= 16'b0;
            kernal2_7 <= 16'b0;
            kernal2_8 <= 16'b0;
            kernal2_9 <= 16'b0;

            kernal3_1 <= 16'b0;
            kernal3_2 <= 16'b0;
            kernal3_3 <= 16'b0;
            kernal3_4 <= 16'b0;
            kernal3_5 <= 16'b0;
            kernal3_6 <= 16'b0;
            kernal3_7 <= 16'b0;
            kernal3_8 <= 16'b0;
            kernal3_9 <= 16'b0;

            kernal4_1 <= 16'b0;
            kernal4_2 <= 16'b0;
            kernal4_3 <= 16'b0;
            kernal4_4 <= 16'b0;
            kernal4_5 <= 16'b0;
            kernal4_6 <= 16'b0;
            kernal4_7 <= 16'b0;
            kernal4_8 <= 16'b0;
            kernal4_9 <= 16'b0;
        end
        else begin
            kernal1_1 <= kerl[0];
            kernal1_2 <= kerl[1];
            kernal1_3 <= kerl[2];
            kernal1_4 <= kerl[3];
            kernal1_5 <= kerl[4];
            kernal1_6 <= kerl[5];
            kernal1_7 <= kerl[6];
            kernal1_8 <= kerl[7];
            kernal1_9 <= kerl[8];

            kernal2_1 <= kerl[9];
            kernal2_2 <= kerl[10];
            kernal2_3 <= kerl[11];
            kernal2_4 <= kerl[12];
            kernal2_5 <= kerl[13];
            kernal2_6 <= kerl[14];
            kernal2_7 <= kerl[15];
            kernal2_8 <= kerl[16];
            kernal2_9 <= kerl[17];

            kernal3_1 <= kerl[18];
            kernal3_2 <= kerl[19];
            kernal3_3 <= kerl[20];
            kernal3_4 <= kerl[21];
            kernal3_5 <= kerl[22];
            kernal3_6 <= kerl[23];
            kernal3_7 <= kerl[24];
            kernal3_8 <= kerl[25];
            kernal3_9 <= kerl[26];

            kernal4_1 <= kerl[27];
            kernal4_2 <= kerl[28];
            kernal4_3 <= kerl[29];
            kernal4_4 <= kerl[30];
            kernal4_5 <= kerl[31];
            kernal4_6 <= kerl[32];
            kernal4_7 <= kerl[33];
            kernal4_8 <= kerl[34];
            kernal4_9 <= kerl[35];          
        end
    end

endmodule