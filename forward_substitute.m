function x = forward_substitute(L, y)
% a recursive implementation of forward substitute
% @input: L is a lower triangle matrix
% @input: y is a column vector
% @output: x is a column vector
% @author: Xiao, Shaoning
% @date: 2019-04-12

    [N, M] = size(L);

    if N ~= M
        error('The input matrix shall be a square.')
    end

    if length(y) ~= M
        error('length of the input vector shall be consistent with dimension of the input matrix.');
    end

    a = L(1, 1);
    x_1 = y(1, 1) / a;

    if N == 1
        x = x_1;
    else
        left_column = L(2:end, 1);
        y_prime = y(2:end) - left_column * x_1;
        L_prime = L(2:end, 2:end);
        x_prime = forward_substitute(L_prime, y_prime);
        x = [x_1; x_prime];
    end
end
