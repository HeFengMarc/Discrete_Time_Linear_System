% He Feng

% In this exercise, we transfered the image into grayscale style, then
% we found the images which hold the vertical edges, hirizontal edges
% and both horizontal and vertical edges. At the end we reverse the
% brightness and darkness of the previous images

clear all;
close all;

image = imread('DailyShow','jpeg');
image_gray = rgb2gray(image);

% Display the image in 8 bit gray scale format.
figure(1);
imshow(image_gray);
imwrite(image_gray, 'Ex1_gray.jpg')

size(image)
size(image_gray) 

title('We are awesome!'); 

% Vertical convolution kernel.
h1 = [-1 0 1; -2 0 2; -1 0 1];
% Horizontal convolution kernel.
h2 = [1 2 1; 0 0 0; -1 -2 -1];

% Use double function to convert the image to float point values.
double_image_gray = double(image_gray);
M1 = conv2(double_image_gray, h1);
M2 = conv2(double_image_gray, h2);

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
imwrite(new_row, 'Ex1_row_gradient.jpg');

figure(3);
imshow(new_column);
imwrite(new_column, 'Ex1_column_gradient.jpg');

figure(4);
imshow(new_overall);
imwrite(new_overall, 'Ex1_overall_gradient.jpg');

% optional exercise
% To reverse the greyscale of the edge image
optional_image_1 = uint8(255) - new_row;
figure(5);
imshow(optional_image_1);
imwrite(optional_image_1, 'Ex1_optional_1.jpg');

optional_image_2 = uint8(255) - new_column;
figure(6);
imshow(optional_image_2);
imwrite(optional_image_2, 'Ex1_optional_2.jpg');

optional_image_3 = uint8(255) - new_overall;
figure(7);
imshow(optional_image_3);
imwrite(optional_image_3, 'Ex1_optional_3.jpg');
