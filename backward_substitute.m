function x = backward_substitute(R, y)
% a recursive implementation of forward substitute
% @input: R is a lower triangle matrix
% @input: y is a column vector
% @output: x is a column vector
% @author: Xiao, Shaoning
% @date: 2019-04-12

    [N, M] = size(R);

    if N ~= M
        error('The input matrix shall be a square.')
    end

    if length(y) ~= M
        error('length of the input vector shall be consistent with dimension of the input matrix.');
    end

    a = R(N, N);
    x_n = y(N) / a;

    if N == 1
        x = x_n;
    else
        right_column = R(1:N-1, N);
        y_prime = y(1:N-1) - right_column * x_n;
        R_prime = R(1:N-1, 1:N-1);
        x_prime = backward_substitute(R_prime, y_prime);
        x = [x_prime; x_n];
    end
end
