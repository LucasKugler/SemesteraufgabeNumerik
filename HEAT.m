% Finite-Differenzen-Verfahren für 
% Wärmeleitung in gekoppeltem Fluid-Feststoff-System
% 
% Code wurde erstellt von:
%
% Name:  Steven Jöns
% Email: joens@iag.uni-stuttgart.de
%
% IAG - Institut fuer Aerodynamik und Gasdynamik - Universitaet Stuttgart

clc
clear global
close all
addpath heat;

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Globale Variablen
global testcase              % Testcase (Anfangswertproblem)
global nX                    % Anzahl Gitterpunkt x-Richtung
global nZ                    % Anzahl Gitterpunkt z-Richtung
global eps                   % Abbruchkritieriumm für Iterationen
global omega                 % Relaxationsparamter für Gauss-Seidel Iteration
global Bi                    % Biot Zahl
% -------------------------------------------------------------------------

% Modellparameter :--------------------------------------------------------
Bi=2;                        % Biot Zahl

% Numerische Parameter :--------------------------------------------------------
eps=1E-6;                    % Abbruchkriterium für Iterationen
omega=1.5;                   % Relaxationsparamter für Gauss-Seidel Iteration;
% Gitter:------------------------------------------------------------------
nX=15;                       % Anzahl Gitterpunkt x-Richtung
nZ=15;                       % Anzahl Gitterpunkt z-Richtung
WH=1.4;                      % Verhältniss W/H
LH=1.5;                      % Verhältniss L/H

% Anfangswertproblem:------------------------------------------------------
testcase=1;


% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Aufruf des FD Programms 

Main_HEAT(WH,LH);

clear;
