% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function [A,B]=FillFDMatrix(A,B) 

% Globale Variablen--------------------------------------------------------

 % in-------------------------------------------------------------------
   global nX       % Anzahl Gitterpunkt x-Richtung
   global nZ       % Anzahl Gitterpunkt z-Richtung
   global dZs      % Gitterschrittweite X-Richtung Solid
   global dXs      % Gitterschrittweite Z-Richtung Solid
   global Theta_BC % Randbedingung Theta_BC
   global Bi       % Biot Zahl
 % out------------------------------------------------------------------
 
 % inout----------------------------------------------------------------
 
%--------------------------------------------------------------------------
     
   for i = 1:nX
       A(i,i) = 1;
   end
   
   for i = (nX+1):((nX-1)*nZ)
       A(i,i-nX) = 1/dXs^2;
       A(i,i) = -2/dXs^2;
       A(i,i+nX) = 1/dXs^2;
   end
   
   for i = ((nX-1)*nZ+1):(nX*nZ)
       A(i,i) = 3/(2*dXs) + Bi;
       A(i,i-nX) = -4/(2*dXs);
       A(i,i-2*nX) = 1/(2*dXs);
   end
   
   for i = 1:nX
       B(i) = Theta_BC;
   end
   
end

