switch db    
    case 'cats'
        % BLOCK 1
        e1f1 = 0;
        seriesBlock1 = series(1:980);
        targets1 = [102.52 96.56 99.201 106.52 111.91 113.65 114.12 115.55 117.95 120.3 121.99 123.15 124.18 125.4 126.84 127.79 127 124.46 124.39 134.06];
        for i=1:20   
            d = seriesBlock1(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + bias(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa;
            output = 1 / (1 + exp(-1 * value));    
            seriesBlock1(980 + i) = output;    
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
            e1f1 = e1f1 + (targets1(i) - output)^2;    
        end
        e2f1 = e1f1;
        e1f1 = e1f1 / 100;
        e2f1 = e2f1 / 80;

        % BLOCK 2
        e1f2 = 0;
        seriesBlock2 = series(981:1960);
        targets2 = [393.52  389.05   385.25   381.48   377.66   373.83   370.01   366.21   362.46   358.76 355.14   351.61   348.19   344.9   341.74   338.73   335.89   333.22   330.8   328.23];
        for i=1:20   
            d = seriesBlock2(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + bias(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa;
            output = 1 / (1 + exp(-1 * value));    
            seriesBlock2(980 + i) = output;    
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
            e1f2 = e1f2 + (targets2(i) - output)^2;    
        end
        e2f2 = e1f2;
        e1f2 = e1f2 / 100;
        e2f2 = e2f2 / 80;

        % BLOCK 3
        e1f3 = 0;
        seriesBlock3 = series(1961:2940);
        targets3 = [88.844   82.066   78.695  74.193   70.231   66.215   62.346   58.556   54.864   51.258 47.733   44.273   40.858   37.452   34.001   30.422   26.588   22.31   17.28   11.187];
        for i=1:20   
            d = seriesBlock3(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + bias(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa;
            output = 1 / (1 + exp(-1 * value));    
            seriesBlock3(980 + i) = output;    
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
            e1f3 = e1f3 + (targets3(i) - output)^2;    
        end
        e2f3 = e1f3;
        e1f3 = e1f3 / 100;
        e2f3 = e2f3 / 80;

        % BLOCK 4
        e1f4 = 0;
        seriesBlock4 = series(2941:3920);
        targets4 = [264.84   266.03   268.61   271.98   275.34  278.32   280.87   283.1   285.06   286.81 288.35   289.7   290.88   291.87   292.67   293.27   293.63   293.71   293.43   292.84];
        for i=1:20   
            d = seriesBlock4(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + bias(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa;
            output = 1 / (1 + exp(-1 * value));    
            seriesBlock4(980 + i) = output;    
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw); 
            e1f4 = e1f4 + (targets4(i) - output)^2;    
        end
        e2f4 = e1f4;
        e1f4 = e1f4 / 100;
        e2f4 = e2f4 / 80;

        % BLOCK 5
        e1f5 = 0;
        seriesBlock5 = series(3921:4900);
        targets5 = [-66.378   -61.436   -57.044   -55.044   -53.565   -51.348  -48.714   -46.228   -43.944   -41.666 -39.313   -36.937   -34.58  -32.239   -29.894   -27.544   -25.192   -22.842   -20.494   -18.145];
        for i=1:20   
            d = seriesBlock5(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + bias(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa;
            output = 1 / (1 + exp(-1 * value));    
            seriesBlock5(980 + i) = output;    
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw); 
            e1f5 = e1f5 + (targets5(i) - output)^2;
        end
        e1f5 = e1f5 / 100;

        e1 = e1f1 + e1f2 + e1f3 + e1f4 + e1f5;
        e2 = e2f1 + e2f2 + e2f3 + e2f4;

        disp('-------------------------------------------');
        fprintf('E1: %f\n', e1);
        fprintf('E2: %f\n', e2);

        seriesForecasting = [seriesBlock1; seriesBlock2; seriesBlock3; seriesBlock4; seriesBlock5];
        seriesForecasting = ((maxValue - minValue) * seriesForecasting) + maxValue + minValue; 

        series = ((maxValue - minValue) * series) + maxValue + minValue;
        completeSeriesRaw = [series(1:980); targets1'; series(981:1960); targets2'; series(1961:2940); targets3'; series(2941:3920); targets4'; series(3921:4900); targets5'];

        x = completeSeriesRaw;
        y = seriesForecasting;
        
        
    case {'acidentes', 'bjd', 'scr', 'tri'}
        fid = fopen(strcat(db,'.tst.dat'));
        seriesRaw = fscanf(fid, '%f');

        % [-1, 1]
        %series = 2*(seriesRaw - min(seriesRaw))/(max(seriesRaw) - min(seriesRaw)) - 1;
        
        % [0, 1]
        series = (seriesRaw - min(seriesRaw)) / (max(seriesRaw) - min(seriesRaw));

        data = zeros(size(series, 1) - n, n);
        targets = zeros(size(series, 1) - n, 1);

        for i=1:size(data, 1)
            data(i, :) = series(i:i+n-1);    
            targets(i) = seriesRaw(i+n);
        end
        
        mae = 0;
        
        for k=1:size(data, 1)            
    
            d = data(k, :);    
            target = targets(k, 1);
            hiddenLayer = zeros(m, 1);

            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end

            %value = hiddenLayer' * alfa;
            %output = 1 / (1 + exp(-1 * value));   
            
            output = hiddenLayer' * alfa + biasOut;
            
            
            
            
            %output = (output/2+0.5) * (max(seriesRaw)-min(seriesRaw)) + min(seriesRaw);   
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
           
            
            mae = mae + abs(output - target);
            mse = mse + (output - target)^2;
   
        end
        
        mae = mae / size(data, 1);
        mse = mse / size(data, 1);
        
        disp('-------------------------------------------');
        fprintf('MAE: %f\n', mae);      
        fprintf('MSE: %f\n', mse);   
        
end

