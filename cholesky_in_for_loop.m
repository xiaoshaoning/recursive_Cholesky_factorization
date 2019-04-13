function L = cholesky_in_for_loop(A)
% a recursive implementation of Cholesky decomposition
% @input: A shall be a Hermition positive definite matrix.
% @output: L is a lower triangle matrix
% @author: Xiao, Shaoning
% @date: 2019-04-13

[N, M] = size(A);

if N ~= M
    error('A shall be a square.');
end

L = zeros(N, N);

for k = 1:N
    L(k, k) = sqrt(A(k, k));
    L(k+1:N, k) = A(k+1:N, k) / L(k, k);

    A(k+1:N, k+1:N) = A(k+1:N, k+1:N) - L(k+1:N, k) * L(k+1:N, k)';
end

end