% He Feng

% We reversed the image by x-axis, y-axis, and o-coordinate.

clear all;
close all;

image = imread('DailyShow','jpeg');
image_gray = rgb2gray(image);

figure(1);
imshow(image_gray);
imwrite(image_gray, 'Ex4_gray.jpg');

% Determine the number of rows and columns in the original graph.
[N, M] = size(image_gray)

% To reverse the image based on x-axis
for m = 1:M
   for n = 1:N
     new_image_1(n, m) = image_gray(N-n+1,m);
   end 
end

figure(2);
imshow(new_image_1);
imwrite(new_image_1, 'Ex4_part1.jpg');

% To reverse the image based on the y-axis.
for n = 1:N
   for m = 1:M
     new_image_2(n, m) = image_gray(n,M-m+1);
   end 
end
    
figure(3);
imshow(new_image_2);
imwrite(new_image_2, 'Ex4_part2.jpg');

% To reverse the image based on the o-coordinate.
for m = 1:M
   for n = 1:N
     new_image_3(n, m) = image_gray(N-n+1,M-m+1);
   end 
end

figure(4);
imshow(new_image_3);
imwrite(new_image_3, 'Ex4_part3.jpg');
