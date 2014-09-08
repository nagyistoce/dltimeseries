[numcases numdims numbatches]=size(batchdata);

%pso parameters
swarmSize = 30; %swarm size 10 
dimension = (numdims * numhid) + numdims + numhid;
xmax = 1;
xmin = -1;
vmax = 1;
vmin = -1;
w = 0.9; %inertia weight (momentum term)
c1 = 2.05;
c2 = 2.05; %individual and global acceleration coefficients
iterMax = 30; %10
maxCountStopCriteria = 100;

disp('PSO initialiazation');
fprintf('Swarm size: %d\n', swarmSize);

swarm = 0.1*randn(dimension, swarmSize);
lbest = swarm;
v = 0.1*randn(dimension, swarmSize);

fitnessLbest = 1000000000000 * ones(1,swarmSize);
fitnessGbest = 1000000000000;

errList2 = zeros(1, numbatches);
fits = zeros(iterMax, swarmSize);
gbestList = zeros(1, iterMax);
batch = 1;
countStopCriteria = 1;
for iter=1:iterMax %each iteration        
    fprintf('PSO Iteration: %d\n', iter);  
    previousFitnessGbest = fitnessGbest;
    for i=1:swarmSize %each particle
        %fprintf('Particle: %d\n', i);
        
        %if (mod(batch,numbatches/10) == 0) fprintf('Extracting patch: %d / %d\n', batch, numbatches); end
        
        particle = swarm(:, i);       
        visbiases   = particle(1:numdims)'*0.0002;
        hidbiases   = particle((numdims+1):(numdims+numhid))';       
        vishid = particle((numdims+numhid+1):end);
        vishid = reshape([vishid(:) ; zeros(rem(numdims - rem(numel(vishid),numdims),numdims),1)],numdims,[]);
        
        if batch >= numbatches
            batch = 1;         
        end        
        data = batchdata(:,:,batch);
        batch = batch + 1;       
        
        poshidprobs = 1./(1 + exp(-data*vishid - repmat(hidbiases,numcases,1)));
        poshidstates = poshidprobs > rand(numcases,numhid);
        negdata = 1./(1 + exp(-poshidstates*vishid' - repmat(visbiases,numcases,1)));
        fitness = sum(sum((data-negdata).^2));    
        
        errList2(1, batch) = fitness;
        
        fits(iter, i) = fitness;
                
        if (fitness < fitnessLbest(1, i))            
            lbest(:, i) = particle;
            fitnessLbest(1, i) = fitness;
            %disp('Lbest updated');
        end
        if (fitnessLbest(1, i) < fitnessGbest)            
            gbest = lbest(:, i);            
            fitnessGbest = fitnessLbest(1, i); 
            %disp('Gbest updated');
            poshidprobsGbest = poshidprobs;
        end
        
        part1 = c1 * round(rand) * (lbest(:, i) - particle);
        part2 = c2 * round(rand) * (gbest - particle);
        v(:, i) = w * v(:, i) + part1 + part2;              
        v(v > vmax) = vmax;
        v(v < vmin) = vmin;
        swarm(:, i) = particle + v(:, i);
        
        
%         for j=1:dimension %each dimension
%             part1 = c1 * round(rand) * (lbest(j, i) - particle(j));
%             part2 = c2 * round(rand) * (gbest(j) - particle(j));
%             v(j, i) = w * v(j, i) + part1 + part2;
%             if v(j, i) > vmax
%                 v(j, i) = vmax;
%             elseif v(j, i) < vmin
%                 v(j, i) = vmin;                
%             end
%             swarm(j, i) = particle(j) + v(j, i);
%         end 
    end
    w = w - 0.5 / iterMax; %w decreases linearly
    fprintf('Fitness GBEST: %f\n', fitnessGbest); 
    gbestList(1, iter) = fitnessGbest;
    %disp(fits);
    %disp(mean(v));
    if previousFitnessGbest == fitnessGbest
        countStopCriteria = countStopCriteria + 1;
    else
        countStopCriteria = 0;
    end
    if countStopCriteria > maxCountStopCriteria
        break;
    end    
end

%disp(fits);

visbiases   = gbest(1:numdims)';
hidbiases   = gbest((numdims+1):(numdims+numhid))';
vishid = particle((numdims+numhid+1):end);
vishid = reshape([vishid(:) ; zeros(rem(numdims - rem(numel(vishid),numdims),numdims),1)],numdims,[]);

batchposhidprobs = zeros(numcases,numhid,numbatches);
for batch = 1:numbatches
    data = batchdata(:,:,batch);
    poshidprobs = 1./(1 + exp(-data*vishid - repmat(hidbiases,numcases,1)));    
    batchposhidprobs(:,:,batch)=poshidprobs;    
end

