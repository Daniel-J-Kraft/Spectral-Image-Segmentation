thirtyTwo(L_partition_omega_1,L_partition_omega_2,'L_partition_test.bmp')

function im = thirtyTwo(p1,p2,fileName)
n = sqrt(length(p1)+length(p2));
vect = zeros(n^2,1);
for i = p1
    vect(i) = .2;
end
for j = p2
    vect(j) = .5;
end
mat = reshape(vect,[n,n])';

%im = image(mat,'CDataMapping','scaled');
imwrite(mat,fileName);
end