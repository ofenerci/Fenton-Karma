%       ***************************************************
%       *  Copyright (C) 2017, Hiroshi Ashikaga, MD, PhD  *
%       *  hashika1@jhmi.edu                              *
%       *  Cardiac Arrhythmia Service                     *
%       *  Johns Hopkins University School of Medicine    *
%       *  Baltimore, Maryland, USA                       *
%       *  5/24/2017                                      *
%       ***************************************************

%% 2-D demo script for Fenton-Karma model

clear all
close all

% % % Generate spiral waves

time_units = 10000;                         % 10,000units = 10,000 x 1ms/unit = 10,000ms = 10sec
ts = fk2d(time_units);                      % Generate spiral wave breakup
save orig.mat ts -v7.3;                     % Save time series of excitation variable 
make_movie(ts,'orig_movie.avi',[0 1]);      % Save avi movie file

% % % Convert to phase map

p = phase_map(ts);                          % Phase range [-pi pi]
save phase.mat p -v7.3;                     % Save time series of phase
make_movie(p,'phase_movie.avi',[-pi pi]);   % Save avi movie file

% % % Identify phase singularities

ps = phase_singularity(p);                  % +1 (counterclockwise) and -1 (clockwise) spiral wave
save singularity.mat ps -v7.3;              % Save time series of phase singularity 
make_movie(ps,'singularity_movie.avi',[-1 1]);   % Save avi movie file
