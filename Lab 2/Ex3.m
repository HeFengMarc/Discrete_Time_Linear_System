% He Feng

% We used two scaling functions to scale an image by using the scale
% factors 2 and 5.

clear all;
close all;

image = imread('DailyShow','jpeg');
image_gray = rgb2gray(image);

% Open different figures and draw the gray graph by using
% basic scale and average an then basic sclae with different
% scale factor.
figure(1);
imshow(image_gray);
imwrite(image_gray, 'Ex3_gray.jpg');

figure(2);
image_normalscale_1 = scaleimage(image_gray, 2);
imshow(image_normalscale_1);
imwrite(image_normalscale_1, 'Ex3_basicscale_2.jpg');

figure(3);
image_averagescale_1 = averagethenscaleimage(image_gray, 2);
imshow(image_averagescale_1);
imwrite(image_averagescale_1, 'Ex3_averagescale_2.jpg');

figure(4);
image_normalscale_2 = scaleimage(image_gray, 5);
imshow(image_normalscale_2);
imwrite(image_normalscale_2, 'Ex3_basicscale_5.jpg');

figure(5);
image_averagescale_2 = averagethenscaleimage(image_gray, 5);
imshow(image_averagescale_2);
imwrite(image_averagescale_2, 'Ex3_averagescale_5.jpg');

