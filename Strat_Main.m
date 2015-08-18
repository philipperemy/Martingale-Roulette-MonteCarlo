clear;clc;
tic;
MC_Strat_Func( [2 3 6 12 24 48] ); toc;
% MC_Strat_Func( [1 2 3 6 12 24] );
% MC_Strat_Func( [4 8 16 32] );
% MC_Strat_Func( [1 2 4 8 16 32] );
% MC_Strat_Func( [1 1 2 3 5 24 48] );
% toc;
% Run_Strat( [2 3 6 12 24 48] );


tic;
N = 1000000;
final_balance_mc = zeros(1,N);
vol_mc           = zeros(1,N);
mean_mc          = zeros(1,N);
hits_count       = zeros(1,N);
for i = 1:N
    [final_balance_mc(i), mean_mc(i), vol_mc(i), hits_count(i)] = Martingale( [2 3 6 12 24 48], 60 );
end
toc;

%take profit
mean(final_balance_mc >= 60) % - 85.89%
mean(final_balance_mc <= 12) %  - 14.11% = balance < 48


tic;
N = 1000000;
final_balance_mc = zeros(1,N);
vol_mc           = zeros(1,N);
mean_mc          = zeros(1,N);
hits_count       = zeros(1,N);
for i = 1:N
    [final_balance_mc(i), mean_mc(i), vol_mc(i), hits_count(i)] = Martingale( [2 3 6 12 24 48], 60 );
end
toc;

%take profit
mean(final_balance_mc >= 60) % - 85.89%
mean(final_balance_mc <= 12) %  - 14.11% = balance < 48


