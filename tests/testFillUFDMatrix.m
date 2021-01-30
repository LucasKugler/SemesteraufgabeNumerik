clear
close all
clc

global nX nZ dZf dXf beta_v Kn LH

dZf = 0.0714;
nX = 15;
nZ = 15;
n = nX*nZ;

beta_v = 1.5
Kn = 0.05

A = zeros(n,n);
B = zeros(n,1);
U = zeros(n,1);

[A,B] = FillUFDMatrix(A,B);

U = GaussSeidel(A,B,U,n)