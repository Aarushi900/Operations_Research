clc
clf
%max z= 2X1 + 3X2= CZ

% -X1 + 3X2 <= 10
%  X1+ X2<= 6
%  X1- X2<=2
%  X1,X2>=0
%  AX=B

C=[2 3];
A= [-1 3;1 1 ;1 -1];
B=[10; 6; 2];
X1=0: 1: max(B);

X12 = (B(1) - A(1,1)*X1)./A(1,2); 
X22 = (B(2) - A(2,1)*X1)./A(2,2);
X32 = (B(3) - A(3,1)*X1)./A(3,2);

X12= max(0,X12);
X22= max(0,X22);
X32= max(0,X32);

plot(X1,X12,'r');
hold on;
grid on
plot(X1,X22,'b');
hold on;
plot(X1,X32,'g');
hold on;
xlabel('X-axis');
ylabel('Y-axis');

%plot(X1,X12,'r',X1,X22,'b',X1,X32,'g');

CX1= find(X1==0);
C1= find(X12==0);
line1= [X1(:,[CX1,C1]); X12(:,[CX1,C1])]';

C2=find(X22==0);
line2= [X1(:,[CX1,C2]); X22(:,[CX1,C2])]';

C3=find(X32==0);
line3= [X1(:,[CX1,C3]);X32(:,[CX1,C3])];
line3=transpose(line3);

pt=[];
% for i=1: size(A,1)
%     A1=A(i,1);
%     B1=B(i);
%     for j=1+i: size(A,1)
%         A2= B(j,:);
%         B2= B(j);
%         A4=[A1;A2];
%         B4= [B1;B2];
%         X=A4\B4;
%         %A4\B4= inverse(A4) * B4;
%         pt=[pt X];
% 
%     end
% end
for i= 1:size(A,1)
    for j= i+1 : size(A,1)
        A1=A([i,j],:);
        B1=B([i,j]);
        X=inv(A1)*B1;
        pt=[pt X];
    end
end

ptt=pt';
points=[line1; line2 ; line3; ptt];

for i=1:size(points,1)
    const1(i)= A(1,1)*points(i,1) + A(1,2)*points(i,2) - B(1);
    const2(i)= A(2,1)*points(i,1) + A(2,2)*points(i,2) - B(2);
    const3(i)= A(3,1)*points(i,1) + A(3,2)*points(i,2) - B(3);
    %constraints by putting values in equation
    S1= find(const1>0);
    S2= find(const2>0);
    S3= find(const3>0);
    S=[S1 S2 S3];
end

points(S,:)= [];
points;
[z index]= max(points*C');
ANS1=points(index,1);
ANS2=points(index,2);

%optimal 16 at (2,4)