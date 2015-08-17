clear;clc;
tic;
MC_Strat_Func( [2 3 6 12 24 48] );
MC_Strat_Func( [1 2 3 6 12 24 48] );
MC_Strat_Func( [4 8 16 32] );
MC_Strat_Func( [1 2 4 8 16 32] );
MC_Strat_Func( [1 1 2 3 5 24 48] );
toc;

Run_Strat( [2 3 6 12 24 48] );