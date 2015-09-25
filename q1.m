clear all;
input = imread('Einstein.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');

input = imread('circuit_board.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');