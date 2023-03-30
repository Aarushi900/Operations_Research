% m=no. of constraints
% n= no of variables
% no of solution nCm=n!/(m!(n-m)!)
% no of non basic variables=n-m
% 
% Max Z =2X1+3X2+4X3+7X4
% S.T.
% 2X1+3X2-X3+4X4=8
% X1-2X2+6X3-7X4=3
% Xi>=0

clc
clf
clear all
A = [2 3 -1 4;1 -2 6 -7];
B = [8;3];
C = [2 3 4 7];
m = size(A,1);%size of rows
n = size(A,2);%size of columns
%check whether n>m
if n>m
    nCm=nchoosek(n,m);%no of solutions using n choose k
    p=nchoosek(1:n,m);%making pairs of n with m
    sol=[];
    for i=1:nCm
        y=zeros(n,1);
        A1=A(:,p(i,:));%p(1,:)=(1,2)
        %A(:,(1,2))=full columns 1,2 of matrix A
        x= inv(A1)*B;%x=A1\B
        if all(x>=0 & x~=inf & x~=-inf)%x!=infinity&x!=-infinity
            y(p(i,:))=x;
            sol=[sol y];
        end
    end
else
    error('no. of constraints is greater than no of variables!');
end
%got the solutions now want optimal solutions
Z = C * sol;
[obj, index]=max(Z);
BFS= sol(:,index);%getting values of variables from sol matrix
optval=[BFS',obj];%array for variable values and function value
%creating a table for variable values and its value of function
b=array2table(optval,'VariableNames',{'X1','X2','X3','X4','Z'});





