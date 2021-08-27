% Computes Cumulative number of 3-cliques of a random graph.
% Inputs: 
           % E is a mx2 matrix of ordered edges (matrix of integers)
           % n is the number of vertices (integer)
           % m is the number of edges (integer)
           % p is the clique order (integer); for now p should be set to 3
% Outputs:
           % qp is a m-vector of integers. qp(k) should contain the number 
           % of p-cliques  of the graph whose set of edges is E(1:k,1:2)
           
function z = qClique(E,n,m,p)
    qp = zeros(1,m);
    A = zeros(n,n);
    edgelist = E(1,:);
    v_1 = edgelist(2);
    v_2 = edgelist(3);
    A(v_1,v_2) = 1;
    A(v_2,v_1) = 1;
    for k = 2:m
        edgelist = E(k,:);
            v_1 = int8(edgelist(2));
            v_2 = int8(edgelist(3));
            
            %disp(A(v_1,v_2));
            A(v_1,v_2) = 1;
            A(v_2,v_1) = 1;
            qp(k) = qp(k-1);
            %disp('after:') printing statements for testing
            %disp(A(v_1,v_2));
            %disp(sum(A(:))-sum(Aint(:)))%These are always 2, implying that the
            %new matrix is always more connected than the last
            switch p
                case 3
                    for j = 1:n
                        qp(k)= qp(k) + A(v_1,j)*A(v_2,j);
                    end
                case 4
                    for j = 1:n
                        for s = j+1:n
                            new = A(v_1,j)*A(v_1,s)*A(v_2,j)*A(v_2,s)*A(j,s);
                            qp(k)=qp(k)+new;
                            %if new <0 %The new variable IS always nonnegative
                            %    disp(new)
                            %end
                        end
                    end
            end
    end
    z = qp;
end