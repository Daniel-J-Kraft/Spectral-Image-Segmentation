function fourCliq = fourCliqueEstimator(a,b,n)
En4 = n*(n+1)*(n^2+5*n-2)/16;
En3 = n^2*(n+3)/8;
En2 = (n^2+n)/4;
En1 = n/2;
L1 = a^6/24*(2*En4-4*n*En3+(6*n^2-18*n+22)*En2+(-4*n^3+18*n^2-22*n)*En1+n^4-6*n^3+11*n^2-6*n);
L2 = a^3*b^3/6*(-2*En4+4*n*En3+(-3*n^2+3*n-4)*En2+(n^3-3*n^2+4*n)*En1);
L3 = a^2*b^4/4*(En4-2*n*En3+(n^2+n-1)*En2+(-n^2+n)*En1);
fourCliq = L1 + L2 + L3;
end