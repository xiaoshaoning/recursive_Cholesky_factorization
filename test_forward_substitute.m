function test_forward_substitute(varargin)

if nargin == 0
    N = 8;
else
    N = varargin{1};
end

L = rand(N, N);

for row = 1:N
    for column = row+1:N
        L(row, column) = 0;
    end
end

y = rand(N, 1);

x = L\y;

z = forward_substitute(L, y);

if norm(x - z) < 1e-7
    disp('test passed.');
else
    disp('test failed.');
    disp(norm(x-z));
end

end
