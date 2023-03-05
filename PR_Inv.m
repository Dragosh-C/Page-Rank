function B = PR_Inv(A)
	% The function that calculates the inverse of the matrix A using Gram-Schmidt factorizations
	
    % Modified Gram-Schmidt algorithm
    [~, n] = size(A);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
	    R(i,i) = norm(A(:,i),2);
	    Q(:,i) = A(:,i)/R(i,i);
        for j = i+1:n
	        R(i,j) = Q(:,i)'*A(:,j);
	        A(:,j) = A(:,j) - Q(:,i)*R(i,j);
        end
    end

    B = zeros(n);
    Q = Q';
    % Calculating the inverse by solving
     % of the upper triangular system
    for k = 1:n 
        x = zeros(n,1); % initializing the vector
        for i = n:-1:1 
            sum = 0;
            for j = i+1:n
                sum = sum + R(i,j)*x(j); % calculate the sum of
            end
            x(i) = (Q(i,k)-sum)/R(i,i);
        end
        B(:,k) = x; % input in B each column
    end
end

