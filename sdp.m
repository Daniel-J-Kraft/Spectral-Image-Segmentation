cvx_begin
    variable Y(n,n) semidefinite;
    maximize( trace(weight_matrix*Y) );
    subject to
        Y == transpose(Y);
        for i = 1:n
            Y(i,i) == 1;
        end
        Y*ones(n,1) == 0;
cvx_end

% Do eigenpair calculations at the bottom