clear all
clf
clc
%Max Z=x1+2x2-x3
%s/t  x1+2x2-x3<=4
%x1+x2-3x3>=5
%2x1+3x2+x3>=6
%x1,x2,x3>=0   if not in question convert manually and then input in matlab
%in this form only
A = [1 2 -1;1 1 -3;2 3 1];
b= [4;5;6];
C=[1 2 -1];
ineq_sign=[0 1 1];
s=eye(size(A,1));%SIZE(A,1) Tells the number of rows
index=find(ineq_sign>0);
s(index,:)=-s(index,:);

mat=[A s b];