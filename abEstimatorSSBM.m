function [a b E] = abEstimatorSSBM(W) %a is a weight matrix
n = length(W(2,:));
E = makeEdgeList(W);
m = length(E(:,1));
A = zeros(n);
for i = 1:n
    for j = i:n
        if W(i,j) ~= 0
            A(i,j) = 1;
            A(j,i) = 1;
        end
    end
end
t = trace(A^3)/6;
cOne = 4*m/(n*(n-1));
cTwo = 24*t/(n*(n-1)*(n-2));

a = (cOne+(2*cTwo-cOne^3)^(1/3))/2;
b = (cOne-(2*cTwo-cOne^3)^(1/3))/2;
end