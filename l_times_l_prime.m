function result = l_times_l_prime( l_memory, M)
result = zeros(M*(M+1)/2, 1);

index = 1;
for column = 1:M
    for row = column:M
        result(index) = l_memory(row) * conj(l_memory(column));
        index = index + 1;
    end
end
end