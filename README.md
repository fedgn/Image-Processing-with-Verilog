# Image-Processing-with-Verilog

This project performs convolution of a kernel over an image.

Modules and the connections between them can be obtained in the picture below.

![image](https://user-images.githubusercontent.com/101138868/221303487-769be81d-69e9-48f0-9641-2bc65905fe0b.png)

In the source codes cameraman.tif is used as input image. cameraman.tif's pixel values are written into image.coe file by a MATLAB code so we can initialize BRAM1 with this .coe file.

As kernel, Laplacian Filter is used. This filter performs edge detection.

A MATLAB code (test_image.m) is provided to verify if the Verilog Result matches MATLAB Result

![image](https://user-images.githubusercontent.com/101138868/221303633-5171d742-b514-47fb-874a-b05ec8aca7e7.png)
