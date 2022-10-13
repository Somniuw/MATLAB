clear;
fid = fopen('banana.dat');

%파일의 헤더(설명) 부분은 따로 임시로 저장한다.
i=0;
while i<7
    temp = fgetl(fid);
    i=i+1;
end

% 데이터를 콤마로 구분하여 세 열로 읽어들인다.
A=textscan(fid, '%s %s %s', 'Delimiter', ','); 

%textscan으로 읽은 셀 배열들을 각각 세 열로 나누어 저장
f1 = str2double(A{1,1});
f2 = str2double(A{1,2});
f3 = str2double(A{1,3});

%위에서 저장한 각 세열을 다시 하나로 합친다.
orig = [f1, f2, f3]; 


%특징 1, 2의 값이 [-0.5, 0.5]인 바나나 데이터들 선별
in24 = find((-0.5<=orig(:,1) & orig(:,1)<=0.5) & (-0.5<=orig(:,2) & orig(:,2)<=0.5));

%선별한 데이터들의 인덱스만을 모아 o24라는 행렬로 재구성.
o24 = orig(in24,:);
p=1;
while p<length(o24(:,1))
   if(o24(p,3)==1.0) 
       %분류가 1인 값들은 빨간색 's' 마커로 plot
      plot(o24(p,1),o24(p,2),'sr');
      hold on;
   end
   if(o24(p,3)==-1.0) 
       %분류가 -1인 값들은 파란색 'o' 마커로 plot
      plot(o24(p,1),o24(p,2),'ob');
      hold on;
   end
   p=p+1; 
end
xlabel('속성 1');
ylabel('속성 2');
fclose(fid);
