% Created by Steven JÃ¶ns - joens@iag.uni-stuttgart.de

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
   % Randbedingung bei z=H
   for i = 1:nX
       A(i,i) = 1;
   end
   
   % Eindimensionale Wärmeleitung
   for i = DOF(1,2):DOF(nX,nZ-1)
       A(i,i-nX) = 1/dXs^2;
       A(i,i) = -2/dXs^2;
       A(i,i+nX) = 1/dXs^2;
   end
   
   % Randbedingung bei z=W (konvektiver Wärmeübergang)
   for i = DOF(1,nZ):DOF(nX,nZ)
       A(i,i) = 3/(2*dXs) + Bi;
       A(i,i-nX) = -4/(2*dXs);
       A(i,i-2*nX) = 1/(2*dXs);
   end
   
   % Rechte Seite
   for i = 1:nX
       B(i) = Theta_BC(i);
   end

   
end

