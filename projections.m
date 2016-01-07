%%
clear all;
close all;

img = imread('shepp-logan_phantom.tif','tiff');

[rlen,clen,dum] = size(img);

% img = rgb2gray(img);

figure
imagesc(img)
axis('image')
axis('off')
colormap(gray(256))
title('Shepp Logan Phantom')

dtheta = 0.5;
ntheta = floor(180/dtheta);
theta = (0:(ntheta-1))*dtheta;

R = radon(img,theta);

[rlen_R,clen_R] = size(R);  
yaxis = 0:(rlen_R-1);

figure
imagesc(theta,yaxis,R)
axis('image')
xlabel('theta, degress')
ylabel('projection location index')
title(['Shepp Logan Projections, num proj = ', num2str(ntheta)])

% %%
% %can also use the famous "shepp-logan" phantom.
% p = phantom('Modified Shepp-Logan',256);
% 
% figure
% imagesc(p)
% axis('image')
% axis('off')
% colormap(gray(256))
% title('Modified Shepp-Logan Phantom')
% 
% dthetap = 0.5;
% nthetap = floor(180/dthetap);
% thetap = (0:(nthetap-1))*dthetap;
% 
% Rp = radon(p,theta);
% 
% [rlen_Rp,clen_Rp] = size(Rp);  
% yaxisp = 0:(rlen_Rp-1);
% 
% figure
% imagesc(thetap,yaxisp,Rp)
% axis('image')
% xlabel('theta, degress')
% ylabel('projection location index')
% title(['Modified Shepp-Logan Projections, num proj = ', num2str(ntheta)])

%%
%inverse transformation

dtheta = 10;
ntheta = floor(180/dtheta);
theta = (0:(ntheta-1))*dtheta;

R = radon(img,theta);

recon1 = iradon(R,theta,'linear','Cosine');

figure
imagesc(theta,yaxis,recon1)
axis('image')
axis('off')
colormap(gray(256))
title(['Shepp Logan Projections, num proj = ', num2str(ntheta)])

dtheta = 5;
ntheta = floor(180/dtheta);
theta = (0:(ntheta-1))*dtheta;

R = radon(img,theta);

recon1 = iradon(R,theta,'linear','Cosine');

figure
imagesc(theta,yaxis,recon1)
axis('image')
axis('off')
colormap(gray(256))
title(['Shepp Logan Projections, num proj = ', num2str(ntheta)])

dtheta = 1;
ntheta = floor(180/dtheta);
theta = (0:(ntheta-1))*dtheta;

R = radon(img,theta);

recon1 = iradon(R,theta,'linear','Cosine');

figure
imagesc(theta,yaxis,recon1)
axis('image')
axis('off')
colormap(gray(256))
title(['Shepp Logan Projections, num proj = ', num2str(ntheta)])

dtheta = 0.5;
ntheta = floor(180/dtheta);
theta = (0:(ntheta-1))*dtheta;

R = radon(img,theta);

recon1 = iradon(R,theta,'linear','Cosine');

figure
imagesc(theta,yaxis,recon1)
axis('image')
axis('off')
colormap(gray(256))
title(['Shepp Logan Projections, num proj = ', num2str(ntheta)])