clc

global eps omega

eps = 0.01;
omega = 0.8;

A = [1,1,1;0,1,1;1,0,1]
U = [4;4;4]
B = [6;5;4]

U = GaussSeidel(A,B,U,length(U))