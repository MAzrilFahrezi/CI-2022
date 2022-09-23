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





