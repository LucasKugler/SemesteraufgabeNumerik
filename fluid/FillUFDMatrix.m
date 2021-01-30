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
    
    % Kanaleintritt
    
    for i = 1:nX
        % Unterer Rand,X=0
        A(DOF(i,1),DOF(i,1)) = -3/(2*dZf);
        A(DOF(i,1),DOF(i,2)) = 4/(2*dZf);
        A(DOF(i,1),DOF(i,3)) = -1/(2*dZf);
        
        % Innerer Bereich
        for j = 2:nZ-1
            A(DOF(i,j),DOF(i,j-1)) = 1/dZf^2;
            A(DOF(i,j),DOF(i,j)) = -2/dZf^2;
            A(DOF(i,j),DOF(i,j+1)) = 1/dZf^2;
            B(DOF(i,j))=-1;
        end
        
        % Oberer Rand,X=H
        A(DOF(i,nZ),DOF(i,nZ)) = 3/(2*dZf)+1/(beta_v*Kn);
        A(DOF(i,nZ),DOF(i,nZ-1)) = -4/(2*dZf);
        A(DOF(i,nZ),DOF(i,nZ-2)) = 1/(2*dZf);
    end
    
    
    
    
end

