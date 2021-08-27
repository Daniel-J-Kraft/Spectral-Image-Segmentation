runningEst2 = runningEdgeEst(E);

function sol = runningEdgeEst(E); %Takes in a nx3 list of ordered edges 
m = length(E(:,1));
n = 1024;
sol = zeros(m,3);
A = zeros(1024);

for i = 1:m
    A(E(i,2),E(i,3)) = 1;
    A(E(i,3),E(i,2)) = 1;
    
    t = trace(A^3)/6;
    
    cOne = 4*i/(n*(n-1));
    cTwo = 24*t/(n*(n-1)*(n-2));

    a = (cOne+(2*cTwo-cOne^3)^(1/3))/2;
    b = (cOne-(2*cTwo-cOne^3)^(1/3))/2;
    En4 = n*(n+1)*(n^2+5*n-2)/16;
    En3 = n^2*(n+3)/8;
    En2 = (n^2+n)/4;
    En1 = n/2;
    L1 = a^6/24*(2*En4-4*n*En3+(6*n^2-18*n+22)*En2+(-4*n^3+18*n^2-22*n)*En1+n^4-6*n^3+11*n^2-6*n);
    L2 = a^3*b^3/6*(-2*En4+4*n*En3+(-3*n^2+3*n-4)*En2+(n^3-3*n^2+4*n)*En1);
    L3 = a^2*b^4/4*(En4-2*n*En3+(n^2+n-1)*En2+(-n^2+n)*En1);
    fourCliqEst = L1 + L2 + L3;
    sol(i,:) = [a b fourCliqEst];
end
end