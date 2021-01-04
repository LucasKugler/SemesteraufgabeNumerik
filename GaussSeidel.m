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

uTilde = zeros(n,1);

while delta>eps
   iter=iter+1; 
   uTilde = zeros(n,1);

   for i = 1:n
       
       for j = 1:n
           if j < i
               uTilde(i) = uTilde(i) + A(i,j)*uTilde(j);
           elseif j > i
               uTilde(i) = uTilde(i) + A(i,j)*U(j);
           end
       end
    %    for j = 1:(i-1)
    %         uTilde(i) = uTilde(i) + A(i,j)*uTilde(j);
    %    end

    %    for j = (i+1):n
    %         uTilde(i) = uTilde(i) + A(i,j)*U(j);
    %    end

       uTilde(i) = - (uTilde(i) - B(i)) / A(i,i);
   end
   
   U = (1 - omega)*U + omega*uTilde;
   
   R = B - A*U;
   delta = norm(R);
   
end
fprintf('Gauss-Seidel Iteration done. Number of iterations:%i    \n',iter);


end
