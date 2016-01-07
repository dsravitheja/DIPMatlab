I = imread('plants.tif')
figure
imagesc(I)
axis('image')
colormap(gray(256))
title(' Input Image')
[row col]= size(I);
In= double(I);
I = In - 128;

d = dctmtx(8);
for i=[1:8:row]
    for j=[1:8:col]
        subblk=I(i:i+7,j:j+7);
       tmp1 = d * subblk * d' ;
        dct_blk(i:i+7,j:j+7)=tmp1;
    end
end


 
 Q = [1 1 1 1 1 0 0 0;
       1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0] ;
   qual = input('Enter the quality level');
if qual> 50
    Ql = Q* round((100 - qual)/50);
elseif qual < 50
    Ql = Q * round(50/qual);
else
    Ql = Q;
end
   Q = double(Ql);

 for i=[1:8:row]
    for j=[1:8:col]
        subblk1=dct_blk(i:i+7,j:j+7);
        tmp2 = round(subblk1.*Q);
        dctblkq(i:i+7,j:j+7)=tmp2;
    end
 end
 

 for i=[1:8:row]
    for j=[1:8:col]
        subblk3=dctblkq(i:i+7,j:j+7);
        tmp4 = d'* subblk3 * d;             
        idctblk(i:i+7,j:j+7)=tmp4;
    end
 end
        
I2=idctblk
I3 = I2 + 128;

K=mat2gray(I3); % Intensity values of matrix I3
figure
imagesc(K)
axis('image')
colormap(gray(256))
title('Compressed image after zonal Coding Applied')

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