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
addpath heat
addpath coupled

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Globale Variablen
global testcase              % Testcase (Anfangswertproblem)
global nX                    % Anzahl Gitterpunkt x-Richtung
global nZ                    % Anzahl Gitterpunkt z-Richtung
global eps                   % Abbruchkritieriumm für Iterationen
global omega                 % Relaxationsparamter für Gauss-Seidel Iteration
global omega_c               % Relaxationsparamter für Kopplungsiteration
global itermax               % Maximale Anzahl an Kopplungsiterationen
global Pe                    % Peclet Zahl
global Kn                    % Knudsen Zahl
global Bi                    % Biot Zahl
global kk                    % Verhältniss der Wärmeleitfähigkeiten zwischen Platte und Fluid
global beta_v                % Modellkoeffizient Geschwindigkeitsrandbedingung
global beta_T                % Modellkoeffizient Temperaturrandbedingung
% -------------------------------------------------------------------------

% Modellparameter :--------------------------------------------------------
Pe=5;                        % Peclet Zahl
Kn=0.05;                     % Knudsen Zahl
Bi=2;                        % Biot Zahl
kk=4;                        % Verhältniss der Wärmeleitfähigkeiten zwischen Platte und Fluid
beta_v=1.5;                  % Modellkoeffizient Geschwindigkeitsrandbedingung
beta_T=2.33;                 % Modellkoeffizient Temperaturrandbedingung
% Numerische Parameter :--------------------------------------------------------
eps=1E-6;                    % Abbruchkriterium für Iterationen
omega=1.1;                   % Relaxationsparamter für Gauss-Seidel Iteration
omega_c=0.19;                % Relaxationsparamter für Kopplungsiteration
itermax=500;                 % Maximale Anzahl an Kopplungsiterationen
% Gitter:------------------------------------------------------------------
nX=15;                       % Anzahl Gitterpunkt x-Richtung
nZ=15;                       % Anzahl Gitterpunkt z-Richtung
WH=1.4;                      % Verhältniss W/H
LH=1.5;                      % Verhältniss L/H

% Anfangswertproblem:------------------------------------------------------
testcase=3;


% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Aufruf des FD Programms 

Main_Coupled(WH,LH);

clear;
