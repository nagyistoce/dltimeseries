switch db    
    case 'cats'
        % BLOCK 1
        e1f1 = 0;
        seriesBlock1 = series(1:980);
        targets1 = [121.2200   99.2770   97.9570  115.0300  122.2300  107.2800  119.0000 121.2500  114.9600  105.9900  116.6300  126.9600  123.8800  123.4000 117.9300  133.0100  134.9700  159.6800  140.4900  144.6300];
        for i=1:20   
%             d = seriesBlock1(980-n+i:980+i-1)';    
%             hiddenLayer = zeros(m, 1);   
%             for j=1:m        
%                 value = (beta(:, j)' * d') + bias(j, 1);  
%                 hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
%             end   
%             value = hiddenLayer' * alfa;
%             output = 1 / (1 + exp(-1 * value));    
%             seriesBlock1(980 + i) = output;    
%             output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
%             e1f1 = e1f1 + (targets1(i) - output)^2;    
            d = seriesBlock1(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa + biasOut;
            output = value;   
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
        targets2 = [396.9400  390.3500  386.3100  358.3300  350.9900  350.8500  370.8500   352.4100  352.7500  362.6400  358.7500  359.1300  353.3300  346.0100  334.6000  333.1100  353.8800  328.2400  332.4000  328.0000];
        for i=1:20   
            d = seriesBlock2(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa + biasOut;
            output = value;    
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
        targets3 = [72.0960   55.5050   57.0040   59.7860   27.7720   20.9020   12.3610   26.6230   16.5690   14.8950   15.6900    8.0902   30.5740   48.0970   50.2670   21.9800   16.4820   27.6060   26.7360   27.8690];
        for i=1:20   
            d = seriesBlock3(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa + biasOut;
            output = value;    
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
        targets4 = [276.0000  289.7400  284.2900  297.4700  315.2300  328.7400  292.8600   286.0300  287.5300  293.5600  286.5800  273.8600  280.8100  292.4100   296.0700  296.5300  283.2000  301.2800  311.8400  311.1100];
        for i=1:20   
            d = seriesBlock4(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa + biasOut;
            output = value;    
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
        targets5 = [-85.1540 -109.0400  -97.9920  -75.4660  -65.3600  -83.2710  -82.3820  -63.1080  -52.8950  -58.9650  -36.2460  -41.5260  -43.9040  -39.6870 -12.5570  -18.7440   -7.9770   10.5570   35.9520         0];
        for i=1:20   
            d = seriesBlock5(980-n+i:980+i-1)';    
            hiddenLayer = zeros(m, 1);   
            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end   
            value = hiddenLayer' * alfa + biasOut;
            output = value;   
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
        
        
    case {'acidentes', 'bjd', 'scr', 'tri', 'elec'}
        fid = fopen(strcat(db,'.tst.dat'));
        seriesRaw = fscanf(fid, '%f');

        % [0, 1]
        series = (seriesRaw - min(seriesRaw)) / (max(seriesRaw) - min(seriesRaw));        

        data = zeros(size(series, 1) - n, n);
        normalizedTargets = zeros(size(series, 1) - n, 1);
        targets = zeros(size(series, 1) - n, 1);
        outputs = zeros(size(series, 1) - n, 1);

        for i=1:size(data, 1)
            data(i, :) = series(i:i+n-1);  
            normalizedTargets(i) = series(i+n);
            targets(i) = seriesRaw(i+n);
        end
        
        mae = 0;
        mse = 0;
        mape = 0;
        
        for k=1:size(data, 1)            
    
            d = data(k, :);    
            target = targets(k, 1);
            normalizedTarget = normalizedTargets(k, 1);
            hiddenLayer = zeros(m, 1);

            for j=1:m        
                value = (beta(:, j)' * d') + biasHid(j, 1);  
                hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
            end

            %value = hiddenLayer' * alfa;
            %output = 1 / (1 + exp(-1 * value));   
            
            output = hiddenLayer' * alfa + biasOut;                        
            
            %mae = mae + abs(output - normalizedTarget);
            %mse = mse + (output - normalizedTarget)^2;
            
            output = ((max(seriesRaw) - min(seriesRaw)) * output) + min(seriesRaw);
            outputs(k, 1) = output;
           
            mape = mape + abs((output - target) / target);
            mse = mse + (output - target)^2;
   
        end
        
        mae = mae / size(data, 1);
        mse = mse / size(data, 1);
        mape = mape / size(data, 1);
        
        disp('-------------------------------------------');
        %fprintf('MAE: %f\n', mae);      
        fprintf('MSE: %f\n', mse);  
        fprintf('MAPE: %f\n', mape);
        
        
end

