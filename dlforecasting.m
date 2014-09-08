%clear all
close all

n = 20;
m = 18;
batchsize = 100;
maxepoch = 50;

disp('Reading database...');
db = 'CATS';
dbunsupervised;

numdims = n;
numhid = m;
fprintf(1, 'Pretraining Layer 1 with RBM: %d-%d \n', numdims, numhid);
restart=1;
rbmpsobatch;
vishid1 = vishid; hidbiases1 = hidbiases; visbiases1 = visbiases;
save rmb1 vishid1 hidbiases1 visbiases1;

numdims = m;
numhid = 1;
fprintf(1, 'Pretraining Layer 3 with RBM: %d-%d \n', numdims, numhid);
batchdata=batchposhidprobs;
restart=1;
rbmpsobatch;
vishid2 = vishid; hidbiases2 = hidbiases; visbiases2 = visbiases;
save rmb2 vishid2 hidbiases2 visbiases2;

dbsupervised;

nnpso;

nntest;