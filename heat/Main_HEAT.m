% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Main_HEAT(WH,LH)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------
      global simtime     % Total Simulation Time
      global measuretime % Measured Time
      global dXs         % Gitterschrittweite X-Richtung Solid
      global dZs         % Gitterschrittweite Z-Richtung Solid
      global Xs          % Vektor aller X-Positionen Solid
      global Zs          % Vektor aller Z-Positionen Solid
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Gitter
[Xs,Zs,dXs,dZs]=Grid(0,LH,1,WH);

% Testcase
Testcase;

% Initialisieren der Zeitmessung
simtime=0;
measuretime=0;
tic
Computertime();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hier muss etwas implementiert werden%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Visualisierung
Animation(T);


% Zeitmessung beenden
measuretime=toc;tic;Computertime();
end

