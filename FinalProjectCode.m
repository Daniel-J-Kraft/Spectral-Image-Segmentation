%FINAL PROJECT

% Skip first line to get to data
f = fopen('WeightMatrixForImage2Noisy.dat.txt','r');
fgetl(f);
% Read in all data from matrix
data = fscanf(f, "%f");
fclose(f);
n = 1024;
% Take first [1:n^2] subset of data to store first matrix
%data
weight_vector = data(1:(n*n));
% Reshape [n^2 x 1] vector into [n x n] matrix
weight_matrix = reshape(weight_vector, n, n);
%% SSBM 
[a b E] = abEstimatorSSBM(weight_matrix);
disp(a)
disp(b)
%exp4clique = fourCliqueEstimator(a,b,n)
%fourClique = qClique(E,n,length(E(:,1)),4);
