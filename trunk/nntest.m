e1 = 0;
e2 = 0;

% BLOCK 1
seriesBlock = series(1:980);
targets = [102.52 96.56 99.201 106.52 111.91 113.65 114.12 115.55 117.95 120.3 121.99 123.15 124.18 125.4 126.84 127.79 127 124.46 124.39 134.06];
for i=1:20   
    d = seriesBlock(980-n+i:980+i-1)';    
    hiddenLayer = zeros(m, 1);   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));    
    seriesBlock(980 + i) = output;    
    output = ((maxValue - minValue) * output) + maxValue + minValue;    
    e1 = e1 + (targets(i) - output)^2;
    e2 = e1;
end
e1 = e1 / 100;
e2 = e2 / 80;

% BLOCK 2
seriesBlock = series(981:1960);
targets = [393. 52  389.05   385.25   381.48   377.66   373.83   370.01   366.21   362.46   358.76 355.14   351.61   348.19   344.9   341.74   338.73   335.89   333.22   330.8   328.23];
for i=1:20   
    d = seriesBlock(980-n+i:980+i-1)';    
    hiddenLayer = zeros(m, 1);   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));    
    seriesBlock(980 + i) = output;    
    output = ((maxValue - minValue) * output) + maxValue + minValue;    
    e1 = e1 + (targets(i) - output)^2;
    e2 = e1;
end
e1 = e1 / 100;
e2 = e2 / 80;

% BLOCK 3
seriesBlock = series(1961:2940);
targets = [88.844   82.066   78.6 95  74.193   70.231   66.215   62.346   58.556   54.864   51.258 47.733   44.273   40.858   37.452   34.001   30.422   26.588   22.31   17.28   11.187];
for i=1:20   
    d = seriesBlock(980-n+i:980+i-1)';    
    hiddenLayer = zeros(m, 1);   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));    
    seriesBlock(980 + i) = output;    
    output = ((maxValue - minValue) * output) + maxValue + minValue;    
    e1 = e1 + (targets(i) - output)^2;
    e2 = e1;
end
e1 = e1 / 100;
e2 = e2 / 80;

% BLOCK 4
seriesBlock = series(2941:3920);
targets = [264.84   266.03   268.61   271.98   275. 34  278.32   280.87   283.1   285.06   286.81 288.35   289.7   290.88   291.87   292.67   293.27   293.63   293.71   293.43   292.84];
for i=1:20   
    d = seriesBlock(980-n+i:980+i-1)';    
    hiddenLayer = zeros(m, 1);   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));    
    seriesBlock(980 + i) = output;    
    output = ((maxValue - minValue) * output) + maxValue + minValue;    
    e1 = e1 + (targets(i) - output)^2;
    e2 = e1;
end
e1 = e1 / 100;
e2 = e2 / 80;

% BLOCK 5
seriesBlock = series(3921:4900);
targets = [-66.378   -61.436   -57.044   -55.044   -53.565   -51.34 8  -48.714   -46.228   -43.944   -41.666 -39.313   -36.937   -34.58  -32.239   -29.894   -27.544   -25.192   -22.842   -20.494   -18.145];
for i=1:20   
    d = seriesBlock(980-n+i:980+i-1)';    
    hiddenLayer = zeros(m, 1);   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));    
    seriesBlock(980 + i) = output;    
    output = ((maxValue - minValue) * output) + maxValue + minValue;    
    e1 = e1 + (targets(i) - output)^2;
end
e1 = e1 / 100;

disp('-------------------------------------------');
fprintf('E1: %f\n', e1);
fprintf('E2: %f\n', e2);

