clear all;
choice =input('choose 1.Einstein 2.PCB; any other number to end program');
if choice==1
     in = imread('Einstein.tif','tiff');
     
     %display input image
figure
colormap(gray(256));
imagesc(in);
title('input image');
[a,b] = size(in)%obtaining rows and columns of the image
numofel= a*b;   %computing the total number of pixels in the image
inp = double(in);
winsize=input('Enter window size ');
%selection of window to filtering
row = a - winsize;
col = b -winsize;
%loops all over the image
for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+(winsize-1))),(y:(y+(winsize-1))));
        nw= reshape(neighborwindow, (winsize^2),1);
        avg = mean(nw);
        filteredim1(x,y) = avg;
        medimg(x,y) = median(nw);%median filtering
        minimg(x,y) = min(nw);%filtering with minimum value
        maximimg(x,y) = max(nw);%filtering with max value
        sdimg(x,y) = std(nw);%filtering with Standard deviation value
      
    end
end

%displays averaging filter output
figure
colormap(gray(256));
image(filteredim1);
title('averaging using  the window size u entered');

%displays median filter output

figure
colormap(gray(256));
imagesc(medimg);
title('median filtered');

%displays minimum filter output
figure
colormap(gray(256));
imagesc(minimg);
title('minimum filtered');

%displays maximum filter output
figure
colormap(gray(256));
imagesc(maximimg);
title('maximum filtered');

%displays standard deviation filter output
figure
colormap(gray(256));
imagesc(sdimg);
title('Standard Deviation filtered');

elseif choice == 2
     in = imread('circuit_board.tif','tiff');
figure
colormap(gray(256));
imagesc(in);
title('input image');
[a,b] = size(in)%obtaining rows and columns of the image
numofel= a*b;   %computing the total number of pixels in the image
inp = double(in);
winsize=input('Enter window size ');
%selection of window to filtering
row = a - winsize;
col = b -winsize;
%loops all over the image
for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+(winsize-1))),(y:(y+(winsize-1))));
        nw= reshape(neighborwindow, (winsize^2),1);
        avg = mean(nw);
        filteredim1(x,y) = avg;
        medimg(x,y) = median(nw);%median filtering
        minimg(x,y) = min(nw);%filtering with minimum value
        maximimg(x,y) = max(nw);%filtering with max value
        sdimg(x,y) = std(nw);%filtering with Standard deviation value
      
    end
end

%displays averaging filter output
figure
colormap(gray(256));
image(filteredim1);
title('averaging using  the window size u entered');

%displays median filter output

figure
colormap(gray(256));
imagesc(medimg);
title('median filtered');

%displays minimum filter output
figure
colormap(gray(256));
imagesc(minimg);
title('minimum filtered');

%displays maximum filter output
figure
colormap(gray(256));
imagesc(maximimg);
title('maximum filtered');

%displays standard deviation filter output
figure
colormap(gray(256));
imagesc(sdimg);
title('Standard Deviation filtered');

else
    print('End of Program');
end


   

