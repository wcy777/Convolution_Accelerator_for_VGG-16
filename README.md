# Convolution_Accelerator_for_VGG-16

#### Description：使用 Verilog HDL 來設計一個 DNN 硬體加速器，運算 Fig. 2 的 VGG 前兩層 Convolution Layer，
並將 Input data 進行 Fig. 3 的 Padding 後，使 Convolution 運算後的 Output 
長和寬保持在 224x224，透過 Fig. 4 的 LineBuffer 降低 Input SRAM 的讀取次
數減少功耗，透過 PE 內的乘法器將 Input 和 Weight 進行相乘後，經過
Adder Tree 相加，並經由 Fig. 5 的 ReLU 輸出 Partial Sum 到 Output SRAM，當
輸出為最終輸出的時候，加上相對應的 Bias 後，將輸出的每層 Channel 存
成.bmp 圖片檔，第一層 Convolution 輸出尺寸為 224x224x64，可輸出 64
張.bmp 圖片檔，第二層 Convolution 輸出尺寸為 224x224x64，也可輸出 64
張圖.bmp 圖片檔，共可輸出 128 張.bmp 圖片檔。
