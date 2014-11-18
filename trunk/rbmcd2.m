[numcases numdims numbatches]=size(batchdata);

vishid     = rand(numdims, numhid);
hidbiases  = rand(1, numhid);
visbiases  = rand(1, numdims);

hidprob = zeros(1, numhid);
hidstates = zeros(1, numhid);
visprob = zeros(1, numdims);
visstates = zeros(1, numdims);

energyRate = 0.05;
learningRate = 0.5;
previousEnergy = 0;
energy = 1;

while (energy - previousEnergy) > energyRate     
    for batch = 1:numbatches
        data = batchdata(:,:,batch);
        
        hidprob = 1./(1 + exp(-data*vishid - repmat(hidbiases,numcases,1)));
        hidstates = hidprob > rand;
        
        visprob = 1./(1 + exp(-hidstates*vishid' - repmat(visbiases,numcases,1)));
        visstates = visprob > rand;
        
        expectationData = data' * hidstates;
        expectationRecon = +visstates' * +hidstates;
        
        vishid = vishid + learningRate * (expectationData - expectationRecon);
        %hidbiases = hidbiases + learningRate * (expectationData - expectationRecon);
        %visbiases = visbiases + learningRate * (expectationData - expectationRecon);
        
        
    end
    
    previousEnergy = energy;
    energy = - visbiases*visstates - hidbiases*hidstates - visstates*hidstates*vishid;
end







% vishid     = rand(numdims, numhid);
% hidbiases  = rand(1, numhid);
% visbiases  = rand(1, numdims);
% 
% 
% hidprob = zeros(1, numhid);
% hidstates = zeros(1, numhid);
% visprob = zeros(1, numdims);
% visstates = zeros(1, numdims);
% 
% learningRate = 0.5;
% 
% for d=1:size(data, 1)
%     for j=1:numhid
%         deltaE = 0;
%         for i=1:numdims
%             deltaE = deltaE + (vishid(i, j) + hidbiases(1, j));            
%         end
%         pj = 1 / (1 + exp(-1 * deltaE));
%         hidprob(1, j) = pj;
%         hidstates(1, j) = hidprob(1, j) > rand;
%     end
%     
%     for i=1:numdims
%         deltaE = 0;
%         for j=1:numhid
%             deltaE = deltaE + (vishid(i, j) + visbiases(1, i));            
%         end
%         pi = 1 / (1 + exp(-1 * deltaE));
%         visprob(1, j) = pi;
%         visstates(1, j) = visprob(1, j) > rand;
%     end
%     pijData = data(d, :)' * hidstates;
%     pijRecon = visstates' * hidstates;
%     
%     vishid = vishid + learningRate * (pijData - pijRecon);
% end
% 
% features = data * vishid;