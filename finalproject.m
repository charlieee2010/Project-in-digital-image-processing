%%
clc , close all, clear all ;
a = imread('wow.jpeg');
imshow(a)

%% q2
%1:2
% by comprass the avarage of each two cells
clc , close all, clear all ;
a = imread('wow.jpeg');
c = zeros(1152, 1024);
c = a (:, :, 1);
for i = 1:1:1152;
    for j = 2:2:2048;
        d(i,j/2)=(c(i,j)+c(i,j-1))/2;
        
    end
end
figure, imshow(uint8(d));
imwrite(d,"d12.jpeg");
%% 1:4
% by comprass the avarage of each 2*2 cells
clc , close all, clear all ;
a = imread('wow.jpeg');
c = zeros(576, 1024);
c = a (:, :, 1);
for i = 1:1:1152;
    for j = 2:2:2048;
        d(i,j/2)=(c(i,j)+c(i,j-1))/2;
    end
end
for j = 1:1:1024;
    for i = 2:2:1152;
        e(i/2,j)=(d(i,j)+d(i-1,j))/2;
    end
end
figure, imshow(uint8(e));
imwrite(e,"e14.jpeg");
%% 1:16
%by comprass the avarage of each 4*4 cells
clc , close all, clear all ;
a = imread('wow.jpeg');
c = zeros(288,512);
c = a (:, :, 1);
    for i = 1:1:1152;
       for j = 4:4:2048;
        d(i,j/4)=(c(i,j)+c(i,j-1)+c(i,j-2)+c(i,j-3))/4;
       end
    end
    for j = 1:1:512;
       for i = 4:4:1152;
        e(i/4,j)=(d(i,j)+d(i-1,j)+d(i-2,j)+d(i-3,j))/4;
       end
    end
figure, imshow(uint8(e));
imwrite(e,"e116.jpeg");
%% q3
% The calculation of the signal's energy (with noise)
clc , close all, clear all ;
a = imread('wow.jpeg');
SNR = 15;
p_img = sum(uint8(a),'all')/(1152*2048);
p_noise =p_img/SNR;
imgnoise  = zeros(1152,2048); 
imgnoise = a (:, :, 1);
for i = 1:1:1152 
    for j = 1:1:2048
        imgnoise(i,j) = a(i,j) + normrnd(0,p_noise);
    end
end
imshow(imgnoise);
imwrite(imgnoise,"imgnoise.jpeg");

%% 3.2
% 
%downsampling the noisy image 1:2
%    by  1:2 with modulo 
for i = 1:1:1152 
    for j = 1:1:2048
       imgnoise2(i,j) = imgnoise(i,j)- mod(imgnoise(i,j),2);
    end
end
imshow(imgnoise2);
imwrite(imgnoise,"imgnoise2.jpeg");
%% 3.3
% downsampling the noisy image 1:4
%    by 1:4 with modulo

for i = 1:1:1152 
    for j = 1:1:2048
       imgnoise3(i,j) = imgnoise(i,j)- mod(imgnoise(i,j),4);
    end
end
imshow(imgnoise3);
imwrite(imgnoise,"imgnoise3.jpeg");

%% 3.4
% 1:16 downsampling the noisy image 1:16
%    by 1:16 with modulo 

for i = 1:1:1152 
    for j = 1:1:2048
       imgnoise4(i,j) = imgnoise(i,j)- mod(imgnoise(i,j),16);
    end
end
imshow(imgnoise4);
imwrite(imgnoise,"imgnoise4.jpeg");
%% Q4
clc , close all, clear all ;
a = imread('Q4.jpg');
imshow(a)
%%
%1:2 by the average of 2 cells
clc , close all, clear all ;
a = imread('Q4.jpg');
c = zeros(715, 1234);
c = a (:, :, 1);
for i = 1:1:715;
    for j = 2:2:1234;
        d(i,j/2)=(c(i,j)+c(i,j-1))/2;
        
    end
end
figure, imshow(uint8(d));
imwrite(d,"d412.jpeg");
%% 1:4
%by the average of 2*2 cells
clc , close all, clear all ;
a = imread('Q4.jpg');
c = zeros(357, 617);
c = a (:, :, 1);
for i = 1:1:715;
    for j = 2:2:1234;
        d(i,j/2)=(c(i,j)+c(i,j-1))/2;
    end
end
for j = 1:1:617;
    for i = 2:2:715;
        e(i/2,j)=(d(i,j)+d(i-1,j))/2;
    end
end
figure, imshow(uint8(e));
imwrite(e,"e414.jpeg");
%% 1:16
%by the average of 4*4 cells
clc , close all, clear all ;
a = imread('Q4.jpg');
c = zeros(178,308);
c = a (:, :, 1);
    for i = 1:1:715;
       for j = 4:4:1234;
        d(i,j/4)=(c(i,j)+c(i,j-1)+c(i,j-2)+c(i,j-3))/4;
       end
    end
    for j = 1:1:308;
       for i = 4:4:715;
        e(i/4,j)=(d(i,j)+d(i-1,j)+d(i-2,j)+d(i-3,j))/4;
       end
    end
figure, imshow(uint8(e));
imwrite(e,"e4116.jpeg");

%% Q5
%from numeric table to boolean table
clc , close all, clear all ;
Q4_boo = imread('Q4.jpg');
   for i = 1:1:715
      for j = 1:1:1234
          if Q4_boo(i,j) > 256/2 % changes values to 0 or 255 only:
            Q4_boo(i,j) = 255;
          else
            Q4_boo(i,j) = 0;
          end
      end
  end
figure, imshow(uint8(Q4_boo));
imwrite(Q4_boo,"Q4_boo.jpeg");

%% Q6

% 6.1
%   measure how much time it takes to sum 1024 cells

clc , close all, clear all ;
a = imread('wow.jpeg');
ktable = zeros(10,100);
j=100;
sumrc =0;
sum = 0;
  for i = 1:1:10
      for j = 1:1:100
            ktable(i,j) = a(i,j);
      end
  end
% sum of the table
% sum by rowes and columns
tic
 for i = 1:1:10;
     for j = 1:1:100;
        if j < 99;
           sumrc=sumrc + ktable(i,100-j);
        end
     end
 end 
toc
% sum one by one
tic
 for i = 1:1:10;
     for j = 1:1:100;
           sum=sum + ktable(i,j);
     end
 end 
toc

% 6.2
ratio = 32;
tab8level = uint8(zeros(10, 100));
tic
for i = 1:1:10;
    for j = 1:1:100;
        if (ktable(i,j) < 1*ratio) 
            tab8level(i,j) = 0*ratio;
        elseif (ktable(i,j) < 2*ratio)
            tab8level(i,j) = 1*ratio;
        elseif (ktable(i,j) < 3*ratio)
            tab8level(i,j) = 2*ratio;
        elseif (ktable(i,j) < 4*ratio)
            tab8level(i,j) = 3*ratio;
        elseif (ktable(i,j) < 5*ratio)
            tab8level(i,j) = 4*ratio;
        elseif (ktable(i,j) < 6*ratio)
            tab8level(i,j) = 5*ratio;
        elseif (ktable(i,j) < 7*ratio)
            tab8level(i,j) = 6*ratio;
        else
            tab8level(i,j) = 7*ratio;
        end
    end
end
toc

