beta = particle(1:n*m);
beta = reshape([beta(:) ; zeros(rem(n - rem(numel(beta),n),n),1)],n,[]);

alfa = particle((n*m+1):(n*m+m));

bias = particle((n*m+m+1):(n*m+2*m));

%wout = particle(size(particle,1));

mse = 0;
for k=1:size(data, 1)
    
    d = data(k, :);    
    target = targets(k, 1);
    hiddenLayer = zeros(m, 1);
   
    for j=1:m        
        value = (beta(:, j)' * d') + bias(j, 1);  
        hiddenLayer(j, 1) = 1 / (1 + exp(-1 * value));
    end
   
    value = hiddenLayer' * alfa;
    output = 1 / (1 + exp(-1 * value));   
    
    mse = mse + (output - target)^2;
   
end

mse = mse / size(data, 1);

fitness = mse;






