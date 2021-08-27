%errorLaplaceSpectral = errorCalc(L_partition_omega_1);
%errorNormalizedLaplaceSpectral = errorCalc(norm_L_partition_omega_1);
errorWeightSpectral = errorCalc(weight_partition_omega_2);
%errorLaplaceSDP = errorCalc(p1Laplace);
%errorNoralizedLaplaceSDP = errorCalc(p1Normal);
%errorWeightSDP = errorCalc(p1Weight);
function error = errorCalc(partition)
A = imread('phantom2.bmp');
A = A/255;
n = length(A(:,1));
realPart = zeros(1024,1);
for i = partition
    realPart(i) = 1;
end
partMat = reshape(realPart,[32 32])';
errorMat = xor(partMat,A);
error = sum(sum(errorMat));
if error > 512
    error = 1024 - error;
end
error = error/1024
end
        