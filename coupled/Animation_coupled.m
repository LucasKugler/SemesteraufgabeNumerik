% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Animation_Coupled(Tf,Ts)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global Xs          % Vektor aller X-Positionen Solid
      global Zs          % Vektor aller Z-Positionen Solid
      global Xf          % Vektor aller X-Positionen Fluid
      global Zf          % Vektor aller Z-Positionen Fluid
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Vektor to Matrix
%
TTemp=zeros(nX,2*nZ);
TTemp(:,1:nZ)=reshape(Tf,[nX,nZ]);
TTemp(:,nZ+1:end)=reshape(Ts,[nX,nZ]);

Z=[Zf ; Zs];
figure(1);
surf(Xf,Z,TTemp');
xlabel('x');
ylabel('y');
zlabel('$\Theta$','Interpreter','Latex');

getframe;
drawnow;

end
