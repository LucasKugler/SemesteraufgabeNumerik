clear
clc

global nX nZ dZs dXs Theta_BC Bi

nX = 4;
nZ = 6;

dXs = 1;
dZs = 1;

Theta_BC = 5*ones(nX*nZ,1)
Bi = 2

A = zeros(nX*nZ,nX*nZ);
B = zeros(nX*nZ,1);

[A,B] = FillFDMatrix(A,B)

A
B