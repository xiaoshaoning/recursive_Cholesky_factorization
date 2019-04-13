function test_cholesky_hardware_protocol(varargin)
% test Cholesky decomposition function

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

B = rand(N, N) + 1i * rand(N, N);

A = B * B';

a_memory = zeros((N+1) * N /2 , 1);
ap = 1;
for column = 1:N
    for row = column:N
        a_memory(ap) = A(row, column);
        ap = ap + 1;
    end
end

l_memory = cholesky_hardware_protocol(a_memory, N);

my_L = zeros(N, N);

lp = 1;
for column = 1:N
    for row = column:N
        my_L(row, column) = l_memory(lp);
        lp = lp + 1;
    end
end

disp(my_L * my_L' - A);

end