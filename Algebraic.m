function R = Algebraic(name, d)
    fid = fopen(name);
    N = fscanf(fid,"%d", 1); % Read the first element from the file
    A = zeros(N);
    % Added the first N lines in 2 variables and an arr
    for i=1:N
        nod = fscanf(fid,"%d", 1);
        nrLinks = fscanf(fid,"%d", 1);
        link = fscanf(fid,"%d", nrLinks); % The link vector
        for j = 1:nrLinks
            A(link(j), nod) = 1; % Created the adjacency matrix
        end
        A(i,i) = 0; % the elements on the main diagonal 0
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

    I=eye(N); % The unit matrix
    colVect=ones(N, 1); % vector with elements 1
    R_prev=PR_Inv(I-d*M);  % reverse
    R = R_prev*((1-d)/N)*colVect;  % rank determination
end
