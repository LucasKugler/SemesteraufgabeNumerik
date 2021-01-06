% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function [A,B]=FillTFDMatrix(A,B,U) 

% Globale Variablen--------------------------------------------------------

 % in-------------------------------------------------------------------
   global nX             % Anzahl Gitterpunkt x-Richtung
   global nZ             % Anzahl Gitterpunkt z-Richtung
   global dZf            % Gitterschrittweite X-Richtung Fluid 
   global dXf            % Gitterschrittweite Z-Richtung Fluid
   global qf             % Randbedingung qf
   global Pe             % Peclet Zahl
 % out------------------------------------------------------------------
 
 % inout----------------------------------------------------------------
 
%--------------------------------------------------------------------------
    % Linker Rand, X=0
    for j = 1:nZ
        A(DOF(1,j),DOF(2,j)) = 4/(2*dZf);
        A(DOF(1,j),DOF(3,j)) = -1/(2*dZf);
        B(j) = 3/(2*dZf);        
    
    for i = 2:nX    
        % Unterer Rand,Z=0
        A(DOF(i,1),DOF(i,1)) = -3/(2*dZf);
        A(DOF(i,1),DOF(i,2)) = 4/(2*dZf);
        A(DOF(i,1),DOF(i,3)) = -1/(2*dZf);
        
        % Innerer Bereich
        for j = 2:nZ-1
            A(DOF(i,j),DOF(i,j-1)) = -1/dZf^2;
            A(DOF(i,j),DOF(i,j)) = 2/dZf^2;
            A(DOF(i,j),DOF(i,j+1)) = -1/dZf^2;
            A(DOF(i,j),DOF(i-1,j)) = -Pe*U(DOF(i,j))/(2*dXf);
            A(DOF(i,j),DOF(i+1,j)) = Pe*U(DOF(i,j))/(2*dXf);
        end
        
        % Oberer Rand,Z=H
        A(DOF(i,nZ),DOF(i,nZ)) = 3/(2*dZf);
        A(DOF(i,nZ),DOF(i,nZ-1)) = -4/(2*dZf);
        A(DOF(i,nZ),DOF(i,nZ-2)) = 1/(2*dZf);
        B(DOF(i,nZ)) = qf;
    end


end

