# Convolution_Accelerator_for_VGG-16

#### Description：
&emsp;&emsp;使用Verilog HDL來設計一個 DNN 硬體加速器，運算VGG前兩層Convolution Layer，先將 Input data 進行 Padding，使 Convolution 運算後的 Output 長和寬保持在 224x224， 並且透過 LineBuffer 來降低 Input SRAM 的讀取次數以減少功耗，接著透過 PE 內的乘法器將 Input 和 Weight 進行相乘後，經過 Adder Tree 相加，當輸出為最終輸出的時候，加上相對應的 Bias，並經由 ReLU 後輸出 Partial Sum 到 Output SRAM，將輸出的每層 Channel 存成.bmp 圖片檔，第一層 Convolution 輸出尺寸為 224x224x64，可輸出 64 張.bmp 圖片檔，第二層 Convolution 輸出尺寸為 224x224x64，也可輸出 64 張圖.bmp 圖片檔，共可輸出 128 張.bmp 圖片檔。


![Architecture](/Hardware%20architecture.png)
