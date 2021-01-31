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
        A(DOF(1,j),DOF(1,j)) = 1;
        B(DOF(1,j)) = 1;
    end
    
    % Linker Rand,i=2
    for j = 2:nZ-1
        A(DOF(2,j),DOF(2,j-1)) = -1/dZf^2;
        A(DOF(2,j),DOF(2,j+1)) = -1/dZf^2;
        
        A(DOF(2,j),DOF(1,j)) = -4*Pe*U(DOF(2,j))/(2*dXf);
        A(DOF(2,j),DOF(2,j)) = 2/dZf^2 + 4*Pe*U(DOF(2,j))/(2*dXf);
    end
    
    % Unterer Rand,Z=0
    for i = 2:nX
        A(DOF(i,1),DOF(i,1)) = -3/(2*dZf);
        A(DOF(i,1),DOF(i,2)) = 4/(2*dZf);
        A(DOF(i,1),DOF(i,3)) = -1/(2*dZf);
    end
    
    % Oberer Rand,Z=H
    for i = 2:nX
        A(DOF(i,nZ),DOF(i,nZ)) = 3/(2*dZf);
        A(DOF(i,nZ),DOF(i,nZ-1)) = -4/(2*dZf);
        A(DOF(i,nZ),DOF(i,nZ-2)) = 1/(2*dZf);
        B(DOF(i,nZ)) = qf(i);
    end
    
%     for i = 2:nX-1
%         A(DOF(i,nZ),DOF(i+1,nZ)) = 1/dZf^2;
%         A(DOF(i,nZ),DOF(i,nZ)) = A(DOF(i,nZ),DOF(i,nZ)) - 2/dXf^2;
%         A(DOF(i,nZ),DOF(i-1,nZ)) = 1/dZf^2;
%     end
    
    % Rechter Rand
    for j = 2:nZ-1
        A(DOF(i,j),DOF(i,j-1)) = -1/dZf^2;
        A(DOF(i,j),DOF(i,j+1)) = -1/dZf^2;
        
        A(DOF(nX,j),DOF(nX,j)) = 2/dZf^2 + 3*Pe*U(DOF(nX,j))/(2*dXf);
        
        A(DOF(nX,j),DOF(nX-2,j)) = Pe*U(DOF(nX,j))/(2*dXf);
        A(DOF(nX,j),DOF(nX-1,j)) = -4*Pe*U(DOF(nX,j))/(2*dXf);
    end
    
    
    % Innerer Bereich
    for i = 3:nX-1
        for j = 2:nZ-1
            A(DOF(i,j),DOF(i,j-1)) = -1/dZf^2;
            A(DOF(i,j),DOF(i,j+1)) = -1/dZf^2;
            
            A(DOF(i,j),DOF(i,j)) = 2/dZf^2 + 2/dXf^2 + 3*Pe*U(DOF(i,j))/(2*dXf);
            
            A(DOF(i,j),DOF(i-2,j)) = Pe*U(DOF(i,j))/(2*dXf);
            A(DOF(i,j),DOF(i-1,j)) = -4*Pe*U(DOF(i,j))/(2*dXf) - 1/dXf^2;
            A(DOF(i,j),DOF(i+1,j)) = -1/dXf^2;
        end
    end
end

