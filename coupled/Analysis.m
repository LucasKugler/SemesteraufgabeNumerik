% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Analysis(Ts,Tf)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
      global Zf          % Vektor aller Z-Positionen Fluid
      global Zs          % Vektor aller Z-Positionen Solid
    % out------------------------------------------------------------------
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

figure(2)
T=zeros(2*nZ,1);
TTemp(:,:)=reshape(Tf,[nX,nZ]);
T(1:nZ)=TTemp(end,:);
TTemp(:,:)=reshape(Ts,[nX,nZ]);
T(nZ+1:end)=TTemp(end,:);


plot([Zf;Zs],T);
xlabel('Z');
ylabel('$\Theta$','Interpreter','Latex');

end

