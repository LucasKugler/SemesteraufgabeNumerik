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

   % Unterer Rand bei z=H
   for i = 1:nX
       A(DOF(i,1),DOF(i,1)) = 1;
       B(DOF(i,1)) = Theta_BC(i);
   end
   
   % Oberer Rand bei z=W (konvektiver Wärmeübergang)
   for i = 1:nX
       A(DOF(i,nZ),DOF(i,nZ)) = 3/(2*dZs) + Bi;
       A(DOF(i,nZ),DOF(i,nZ-1)) = -4/(2*dZs);
       A(DOF(i,nZ),DOF(i,nZ-2)) = 1/(2*dZs);
   end
   
   % Linker Rand
   for j = 2:nZ-1
       A(DOF(1,j),DOF(1,j-1)) = 1/dZs^2;
       A(DOF(1,j),DOF(1,j)) = -2/dZs^2;
       A(DOF(1,j),DOF(1,j+1)) = 1/dZs^2;
   end
   
   % Rechter Rand
   for j = 2:nZ-1
       A(DOF(nX,j),DOF(nX,j-1)) = 1/dZs^2;
       A(DOF(nX,j),DOF(nX,j)) = -2/dZs^2;
       A(DOF(nX,j),DOF(nX,j+1)) = 1/dZs^2;
   end
   
   % Innere Bereich
   for i = 2:nX-1
       for j = 2:nZ-1
           A(DOF(i,j),DOF(i,j-1)) = 1/dZs^2;
           A(DOF(i,j),DOF(i,j+1)) = 1/dZs^2;
           
           A(DOF(i,j),DOF(i,j)) = -2/dZs^2 - 2/dXs^2;     % 2D
           
           A(DOF(i,j),DOF(i-1,j)) = 1/dXs^2;
           A(DOF(i,j),DOF(i+1,j)) = 1/dXs^2;
       end
   end

   
end


%    % Randbedingung bei z=H
%    for i = 1:nX
%        A(i,i) = 1;
%    end
%    
%    % Eindimensionale Wärmeleitung
%    for i = DOF(1,2):DOF(nX,nZ-1)
%        A(i,i-nX) = 1/dXs^2;
%        A(i,i) = -2/dXs^2;
%        A(i,i+nX) = 1/dXs^2;
%    end
%    
%    % Randbedingung bei z=W (konvektiver Wärmeübergang)
%    for i = DOF(1,nZ):DOF(nX,nZ)
%        A(i,i) = 3/(2*dXs) + Bi;
%        A(i,i-nX) = -4/(2*dXs);
%        A(i,i-2*nX) = 1/(2*dXs);
%    end
