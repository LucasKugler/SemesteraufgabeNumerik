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
addpath fluid

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Globale Variablen
global testcase              % Testcase (Anfangswertproblem)
global nX                    % Anzahl Gitterpunkt x-Richtung
global nZ                    % Anzahl Gitterpunkt z-Richtung
global eps                   % Abbruchkritieriumm für Iterationen
global omega                 % Relaxationsparamter für Gauss-Seidel Iteration
global Pe                    % Peclet Zahl
global Kn                    % Knudsen Zahl
global beta_v                % Modellkoeffizient Geschwindigkeitsrandbedingung
% -------------------------------------------------------------------------

% Modellparameter :--------------------------------------------------------
Pe=5;                        % Peclet Zahl
Kn=0.05;                     % Knudsen Zahl
beta_v=1.5;                  % Modellkoeffizient Geschwindigkeitsrandbedingung   
% Numerische Parameter :--------------------------------------------------------
eps=1E-6;                    % Abbruchkriterium für Iterationen
omega=1.1;                   % Relaxationsparamter für Gauss-Seidel Iteration;
% Gitter:------------------------------------------------------------------
nX=15;                       % Anzahl Gitterpunkt x-Richtung
nZ=15;                       % Anzahl Gitterpunkt z-Richtung
LH=1.5;                      % Verhältniss L/H
% Anfangswertproblem:------------------------------------------------------
testcase=2;


% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Aufruf des FD Programms 

Main_Fluid(LH);

clear;
