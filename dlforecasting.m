disp(datestr(now));

%clear all
close all

n = 20; %20
m = 18; %18
batchsize = 100;

disp('Reading database...');
db = 'acidentes';
dbunsupervised;

disp(datestr(now));
numdims = n;
numhid = m;
fprintf(1, 'Pretraining Layer 1 with RBM: %d-%d \n', numdims, numhid);
restart=1;
rbmcd;
vishid1 = vishid; hidbiases1 = hidbiases; visbiases1 = visbiases;
save rmb1 vishid1 hidbiases1 visbiases1;

disp(datestr(now));
numdims = m;
numhid = 1;
fprintf(1, 'Pretraining Layer 2 with RBM: %d-%d \n', numdims, numhid);
batchdata=batchposhidprobs;
restart=1;
rbmcd;
vishid2 = vishid; hidbiases2 = hidbiases; visbiases2 = visbiases;
save rmb2 vishid2 hidbiases2 visbiases2;

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