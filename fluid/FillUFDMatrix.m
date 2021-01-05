% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function [A,B]=FillUFDMatrix(A,B) 

% Globale Variablen--------------------------------------------------------

 % in-------------------------------------------------------------------
   global nX       % Anzahl Gitterpunkt x-Richtung
   global nZ       % Anzahl Gitterpunkt z-Richtung
   global dZf      % Gitterschrittweite X-Richtung Fluid 
   global dXf      % Gitterschrittweite Z-Richtung Fluid
   global beta_v   % Modellkoeffizient Geschwindigkeitsrandbedingung
   global Kn       % Knudsen Zahl
 % out------------------------------------------------------------------
 
 % inout----------------------------------------------------------------
 
%--------------------------------------------------------------------------

for i = 1:nX
    A(DOF(i,1),DOF(i,1)) = -3/dZf^2;
    A(DOF(i,1),DOF(i,2)) = -3/dZf^2;
    A(DOF(i,1),DOF(i,3)) = -3/dZf^2;

end

