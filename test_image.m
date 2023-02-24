clc;
clear;

% read input image in decimal form
image = imread('cameraman.tif');
image = imresize(image, 0.5);
% padding
input_image = uint8(zeros(130,130));
input_image(2:129,2:129) = image;
% Convolution
kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 
conv_image = uint8(conv2(input_image,kernel,'valid'));


% read output file
fileID = fopen('./output_image.txt','r');
image2 = fscanf(fileID, '%s');
image3 = uint8(zeros(128,128));
for i=1:1:128
    for j=1:1:128
        image3(i,j) = hex2dec(strcat(image2(1,256*(i-1)+2*j-1),image2(1,256*(i-1)+2*j)));
    end
end
output_image = image3;


% --- Display original image, MATLAB's result and your result
figure(1)
subplot(3,1,1)
imshow(uint8(input_image), [0 255]);
xlabel('Original Image')
subplot(3,1,2)
imshow(uint8(conv_image), [0 255]);
xlabel('MATLAB Output Image')
subplot(3,1,3)
imshow(uint8(output_image), [0 255]);
xlabel('Verilog Design Output Image')

equal = isequal(conv_image,output_image);

fclose(fileID);
