% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Testcase

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global testcase    % Testcase (Anfangswertproblem)
      global nX          % Anzahl Gitterpunkt x-Richtung
    % out------------------------------------------------------------------
      global qf          % Randbedingung qf
      global Theta_BC    % Randbedingung Theta_BC
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Allocation 
Theta_BC=zeros(nX,1);
qf=zeros(nX,1);

switch testcase
   case 1
       Theta_BC = Theta_BC + 1;
       
       
   case 2
       Theta_BC = Theta_BC + 1;

end

end
