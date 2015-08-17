function [ final_balance, mean_ret, vol_ret ] = Run_Strat( suite_next_bet )
    p = 18/37; %0.4865
    money = 16*3; %48
    %suite_next_bet = [2 3 6 12 24 48]; 
    %suite_next_bet = [2 4 8 16 32 64]; 
    idx_next_bet = 1;
    money_v = zeros(1); money_v(1) = money;
    next_bet = suite_next_bet(idx_next_bet);
    while(money > 0)
        win = binornd(1,p);
        if(win)
            money = money + next_bet;
            idx_next_bet = 1;
        else
            money = money - next_bet;
            idx_next_bet = idx_next_bet + 1;

            if(idx_next_bet > length(suite_next_bet))
                break; 
            end
        end
        last_bet = next_bet;
        next_bet = suite_next_bet(idx_next_bet);
        %fprintf('money=%i, last_bet=%i, next_bet=%i, status=%i\n', money, last_bet, next_bet, win);
        money_v(end+1) = money;
    end
    bar(money_v);
    final_balance = money_v(end);
    vol_ret = var(diff(money_v));
    mean_ret = mean(diff(money_v));
    %2+3+6+12+24
end

