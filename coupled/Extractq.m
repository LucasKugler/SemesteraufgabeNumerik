% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Extractq(T)

% Globale Variablen--------------------------------------------------------
    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global dZs         % Gitterschrittweite X-Richtung Solid
      global kk          % Verhältniss der Wärmeleitfähigkeiten zwischen Platte und Fluid
    % out------------------------------------------------------------------
      global qf          % Randbedingung Theta_BC
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------
    qf(1) = 0;
    for i = 2:nX
        qf(i) = kk*(-3*T(DOF(i,1)) + 4*T(DOF(i,2)) - T(DOF(i,3)))/(2*dZs);
    end

end

