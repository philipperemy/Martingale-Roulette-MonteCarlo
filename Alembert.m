function [ final_balance, mean_returns, vol_returns, hits_count ] = Alembert( takeProfit, stopLoss )
    
    if(takeProfit == 0)
       takeProfit = Inf; 
    end

    p = 18/37; %0.4865
    money = 16*3; %48
    %suite_next_bet = [2 3 6 12 24 48]; 
    %suite_next_bet = [2 4 8 16 32 64]; 
    money_process = zeros(1); money_process(1) = money;
    next_bet = 1;
    hits_count = 0;
    while(money > 0 && money < takeProfit && money > stopLoss)
        win = binornd(1,p);
        if(win)
            money = money + next_bet;
            if(next_bet > 1)
                next_bet = next_bet - 1;
            end
            
        else
            money = money - next_bet;
            next_bet = next_bet + 1;
        end
        %fprintf('money=%i, next_bet=%i, status=%i\n', money, next_bet, win);
        money_process(end+1) = money;
        hits_count = hits_count + 1;
    end
    %bar(money_process);
    final_balance       = money_process(end);
    returns             = diff(money_process);
    vol_returns         = std(returns);
    mean_returns        = mean(returns);
end

