clear
clc

global nX nZ dZf dXf beta_v Kn

nX = 4;
nZ = 6;

dXf = 1;
dZf = 1;

beta_v = 1
Kn = 1

A = zeros(nX*nZ,nX*nZ);
B = zeros(nX*nZ,1);

[A,B] = FillUFDMatrix(A,B)

A
B