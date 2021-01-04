% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Main_coupled(WH,LH)

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------
       global nX                % Anzahl Gitterpunkt x-Richtung
       global nZ                % Anzahl Gitterpunkt z-Richtung
       global eps               % Abbruchkritieriumm für Iterationen
       global omega_c           % Relaxationsparamter für Kopplungsiteration
       global itermax           % Maximale Anzahl an Kopplungsiterationen
    % out------------------------------------------------------------------
       global measuretime       % Computation Time
       global simtime           % Simulation Time
       global dXf               % Gitterschrittweite X-Richtung Fluid
       global dZf               % Gitterschrittweite Z-Richtung Fluid
       global dZs               % Gitterschrittweite X-Richtung Solid
       global dXs               % Gitterschrittweite Z-Richtung Solid
       global Xf                % Vektor aller X-Positionen Fluid
       global Zf                % Vektor aller Z-Positionen Fluid
       global Xs                % Vektor aller X-Positionen Solid
       global Zs                % Vektor aller Z-Positionen Solid
       global qf                % Randbedingung qf
    % inout----------------------------------------------------------------
%--------------------------------------------------------------------------

% Gitter
[Xf,Zf,dXf,dZf]=Grid(0,LH,0,1);
[Xs,Zs,dXs,dZs]=Grid(0,LH,1,WH);

% Testcase
Testcase;

% Initialisieren der Zeitmessung
simtime=0;
measuretime=0;
tic
Computertime();

% Initialize all Vectors
A =zeros(nX*nZ);
B =zeros(nX*nZ,1);
U =zeros(nX*nZ,1);
TF=zeros(nX*nZ,1);
TS=zeros(nX*nZ,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hier muss etwas implementiert werden%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Outer Iteration iteration 
dq=1;
iter=0;
qf(:)=0;

while (dq>eps)&&(iter<itermax)
  qf_old=qf;  
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %Hier muss etwas implementiert werden%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  Animation_coupled(TF,TS);
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %Hier muss etwas implementiert werden%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  Animation_coupled(TF,TS);
end
fprintf('-------------------------------------------- \n');
fprintf('Outer Iteration done. Number of iterations:%i  Final Residual:%.4e    \n',iter,dq);

% Visualisierung
Analysis(TS,TF);

% Zeitmessung beenden
measuretime=toc;tic;Computertime();
end
