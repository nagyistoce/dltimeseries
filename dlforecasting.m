disp(datestr(now));

%clear all
close all

n = 17; %20
m = 16; %floor(n*0.75); %18
batchsize = 100;

% pso parameters
swarmSize = 2; %30
dimension = m * (n + 2) + 1;
swarm = zeros(dimension, swarmSize);
iterMax = 1; %30
maxCountStopCriteria = 20;

disp('Reading database...');
db = 'cats';
dbunsupervised;
batchdata1 = batchdata;

dbn = randDBN([n, m, 1]);
dbn = pretrainDBN(dbn, data);

rbm1 = dbn.rbm{1};
rbm2 = dbn.rbm{2};

vishid1 = rbm1.W;
vishid2 = rbm2.W;
hidbiases1 = rbm1.b;
hidbiases2 = rbm2.b;


% disp(datestr(now));
% numdims = n;
% numhid = m;
% fprintf(1, 'Pretraining Layer 1 with RBM: %d-%d \n', numdims, numhid);
% restart=1;
% rbmcd;
% vishid1 = vishid; hidbiases1 = hidbiases; visbiases1 = visbiases;
% save rmb1 vishid1 hidbiases1 visbiases1;
% 
% disp(datestr(now));
% numdims = m;
% numhid = 1;
% fprintf(1, 'Pretraining Layer 2 with RBM: %d-%d \n', numdims, numhid);
% batchdata=batchposhidprobs;
% %data = features;
% restart=1;
% rbmcd;
% vishid2 = vishid; hidbiases2 = hidbiases; visbiases2 = visbiases;
% save rmb2 vishid2 hidbiases2 visbiases2;

% disp(datestr(now));
% for i=1:swarmSize
%     batchdata = batchdata1;
%     numdims = n;
%     numhid = m;
%     fprintf(1, 'Pretraining Layer 1 with RBM: %d-%d \n', numdims, numhid);
%     restart=1;
%     rbmcd;
%     vishid1 = vishid; hidbiases1 = hidbiases; visbiases1 = visbiases;
%     
%     numdims = m;
%     numhid = 1;
%     fprintf(1, 'Pretraining Layer 2 with RBM: %d-%d \n', numdims, numhid);
%     batchdata=batchposhidprobs;
%     %data = features;
%     restart=1;
%     rbmcd;
%     vishid2 = vishid; hidbiases2 = hidbiases; visbiases2 = visbiases;
%     
%     swarm(:, i) = [reshape(vishid1,n*m,1)' vishid2' hidbiases1 hidbiases2];
% end
% disp(datestr(now));

disp(datestr(now));
disp('Reading database...');
dbsupervised;

disp(datestr(now));
disp('Training NN...');
nnpso;

disp(datestr(now));
disp('Testing NN...');
nntest;

disp(datestr(now));