function test_backward_substitute(varargin)

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

R = rand(N, N);

for row = 2:N
    for column = 1:row-1
        R(row, column) = 0;
    end
end

y = rand(N, 1);

x = R\y;

z = backward_substitute(R, y);

if norm(x - z) < 1e-7
    disp('test passed.');
else
    disp('test failed.');
    disp(norm(x-z));
end

end
