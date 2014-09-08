%pso parameters
swarmSize = 1; %30
dimension = m * (n + 2);
xmax = 1;
xmin = -1;
vmax = 0.1;
vmin = -0.1;
w = 0.9; %inertia weight (momentum term)
c1 = 2.05;
c2 = 2.05; %individual and global acceleration coefficients
iterMax = 1; %30
maxCountStopCriteria = 100;

disp('PSO initialiazation');
fprintf('Swarm size: %d\n', swarmSize);

load('rmb1');
load('rmb2');
swarm = 0.1*randn(dimension, swarmSize);
swarm(:, 1) = [reshape(vishid1,n*m,1)' vishid2' visbiases2];
% swarm(:, 1) = [reshape(vishid1,n*m,1)' vishid2' 0.1*randn(1, m)];
lbest = swarm;
v = 0.1*randn(dimension, swarmSize);

fitnessLbest = 1000000000000 * ones(1,swarmSize);
fitnessGbest = 1000000000000;

countStopCriteria = 1;
for iter=1:iterMax %each iteration        
    fprintf('PSO Iteration: %d\n', iter);
    previousFitnessGbest = fitnessGbest;
    for i=1:swarmSize %each particle
        %fprintf('Particle: %d\n', i);
        particle = swarm(:, i);       

        psofitness;       
        
        if (fitness < fitnessLbest(1, i))            
            lbest(:, i) = particle;
            fitnessLbest(1, i) = fitness; 
        end
        if (fitnessLbest(1, i) < fitnessGbest)            
            gbest = lbest(:, i);            
            fitnessGbest = fitnessLbest(1, i);    
            poshidprobsGbest = poshidprobs;
        end
    end    
    for i=1:swarmSize 
        for j=1:dimension %each dimension
            part1 = c1 * round(rand) * (lbest(j, i) - particle(j));
            part2 = c2 * round(rand) * (gbest(j) - particle(j));
            v(j, i) = w * v(j, i) + part1 + part2;
            if v(j, i) > vmax
                v(j, i) = vmax;
            elseif v(j, i) < vmin
                v(j, i) = vmin;                
            end
            swarm(j, i) = particle(j) + v(j, i);
        end 
    end
    w = w - 0.5 / iterMax; %w decreases linearly
    fprintf('Fitness GBEST: %f\n', fitnessGbest);
    
    
    if previousFitnessGbest == fitnessGbest
        countStopCriteria = countStopCriteria + 1;
    else
        countStopCriteria = 0;
    end
    if countStopCriteria > maxCountStopCriteria
        break;
    end    
end

beta = gbest(1:n*m);
beta = reshape([beta(:) ; zeros(rem(n - rem(numel(beta),n),n),1)],n,[]);

alfa = gbest((n*m+1):(n*m+m));

bias = gbest((n*m+m+1):(n*m+2*m));