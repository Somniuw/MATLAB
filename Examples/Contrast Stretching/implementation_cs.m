a = imread('landsat.jpg');
temp = rgb2gray(a);
b=im2double(temp);
c=(b-min(min(b)))/(max(max(b))-min(min(b)))*255;
min_c = min(min(c)) %최소 명암값
max_c = max(max(c)) %최대 명암값
imshow(uint8(c))
figure;
imhist(uint8(c))
