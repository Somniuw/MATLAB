%Otsu’method를 MATLAB 내장함수 graythresh를 이용하지 않고 구현
clear;
close all;
[x, map]= imread('son1.gif');
%흑백 영상으로 변환
b = ind2gray(x, map);
data = imhist(b);
tot = sum(data); 
sb = 0; wb = 0; M = 0.0;
sum1 = dot( (0:255), data); 
for i=1:256
    wb = wb + data(i);
    wf = tot - wb;
    if (wb == 0 || wf == 0) continue;
    end
    sb = sb +  (i-1) * data(i);
    mf = (sum1 - sb) / wf;
    sw = wb * wf * ((sb / wb) - mf) * ((sb / wb) - mf);
    if ( sw >= M )
        T = i;
        M = sw;
    end
end
%임계값 출력
T 
figure;
%이진화 영상 출력
imshow(uint8(b)<T) 


%각 픽셀에 7×7 크기의 mask를 씌운 후 이 mask의 평균값을 구함
c= b;
kernel = ones(7, 7) / 49; 
c1 = conv2(c, kernel, 'same'); 
res = c>c1;
figure;
%마스크를 이용한 이진화 영상 출력
imshow(res); 


%Local Adaptive Thresholding
im3 = b;

p1 = im3(1 : 100, :); 
p2 = im3(101 : 225, :); 
p3 = im3(226 : 275, :); 
p4 = im3(276 : 402, :);
p5 = im3(403: 510, :);
g1 = im2bw(p1, graythresh(p1)); 
g2 = im2bw(p2, graythresh(p2)); 
g3 = im2bw(p3, graythresh(p3)); 
g4 = im2bw(p4, graythresh(p4));
g5 = im2bw(p5, graythresh(p5));
figure;
imshow([g1; g2; g3; g4; g5]); 
