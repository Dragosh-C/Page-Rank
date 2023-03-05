function R = Iterative(name, d, eps)
	
    fid = fopen(name);
    N = fscanf(fid,"%d", 1);
    A = zeros(N);

    for i=1:N
        nod = fscanf(fid,"%d", 1);
        nrLinks = fscanf(fid,"%d", 1);
        link = fscanf(fid,"%d", nrLinks); % The vector of links
        for j = 1:nrLinks
            A(link(j), nod) = 1; % Created the adjacency matrix
        end
        A(i,i) = 0;
    end
    
    M = A;
    for j = 1:N
        sum_col = sum(M(:,j)); % The sum of the elements on the column
        for i=1:N
            if M(i,j) == 1
                M(i,j) = M(i,j)/sum_col; % Determined the matrix M
            end
        end
    end

    N = size(M, 2);
    R = rand(N, 1);
    R = R ./ norm(R, 1)
    last_v = ones(N, 1) * inf;
    M_hat = (d .* M) + (((1 - d) / N) .* ones(N, N));
    while (norm(R - last_v, 2) > eps)
	    last_v = R;
	    R = M_hat * R;
    end
    fclose('all');
end
