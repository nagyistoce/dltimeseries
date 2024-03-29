switch db    
    case 'cats'
        fid = fopen('database/CATS.txt');
        seriesRaw = fscanf(fid, '%f');
        
        
        maxValue = max(seriesRaw);
        minValue = min(seriesRaw);
        meanValue = mean(seriesRaw);
        stdValue = std(seriesRaw);
       % [-1, 1]
%         for i=1:size(seriesRaw, 1)
%             series(i, 1) = (seriesRaw(i, 1) - maxValue - minValue) / (maxValue - minValue);            
%         end
        %series = 2*(seriesRaw - min(seriesRaw))/(max(seriesRaw) - min(seriesRaw)) - 1;
        % [0, 1]
        series = (seriesRaw - min(seriesRaw)) / (max(seriesRaw) - min(seriesRaw));
        % N(0, 1)
%         for i=1:size(seriesRaw, 1)
%             series(i, 1) = (seriesRaw(i, 1) - meanValue) / stdValue;            
%         end
                
        %series = seriesRaw;

        data1Block = zeros(980 - n, n);
        data2Block = zeros(980 - n, n);
        data3Block = zeros(980 - n, n);
        data4Block = zeros(980 - n, n);
        data5Block = zeros(980 - n, n);    
        
        targets = zeros(size(series, 1) - 5 * n); 
        
        k = 1;
        j = 1;        
        for i=1:980-n
            data1Block(j, :) = series(i:i+n-1)';
            targets(k, 1) = series(i + n);
            j = j + 1;
            k = k + 1;
        end           
        j = 1;
        for i=981:1960-n            
            data2Block(j, :) = series(i:i+n-1)';
            targets(k, 1) = series(i + n);
            j = j + 1;
            k = k + 1;
        end   
        j = 1;
        for i=1961:2940-n
            data3Block(j, :) = series(i:i+n-1)';
            targets(k, 1) = series(i + n);
            j = j + 1;
            k = k + 1;
        end   
        j = 1;
        for i=2941:3920-n
            data4Block(j, :) = series(i:i+n-1)';
            targets(k, 1) = series(i + n);
            j = j + 1;
            k = k + 1;
        end   
        j = 1;
        for i=3921:4900-n
            data5Block(j, :) = series(i:i+n-1)';
            targets(k, 1) = series(i + n);
            j = j + 1;
            k = k + 1;
        end
       
        data = [data1Block; data2Block; data3Block; data4Block; data5Block];
        
        
        
    case {'acidentes', 'bjd', 'scr', 'tri', 'elec'}
        fid = fopen(strcat(db,'.trn.dat'));
        seriesRaw = fscanf(fid, '%f');
        series = seriesRaw;
        
%         % remove trend        
%         for a=2:size(seriesRaw,1)
%             series(a, 1) = seriesRaw(a, 1) - seriesRaw(a-1, 1);            
%         end
%         
%         % remove seasonality
%         season = 12;
%         for a=1+season:size(seriesRaw,1)
%             series(a, 1) = series(a, 1) - series(a-12, 1);            
%         end
        
        %[0, 1]
        series = (series - min(series)) / (max(series) - min(series));  
        
                
        data = zeros(size(series, 1) - n, n);
        targets = zeros(size(series, 1) - n, 1);
        
        for i=1:size(data, 1)
            data(i, :) = series(i:i+n-1);    
            targets(i) = series(i+n);
        end
          

end