% Created by Steven Jöns - joens@iag.uni-stuttgart.de

function Computertime()

% Globale Variablen--------------------------------------------------------

    % in-------------------------------------------------------------------

    global simtime               % Total Simulation Time
    global measuretime           % Measured Time
    % out------------------------------------------------------------------

    % inout----------------------------------------------------------------

%--------------------------------------------------------------------------

% Algorithmus

simtime=simtime+measuretime;

fprintf('-------------------------------------------- \n');
fprintf('Computation Time = %6.3f s\n',simtime);
end

