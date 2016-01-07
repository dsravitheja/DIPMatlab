I = imread('plants.tif')
figure
imagesc(I)
axis('image')
colormap(gray(256))
title(' Input Image')

[row col]= size(I);
In= double(I);
I = In - 128;
d = dctmtx(8);      % Create DCT Matrix

%Applying DCT to the subimage blocks
for i=[1:8:row]
    for j=[1:8:col]
        subblk=I(i:i+7,j:j+7);

        tmp1 = d * subblk * d' ;
        dctblk(i:i+7,j:j+7)=tmp1;
    end
end

Q = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99] ;
 % Checking for the quality level required
qual = input('Enter the quality level');
if qual> 50
    Ql = Q* round((100 - qual)/50);
elseif qual < 50
    Ql = Q * round(50/qual);
else
    Ql = Q;
end
   Q = double(Ql);
   
   % Quantization process
 for i=[1:8:row]
    for j=[1:8:col]
        subblk1=dctblk(i:i+7,j:j+7);
        tmp2 = round(subblk1./Q);
        dctblkq(i:i+7,j:j+7)=tmp2;
    end
 end
 
 % Dequantization
 for i=[1:8:row]
    for j=[1:8:col]
        subblk2=dctblkq(i:i+7,j:j+7);
        tmp3 = subblk2.* Q;
%           win3 = win3';   
        dctblkdq(i:i+7,j:j+7)=tmp3;
        
    end
 end

 % Inverse DCT
 for i=[1:8:row]
    for j=[1:8:col]
        subblk3=dctblkdq(i:i+7,j:j+7);
        tmp4 = d'* subblk3 * d;
        idctblk(i:i+7,j:j+7)=tmp4;
    end
 end
        
I2=idctblk
% I3 = I2 + (128*ones(512)); 

K=mat2gray(I2);     % For Displaying intensity values 
figure
imagesc(K)
axis('image')
colormap(gray(256))
title('Compressed image after applying Threshold Coding ')

% Linear Predictive Coding

lpc1 = zeros(row,col);
lpc2 = zeros(row,col);
lpdc1 = zeros(row,col);
lpdc2 = zeros(row,col);

%mat2lpc is function given to encode using  linear predictive coding
        lpimg1 = mat2lpc(I);
        lpimg2 = mat2lpc(I3);
        lpc1 = lpimg1;
        lpc2 = lpimg2;
        
        % lpc2mat is function available to decode encoded matrix using
        % mat2lpc
        lpdimg1 = lpc2mat(lpc1);
        lpdimg2 = lpc2mat(lpc2);
        lpdc1 = lpdimg1;
        lpdc2 = lpdimg2;
  
figure
imagesc(lpc1)
axis('image')
colormap(gray(256))
title(' Linear Predictive coded for input image')

figure
imagesc(lpc2)
axis('image')
colormap(gray(256))
title(' Linear Predictive coded for compressed image')

% %Huffman encoding - Ideally this encoding is performed and then decoded.
% But hardware limitations didnt allow it to be implemented.
% N=imhist(I);
% prob = N/(row*col); %formulating the probability matrix
% 
% figure
% plot(prob)
% xlabel('gray level + 1')
% ylabel('probability')
% title('histogram of input image')
% 
% symbols = 0:255;
% [dict,avl] = huffmandict(symbols,prob,2);  %choice of 2 yields binary code
% enco = huffmanenco(I(:),dict);
% deco = huffmandeco(enco,dict);

figure
imagesc(lpdc1)
axis('image')
colormap(gray(256))
title(' Decoded image of Linear Predictive coded input image')

figure
imagesc(lpdc2)
axis('image')
colormap(gray(256))
title(' Decoded image of Linear Predictive coded  compressed image')