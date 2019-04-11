function L = cholesky(A)
% a recursive implementation of Cholesky decomposition
% @input: A shall be a Hermition positive definite matrix.
% @output: L is a lower triangle matrix
% @author: Xiao, Shaoning
% @date: 2019-04-11

[N, M] = size(A);

if N ~= M
    error('A shall be a square.');
end

t = sqrt(A(1, 1));

if N == 1
    L = t;    % base case
else
    left_column = A(2:N, 1) / t;
    A_prime = A(2:N, 2:N) - left_column * left_column';
    L_prime = cholesky(A_prime);
    L = [[t; left_column], [zeros(1, N-1); L_prime]];
end

end
