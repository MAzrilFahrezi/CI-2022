clear all; 

Irgb = imread('peppers.png');
Igray = 0.2989*Irgb(:,:,1)+0.5870*Irgb(:,:,2)+0.1440*Irgb(:,:,3);

figure; image(Igray, 'CDataMapping', 'scaled'); colormap('gray');
title('Input Image in Grayscale')

I = double(Igray);
classType = class(Igray);
scalingFactor= double(intmax(classType));
I = I/scalingFactor;

Gx = [-1 1];
Gy = Gx';
Ix = conv2(I,Gx,'same');
Iy = conv2(I,Gy,'same');

figure; image(Ix,'CDataMapping','scaled'); colormap('gray'); title('Ix');
figure; image(Iy,'CDataMapping','scaled'); colormap('gray'); title('Iy');

edgeFis=newfis('edgeDetection');

edgeFis = addvar(edgeFis,'input','Ix',[-1 1]);
edgeFis = addvar(edgeFis,'input','Iy',[-1,1]);

sx = 0.1; sy = 0.1;
edgeFis = addmf(edgeFis,'input',1,'zero','gaussmf',[sx 0]);
edgeFis = addmf(edgeFis,'input',2,'zero','gaussmf',[sy 0]);

edgeFis = addvar(edgeFis,'output','Iout',[0 1]);

wa = 0.1; wb = 1; wc = 1;
ba = 0; bb = 0; bc = .7;
edgeFis = addmf(edgeFis,'output', 1,'white','trimf',[wa wb wc]);
edgeFis = addmf(edgeFis,'output', 1,'black','trimf',[wa wb wc]);

figure
subplot(2,2,1);plotmf(edgeFis,'input',1); title(Ix);
subplot(2,2,2);plotmf(edgeFis,'input',2); title(Iy);
subplot(2,2,[3 4]);plotmf(edgeFis,'output',1); title('Iout');









