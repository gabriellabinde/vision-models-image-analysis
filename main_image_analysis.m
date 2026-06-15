%% 0. Delimit the path/folder you will be working on
clear all; close all; clc; addpath(genpath('../TP'));

% 1. Call & Name the image with the 'double fonction' so it's coded in values between 0 (black) and 255 (white)

img1 = double(imread('images/ima01.tif'));
%img2 = double(imread('images/ima13.tif'));
img3 = double(imread('images/ima25.tif'));


% 2. 'figure' to open a new image window; 'imagesc' to scan it; 'colormap(gray)' to set the original colour (b&w); title('...') to title it;
figure;imagesc(img1);colormap(gray);title('img1 Paisage'); colorbar;
%figure;imagesc(img2);colormap(gray);title('Ville');
figure;imagesc(img3);colormap(gray);title('Forest');

%3. Filtrage Gabor: to detect edges, stripes/lines and textures at a given direction (horizontal/vertical/diagonal) in a given scale

filtrage_gabor(img1); 

% 4. Fourier Transformer 'img1' to calculate the amplitude spectrum of the image: variable_1 = figure;imagesc(log(abs(variable_1)))

A = fft2(img1); % fft2 for 2D images
B = fftshift(A); % shifts the zero-frequency component to the center of the spectrum
C = abs(B); % absolut value
D = log(C); % reduces the values' range, compress into a smaller scale
figure;imagesc(D);title('FFT of img1');colormap(gray);
colorbar; % to show the range bar

% 5. Calculate the image's global mean. You can also store this value in a variable, like 'E'

E = mean(img1(:));

% 6. Calculate the mean of each colum

F = mean(img1);

% 7. Supressing the global mean from 'img1' from the columns mean's (per-column means) ver tudo por pixel

G = img1-E; % or img1-mean(img1(:));

% 8. Fourier Transformer 'img1' to calculate the amplitude spectrum of the image MINUS the image's MEAN:
H = fft2(G); % Fourier Transform of the mean-subtracted image
B_H = fftshift(H); % Shift the zero-frequency component to the center
C_H = abs(B_H); % Calculate the magnitude
D_H = log(C_H + 1); % Logarithmic scale for better visualization
figure; imagesc(D_H); colormap(gray); colorbar; title ('FFT img1 - its mean') % Display the log magnitude spectrum

% %A;B;C;D;

% figure;imagesc(D);colorbar;
% 
% figure;imagesc(G);colormap(gray);
% 
% 
% 9. Comparing image 01 and 25 on Fourier Transformer:

figure;imagesc(img3);colormap(gray);title('Forest');

%Subrtracting mean value of img3:

E_3 = mean(img3(:));
F_3 = mean(img3);

G_3 = img3-mean(img3(:));

%Fourier Transformer 'img3' to calculate the amplitude spectrum of the image MINUS the image's MEAN:
H_3 = fft2(G_3); % Fourier Transform of the mean-subtracted image
B_H_3 = fftshift(H_3); % Shift the zero-frequency component to the center
C_H_3 = abs(B_H_3); % Calculate the magnitude
D_H_3 = log(C_H_3 + 1); % Logarithmic scale for better visualization
figure; imagesc(D_H_3); colormap(gray); colorbar; title ('FFT img3 - its mean') % Display the log magnitude spectrum

%Comparing Image 1 and Image 3 amplitude spectrum 

figure;

% Show amplitude spectre image Img1
subplot(1, 2, 1); % 1 row, 2 columns, position 1
imagesc(D_H);colormap(gray); colorbar;
title('FFT img1 - its mean');

% Show amplitude spectre image Img3
subplot(1, 2, 2); % 1 row, 2 columns, position 2
imagesc(D_H_3);colormap(gray); colorbar;
title('FFT img3 - its mean');

% 10. Apply Hanning window to img3
%hanningWindow = hann(size(img3, 1)) * hann(size(img3, 2))'; % Create a 2D Hanning window
img3_hanning = fenetre_hanning(G_3); % Apply the Hanning window
figure; imagesc(img3_hanning); colormap(gray); title('Forest with Hanning Window');

