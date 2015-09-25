clear all;
display('this program performs laplacian and gradient');
choice =input('choose 1.Einstein 2.PCB; any other number to end program');
if choice==1
    input = imread('Einstein.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');
[a,b] = size(input)%obtaining rows and columns of the image
laplacianmask1 = [0 1 0; 1 -4 1; 0 1 0];
laplacianmask2 = [1 1 1; 1 -8 1; 1 1 1];
laplacianmask3 = [0 -1 0; -1 4 -1; 0 -1 0];
laplacianmask4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

%laplacian filter using first mask. C = -1 for this filter
laplacianimage1 = imfilter(input, laplacianmask1);
figure 
colormap(gray(256));
imagesc(laplacianimage1)
title('laplacian image for first mask')

sharpimage1 = input + (-1)* [laplacianimage1] ;
figure 
colormap(gray(256));
imagesc(sharpimage1)
title('Sharpened image using first laplacian mask')


%laplacian filter using 2nd mask. C = -1 for this filter
laplacianimage2 = imfilter(input, laplacianmask2);
figure 
colormap(gray(256));
imagesc(laplacianimage2)
title('laplacian image for second mask')

sharpimage2 = input + (-1)* [laplacianimage2] ;
figure 
colormap(gray(256));
imagesc(sharpimage2)
title('Sharpened image using second laplacian mask')

%laplacian filter using 3rd mask. C = 1 for this filter
laplacianimage3 = imfilter(input, laplacianmask3);
figure 
colormap(gray(256));
imagesc(laplacianimage3)
title('laplacian image for first mask')

sharpimage3 = input + (1)* [laplacianimage3] ;
figure 
colormap(gray(256));
imagesc(sharpimage3)
title('Sharpened image using third laplacian mask')


%laplacian filter using 4th mask. C = 1 for this filter
laplacianimage4 = imfilter(input, laplacianmask4);
figure 
colormap(gray(256));
imagesc(laplacianimage4)
title('laplacian image for fourth mask')

sharpimage4 = input + (1)* [laplacianimage4] ;
figure 
colormap(gray(256));
imagesc(sharpimage4)
title('Sharpened image using fourth laplacian mask')
clear all;
input = imread('Einstein.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');
in = double(input);
[a,b] = size(input)%obtaining rows and columns of the image
gradientmask = [-1 -2 -1; 0 0 0; 1 2 1];
gradientmask2 = transpose(gradientmask);
filterimage = imfilter(in, gradientmask);

figure
imagesc(filterimage)
colormap(gray(256));
title('gradient filtered image with first mask');


filterimage2 = imfilter(in, gradientmask2);

figure
imagesc(filterimage2)
colormap(gray(256));
title('gradient filtered image with 2nd mask2');

elseif choice == 2
    input = imread('circuit_board.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');
[a,b] = size(input)%obtaining rows and columns of the image
laplacianmask1 = [0 1 0; 1 -4 1; 0 1 0];
laplacianmask2 = [1 1 1; 1 -8 1; 1 1 1];
laplacianmask3 = [0 -1 0; -1 4 -1; 0 -1 0];
laplacianmask4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

%laplacian filter using first mask. C = -1 for this filter
laplacianimage1 = imfilter(input, laplacianmask1);
figure 
colormap(gray(256));
imagesc(laplacianimage1)
title('laplacian image for first mask')

sharpimage1 = input + (-1)* [laplacianimage1] ;
figure 
colormap(gray(256));
imagesc(sharpimage1)
title('Sharpened image using first laplacian mask')


%laplacian filter using 2nd mask. C = -1 for this filter
laplacianimage2 = imfilter(input, laplacianmask2);
figure 
colormap(gray(256));
imagesc(laplacianimage2)
title('laplacian image for second mask')

sharpimage2 = input + (-1)* [laplacianimage2] ;
figure 
colormap(gray(256));
imagesc(sharpimage2)
title('Sharpened image using second laplacian mask')

%laplacian filter using 3rd mask. C = 1 for this filter
laplacianimage3 = imfilter(input, laplacianmask3);
figure 
colormap(gray(256));
imagesc(laplacianimage3)
title('laplacian image for first mask')

sharpimage3 = input + (1)* [laplacianimage3] ;
figure 
colormap(gray(256));
imagesc(sharpimage3)
title('Sharpened image using third laplacian mask')


%laplacian filter using 4th mask. C = 1 for this filter
laplacianimage4 = imfilter(input, laplacianmask4);
figure 
colormap(gray(256));
imagesc(laplacianimage4)
title('laplacian image for fourth mask')

sharpimage4 = input + (1)* [laplacianimage4] ;
figure 
colormap(gray(256));
imagesc(sharpimage4)
title('Sharpened image using fourth laplacian mask')
clear all;
input = imread('Einstein.tif','tiff');
figure
colormap(gray(256));
imagesc(input);
title('input image');
in = double(input);
[a,b] = size(input)%obtaining rows and columns of the image
gradientmask = [-1 -2 -1; 0 0 0; 1 2 1];
gradientmask2 = transpose(gradientmask);
filterimage = imfilter(in, gradientmask);

figure
imagesc(filterimage)
colormap(gray(256));
title('gradient filtered image with first mask');


filterimage2 = imfilter(in, gradientmask2);

figure
imagesc(filterimage2)
colormap(gray(256));
title('gradient filtered image with 2nd mask2');
    

else
    display('End of program')
end


