% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function [U]=GaussSeidel(A,B,U,n)

% Globale Variablen--------------------------------------------------------

 % in-------------------------------------------------------------------
    global eps           % Abbruchkritieriumm für Iterationen
    global omega         % Relaxationsparamter für Gauss-Seidel Iteration
 % out------------------------------------------------------------------

 % inout----------------------------------------------------------------

%--------------------------------------------------------------------------
delta = 1;
iter=0;
fprintf('-------------------------------------------- \n');
fprintf('Starting Gauss-Seidel Iteration!    \n');

while delta>eps
   iter=iter+1; 

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %Hier muss etwas implementiert werden%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
fprintf('Gauss-Seidel Iteration done. Number of iterations:%i    \n',iter);


end
