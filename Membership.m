function y = Membership(x, val1, val2)
	% The function that receives as parameters x, val1, val2 and that calculates the value of the member function at point x.
% We know that 0 <= x <= 1

	[N, ~] = size(x);
    i = 1;
    while i <= N
        if x(i) >= 0 && x(i) < val1  % the first branch
            x(i) = 0;
        end
        % Determination of a and b for which the function is continuous
         % and change x for the degree of membership
        if x(i) > val1 && x(i) < val2 
            A=[val1, 1; val2, 1];
            B = [0;1];
            A = A\B;
            x(i) = A(1)*x(i)+A(2);
        end
        if x(i) <= 1 && x(i) > val2 % branch 3
            x(i) = 1;
        end
        i = i+1;
    end
   y = x;
end
