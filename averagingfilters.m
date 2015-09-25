clear all;
choice =input('choose 1.Einstein 2.PCB; any other number to end program');
if choice==1
    in= imread('Einstein.tif','tiff');
figure
colormap(gray(256));
imagesc(in);
title('input image');
[a,b] = size(in)%obtaining rows and columns of the image
numofel= a*b;   %computing the total number of pixels in the image
inp = double(in);
filteredim1 = zeros(a,b);
filteredim2 = zeros(a,b);
filteredim3 = zeros(a,b);
filteredim4 = zeros(a,b);
%3 by 3 window
row = a - 3;
col = b -3;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+2)),(y:(y+2)));
        nw= reshape(neighborwindow, 9,1);
        avg = mean(nw);
        filteredim1(x,y) = avg;
        medimg(x,y) = median(nw);
        %winpix = winpix+1;
    end
end

figure
colormap(gray(256));
image(filteredim1);
title('3x3 averaging');

%5 by 5 window
row = a - 5;
col = b -5;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+4)),(y:(y+4)));
        nw= reshape(neighborwindow, 25,1);
        avg = mean(nw);
        filteredim2(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim2);
title('5x5 averaging');


%7 by 7 window
row = a - 7;
col = b -7;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+6)),(y:(y+6)));
        nw= reshape(neighborwindow, 49,1);
        avg = mean(nw);
        filteredim3(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim3);
title('7x7 averaging');



%15 by 15 window
row = a - 15;
col = b -15;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+14)),(y:(y+14)));
        nw= reshape(neighborwindow, 225,1);
        avg = mean(nw);
        filteredim4(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim4);
title('15x15 averaging');


elseif choice == 2
    in= imread('circuit_board.tif','tiff');
figure
colormap(gray(256));
imagesc(in);
title('input image');
[a,b] = size(in)%obtaining rows and columns of the image
numofel= a*b;   %computing the total number of pixels in the image
inp = double(in);
filteredim1 = zeros(a,b);
filteredim2 = zeros(a,b);
filteredim3 = zeros(a,b);
filteredim4 = zeros(a,b);
%3 by 3 window
row = a - 3;
col = b -3;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+2)),(y:(y+2)));
        nw= reshape(neighborwindow, 9,1);
        avg = mean(nw);
        filteredim1(x,y) = avg;
        medimg(x,y) = median(nw);
        %winpix = winpix+1;
    end
end

figure
colormap(gray(256));
image(filteredim1);
title('3x3 averaging');

%5 by 5 window
row = a - 5;
col = b -5;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+4)),(y:(y+4)));
        nw= reshape(neighborwindow, 25,1);
        avg = mean(nw);
        filteredim2(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim2);
title('5x5 averaging');


%7 by 7 window
row = a - 7;
col = b -7;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+6)),(y:(y+6)));
        nw= reshape(neighborwindow, 49,1);
        avg = mean(nw);
        filteredim3(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim3);
title('7x7 averaging');



%15 by 15 window
row = a - 15;
col = b -15;

for x = 1:row
    for y = 1:col
        neighborwindow =  inp((x:(x+14)),(y:(y+14)));
        nw= reshape(neighborwindow, 225,1);
        avg = mean(nw);
        filteredim4(x,y) = avg;
    end
end

figure
colormap(gray(256));
image(filteredim4);
title('15x15 averaging');

else
    display('End of program')
end
