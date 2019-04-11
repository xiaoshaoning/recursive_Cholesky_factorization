function test_cholesky(varargin)
% test Cholesky decomposition function

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

B = rand(N, N) + 1i * rand(N, N);

A = B * B';

L = cholesky(A);

disp(L * L' - A);

end