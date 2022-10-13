%ans 2-1 ~ 2-3

clear;
fid = fopen('banana.dat');

% 파일의 헤더(설명) 부분은 따로 임시로 저장
i=0;
while i<7
    temp = fgetl(fid);
    i=i+1;
end

% 데이터를 콤마로 구분하여 세 열로 읽어들임
A=textscan(fid, '%s %s %s', 'Delimiter', ','); 

% textscan으로 읽은 셀 배열들을 각각 세 열로 나누어 저장
f1 = str2double(A{1,1});
f2 = str2double(A{1,2});
f3 = str2double(A{1,3});

%위에서 저장한 각 세열을 다시 하나로 합침
orig = [f1, f2, f3]; 


% 분류=1.0인 데이터 들의 특징 1값의 평균값을 구함
in21 = find(f3 == 1.0);
arr21 = f1(in21); %분류 1.0인 특징 1의 값의 배열
disp('평균보다 큰, 분류 1.0인 특징 1 값의 수: ')
disp(length(find(arr21>mean(arr21)))) 


% -3.09와 2.81사이의 균일 분포 난수를 5300개 만들고, 5300개의 데이터 각각에 대하여 특징 1값이 이 생성한 난수 값보다 큰 개수를 구함
x=5.9*rand(5300,1)-3.09; %x=(b-a)*rand +a
disp('생성한 난수보다 큰 특징 1 값의 수: ')
disp(length(find(f1>x))) 


% Line 32~35 의 과정을 10번 반복해서 plotting
k=1;
while k<=10
    %x=(b-a)*rand +a
    x=5.9*rand(5300,1)-3.09;
    y(k)=length(find(f1>x));
    plot(y,'-or');
    k=k+1; 
end
xlabel('반복횟수');
ylabel('3번 결과');
fclose(fid);