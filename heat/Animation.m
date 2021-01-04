% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Animation(T)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global Xs          % Vektor aller X-Positionen Solid
      global Zs          % Vektor aller Z-Positionen Solid
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

Temp=reshape(T,[nX,nZ]);

figure(1);
surf(Xs,Zs,Temp');
xlabel('X');
ylabel('Z');
zlabel('$\Theta_s$','Interpreter','Latex');

%
getframe;
drawnow;

end
