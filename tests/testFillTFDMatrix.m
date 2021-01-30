clear
clc

global nX nZ dZf dXf qf Pe

nX = 5;
nZ = 5;
n = nX*nZ

dXf = 1;
dZf = 1;

qf = zeros(nX,1)
Pe = 1

A = zeros(n,n);
B = zeros(n,1);
U = ones(n,1);

[A,B] = FillTFDMatrix(A,B,U)