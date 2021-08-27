function E = makeEdgeList(weight_matrix)
count = 1;
n = length(weight_matrix(:,1));
% i and j run over rows and columns of the upper triangle weight matrix
% whenever the weight isn't equal to zero, thus signaling the existence of 
% an edge, we store the edge characteristics into our edgelist with the 
% indexing based on the weight value to support easy sorting later on
edge_list = zeros(n,3);
triu_weight = triu(weight_matrix);
for i=1:1024
    for j=i:1024
        %disp([i j])
        weight_ij = triu_weight(i,j);
        if weight_ij > 0
            %disp([weight_ij, i, j])
            edge_list(count, :) = [weight_ij, i, j];
            count =  count + 1;
        end
    end
end
% Sort the edgelist by increasing order of weight
edge_list = sortrows(edge_list, 'descend');
E = edge_list;
end

%{
% Pass E to cliques() as an edgelist of E: (v1) -> (v2) 
% not containing weights
edge_list = edge_list(:,2:3)
lambda = zeros(1,m)
for k=1:m
 temp = edge_list(1:i,:);
 lambda(k) = lambda1(edges, n);
end
%}