% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function [x,z,dx,dz]=Grid(x1,x2,z1,z2)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------

    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

   x = linspace(x1,x2,nX);
   dx = (x2-x1)/nX;
   
   z = linspace(z1,z2,nZ);
   dz = (z2-z1)/nZ;
   
end
