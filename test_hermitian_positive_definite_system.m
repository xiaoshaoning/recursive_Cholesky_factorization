function test_hermitian_positive_definite_system(varargin)

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

A = rand(N, N) + 1i * rand(N, N);

A = A' * A;

y = rand(N, 1) + 1i * rand(N, 1);

x = A \ y;

L = cholesky(A);

z = forward_substitute(L, y);

x_prime = backward_substitute(L', z);

if norm(x - x_prime) < 0.000001
    disp('test passed.');    
else
    disp('test failed.');
end

end