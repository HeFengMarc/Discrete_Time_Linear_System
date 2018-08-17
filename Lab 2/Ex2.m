% He Feng

% This exercise is similar to the Ex1, and the only difference is we used
% our own image for the processing. The original image and three edge
% images will be printed out.

clear all;
close all;

figure(1);
image = imread('Xue', 'png');
image_gray = rgb2gray(image);
imshow(image_gray);
imwrite(image_gray, 'image_gray.jpg');

% Vertical convolution kernal.
h1 = [-1 0 1; -2 0 2; -1 0 1];
% Horizontal convolution kernal.
h2 = [1 2 1; 0 0 0; -1 -2 -1];

double_image_grey = double(image_gray);
M1 = conv2(double_image_grey, h1);
M2 = conv2(double_image_grey, h2);

% Determine the row gradient magnitude, column gradient magnitude
% and overall gradient magnitude.
row_gradient = (M1.^2).^(1/2);
column_gradient = (M2.^2).^(1/2);
overall_gradient = (M1.^2 + M2.^2).^(1/2); 

% Using uint8 function to convert the values to uint8 type,
% which means values outside [0, 2^8-1] will map to the nearest
% endpoint.
new_row = uint8(row_gradient);
new_column = uint8(column_gradient);
new_overall = uint8(overall_gradient);

% Draw each edge image.
figure(2);
imshow(new_row);
imwrite(new_row, 'Ex2_row_gradient.jpg');

figure(3);
imshow(new_column);
imwrite(new_column, 'Ex2_column_gradient.jpg');

figure(4);
imshow(new_overall);
imwrite(new_overall, 'Ex2_overall_gradient.jpg');

