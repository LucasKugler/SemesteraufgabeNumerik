% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Main_Fluid(LH)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
      global nX          % Anzahl Gitterpunkt x-Richtung
      global nZ          % Anzahl Gitterpunkt z-Richtung
    % out------------------------------------------------------------------
      global simtime     % Total Simulation Time
      global measuretime % Measured Time
      global dXf         % Gitterschrittweite X-Richtung Fluid
      global dZf         % Gitterschrittweite Z-Richtung Fluid
      global Xf          % Vektor aller X-Positionen Fluid
      global Zf          % Vektor aller Z-Positionen Fluid
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Gitter
[Xf,Zf,dXf,dZf]=Grid(0,LH,0,1);

% Testcase
Testcase;

% Initialisieren der Zeitmessung
simtime=0;
measuretime=0;
tic
Computertime();

n = nX*nZ
Au = zeros(n,n);
Bu = zeros(n,1);
At = zeros(n,n);
Bt = zeros(n,1);
T = zeros(n,1);
U = zeros(n,1);

[Au,Bu] = FillUFDMatrix(Au,Bu);
U = GaussSeidel(Au,Bu,U,n);

[At,Bt] = FillTFDMatrix(At,Bt,U);
T = GaussSeidel(At,Bt,T,n);

% Visualisierung
Animation(U,T);


% Zeitmessung beenden
measuretime=toc;tic;Computertime();
end