% FFT after Hann
H_hann_3   = fft2(img3_hanning);
B_H_hann_3 = fftshift(H_hann_3);
C_H_hann_3 = abs(B_H_hann_3);
D_H_hann_3 = log(C_H_hann_3 + 1);
figure; imagesc(D_H_hann_3); colormap(gray); colorbar;
title('FFT img3 (mean removed + Hanning)');

% Apply Hanning window to img1
img1_hanning = fenetre_hanning(G); % Apply the Hanning window
figure; imagesc(img1_hanning); colormap(gray); title('Paisage with Hanning Window');

% FFT after Hann
H_hann   = fft2(img1_hanning);
B_H_hann = fftshift(H_hann);
C_H_hann = abs(B_H_hann);
D_H_hann = log(C_H_hann + 1);
figure; imagesc(D_H_hann); colormap(gray); colorbar;
title('FFT img1 (mean removed + Hanning)');

%Comparing Img 1 pre-traitment vs post (Hanning's window)

% Compare pre/post Hann (img1)
figure;
subplot(1,2,1); imagesc(D_H);      colormap(gray); colorbar; title('FFT img1 - mean (pre)');
subplot(1,2,2); imagesc(D_H_hann); colormap(gray); colorbar; title('FFT img1 - mean + Hann (post)');

% Compare pre/post Hann (img3)
figure;
subplot(1,2,1); imagesc(D_H_3);      colormap(gray); colorbar; title('FFT img3 - mean (pre)');
subplot(1,2,2); imagesc(D_H_hann_3); colormap(gray); colorbar; title('FFT img3 - mean + Hann (post)');

% 11. Rotate the modified image
% Preprocess img1 (mean removal + Hann) 
img1_pret = pre_traitement(img1);

% Rotate by 45°
% img1_rot = imrotate(img1, 45);
img1_rot = imrotate(img1, 45, 'bilinear', 'crop');
figure; imagesc(img1_rot); colormap(gray); colorbar; title('img1 rotated 45°');
% 
% Compare spectra (preprocessed versions)
img1_rot_pret = pre_traitement(img1_rot);

%FFT of both

S1     = log(abs(fftshift(fft2(img1_pret))) + 1);
S1_rot = log(abs(fftshift(fft2(img1_rot_pret))) + 1);

figure;
subplot(1,2,1); imagesc(S1);     colormap(gray); colorbar; title('Spectrum img1 (pretraitement)');
subplot(1,2,2); imagesc(S1_rot); colormap(gray); colorbar; title('Spectrum rotated img1 (pretraitement)');
% 

% 3.4/3.5 Rosace (Values frequency 4, Oritentation 4 )
% Freq = 4;
% Ori  = 4;
figure;
R1 = rosace_gabor(img1_pret);
R1_rot = rosace_gabor(img1_rot_pret);


subplot(1,2,1); imagesc(R1);     colormap(gray); colorbar; title('Rosace img1 (4x4)');
subplot(1,2,2); imagesc(R1_rot); colormap(gray); colorbar; title('Rosace img1 rotated (4x4)');



% % 3.6 / 3.7 SCALE (x1.5 and x1/1.5) + rosette

figure;


%Big
img1_big = imresize(img1, 1.5);
img1_big_pret = pre_traitement(img1_big);
R1_big = rosace_gabor(img1_big_pret);


%Small

img1_small = imresize(img1, 1/1.5);
img1_small_pret = pre_traitement(img1_small);
R1_small = rosace_gabor(img1_small_pret);

%FFT of both

Big1     = log(abs(fftshift(fft2(img1_big_pret))) + 1);
Small1 = log(abs(fftshift(fft2(img1_small_pret))) + 1);

figure;
subplot(1,2,1); imagesc(Big1);     colormap(gray); colorbar; title('Spectrum img1 (Scale 1.5)');
subplot(1,2,2); imagesc(Small1); colormap(gray); colorbar; title('Spectrum img1 (Scale1/1.5)');

figure;

subplot(1,3,1); imagesc(R1);       colormap(gray); colorbar; title('Rosace original');
subplot(1,3,2); imagesc(R1_big);   colormap(gray); colorbar; title('Rosace x1.5');
subplot(1,3,3); imagesc(R1_small); colormap(gray); colorbar; title('Rosace x(1/1.5)');


