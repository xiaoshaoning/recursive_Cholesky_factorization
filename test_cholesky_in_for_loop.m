function test_cholesky_in_for_loop(varargin)
% test Cholesky decomposition function

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

B = rand(N, N) + 1i * rand(N, N);

A = B * B';

L = cholesky_in_for_loop(A);

disp(L * L' - A);

end