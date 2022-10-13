a = uint8(ones(400,400));
a=a.*64;

for i=(1:400)
    for j=(1:400)
        if ((i-200).^2+(j-200).^2)<= 10000
            a(i,j) = 128;
        end
    end
end 
for i=(1:400)
    for j=(1:400)
        if ((i-200).^2+(j-200).^2)<= 2500
            a(i,j) = 192;
        end
    end
end

r= -16+ (32)*rand(400, 400);
r2= uint8(r);
res = imadd(a,r2);
imshow(res)
