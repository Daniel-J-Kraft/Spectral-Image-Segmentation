function im = scaledImage(p1,p2,fileName)
tic
reMat = [];
plane1 = [];
plane2 = [];
row = [];
row2 = [];
n = length(p1)+length(p2);
vect = zeros(n,1);
vect2 = zeros(n,1);
for i = p1
    vect(i) = .1;
    vect2(i) = .9;
end
for j = p2
    vect(j) = .6;
    vect2(j) = .2;
end
mat = reshape(vect,[32,32])';
mat2 = reshape(vect2,[32,32])';
for i = 1:32
    for j = 1:32
        row = [row,ones(32)*mat(i,j)];
        row2 = [row2,ones(32)*mat2(i,j)];
    end
    plane1 = [plane1;row];
    plane2 = [plane2;row2];
    row = [];
    row2 = [];
end
reMat = cat(3,plane1,zeros(size(plane1)),plane2);
reIm = image(reMat,'CDataMapping','scaled');
%set(im, 'AlphaData', K/20);
imwrite(reMat,fileName,'Alpha',.5*ones(1024));
toc
end