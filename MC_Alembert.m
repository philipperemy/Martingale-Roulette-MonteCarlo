function [ ] = MC_Alembert( )

    N = 1000;
    init_bet = 16*3;
    for takeProfit = 60:5:100
        for stopLoss = 20:5:40
            fprintf('________________\n');
        
            final_balance_mc = zeros(1,N);
            vol_mc           = zeros(1,N);
            mean_mc          = zeros(1,N);
            hits_count       = zeros(1,N);
            for i = 1:N
                [final_balance_mc(i), mean_mc(i), vol_mc(i), hits_count(i)] = Alembert( takeProfit, stopLoss );
            end

            v = quantile(final_balance_mc, 0:0.01:1) - init_bet;
            val = sort(abs(v)); val = val(1);
            quant = find(abs(v) == val);

            fprintf('mean of final balance = %f\n', mean(final_balance_mc));
            fprintf('median of final balance = %f\n', median(final_balance_mc));
            fprintf('mean returns = %f\n', mean(mean_mc));
            fprintf('std returns = %f\n', mean(vol_mc));
            fprintf('take profit = %i\n', takeProfit);
            fprintf('stop loss = %i\n', stopLoss);
            fprintf('hits_count = %f\n', mean(hits_count));

            fprintf('quantile of initial bet = %f\n', quant(1));
        end
    end

end

