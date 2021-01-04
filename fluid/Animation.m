% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Animation(U,T)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global Xf          % Vektor aller X-Positionen Solid
    global Zf          % Vektor aller Z-Positionen Solid
    global nX          % Anzahl Gitterpunkt x-Richtung
    global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------

    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Vektor to Matrix
%

TTemp=reshape(T,[nX,nZ]);
UTemp=reshape(U,[nX,nZ]);

figure(1);
subplot(2,1,1);
surf(Xf,Zf,UTemp');
xlabel('X');
ylabel('Z');
zlabel('$U$','Interpreter','Latex');

subplot(2,1,2);
surf(Xf,Zf,TTemp');
xlabel('X');
ylabel('Z');
zlabel('$\Theta_f$','Interpreter','Latex');

getframe;
drawnow;

end
