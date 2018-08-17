% He Feng

% We increased the row length and column length by 2 by using the function
% we made before. We transfer the original image to grayscale format, then
% we call the function to process the image.

clear all; 
close all;

image = imread('DailyShow','jpeg');
image_gray = rgb2gray(image);

% Initially print out the original photo in gray scale.
figure(1);
imshow(image_gray);

% Using the function which can enlarge photos to times the x-value and
% y-value of the original photo by two.
new_image = bi_interp(image_gray);

% Transfer the image back to type uint8
final_image = uint8(new_image);

figure(2);
imshow(final_image);
imwrite(final_image, 'enlarged_image.jpg');
