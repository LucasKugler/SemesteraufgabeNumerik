% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function ExtractT(T)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
      global dZf         % Gitterschrittweite Z-Richtung Fluid
      global beta_T      % Modellkoeffizient Temperaturrandbedingung
      global Kn          % Knudsen Zahl
      global kk          % Verhältniss der Wärmeleitfähigkeiten zwischen Platte und Fluid
    % out------------------------------------------------------------------
      global Theta_BC    % Randbedingung Theta_BC
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

    for i = 1:nX
        Theta_BC(i) = T(DOF(i,nZ)) + ...
            beta_T*Kn*(3*T(DOF(i,nZ)) - 4*T(DOF(i,nZ-1)) + T(DOF(i,nZ-2)))/(2*dZf);
    end

end

