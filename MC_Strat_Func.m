function [ ] = MC_Strat_Func( bet_vector )

    N = 10000;
    %[2 4 8 16 32 64]
    %[2 3 6 12 24 48]
    %[0.5 1.5 3 6 12 24 48]
    init_bet = 50;
    for takeProfit = 53:5:100
        fprintf('________________\n');
        
        final_balance_mc = zeros(1,N);
        vol_mc           = zeros(1,N);
        mean_mc          = zeros(1,N);
        hits_count       = zeros(1,N);
        for i = 1:N
            [final_balance_mc(i), mean_mc(i), vol_mc(i), hits_count(i)] = Martingale( bet_vector, takeProfit, init_bet );
    %         if(rem(i,1000) == 0)
    %             fprintf('[DBG] i=%i\n', i);
    %         end
        end
        
        v = quantile(final_balance_mc, 0:0.01:1) - init_bet;
        val = sort(abs(v)); val = val(1);
        quant = find(abs(v) == val);

        fprintf('[%s]\n', sprintf('%2.f ', bet_vector));
        fprintf('mean of final balance = %f\n', mean(final_balance_mc));
        fprintf('median of final balance = %f\n', median(final_balance_mc));
        fprintf('mean returns = %f\n', mean(mean_mc));
        fprintf('std returns = %f\n', sqrt(mean(vol_mc)));
        fprintf('take profit = %i\n', takeProfit);
        fprintf('hits_count = %f\n', mean(hits_count));

        fprintf('quantile of initial bet = %f\n', quant(1));
    end

    %no TakeProfit
    %quantile 53 - [2 4 8 16 32 64] - mean 79.4 - median 44
    %quantile 45 - [2 3 6 12 24 48] - mean 81.7 - median 57
    %quantile 46 - [0.5 1.5 3 6 12 24 48] - mean 78.7 - median 56.5
    %quantile 55 - [1 2 4 8 16 32 64] - mean 76.7 - median 39.5
end

