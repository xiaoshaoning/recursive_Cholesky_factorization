function l_memory = cholesky_hardware_protocol(a_memory, N)
% an implementation of Cholesky decomposition for hardware design
% @input: a_memory stores a Hermition positive definite matrix initially
% @output: l_memory stores a lower triangle matrix.
% @author: Xiao, Shaoning
% @date: 2019-04-13

l_memory = zeros((N+1)*N/2, 1);

lp = 1; % diagnal position

for k = 1:N
    l_memory(lp) = sqrt(a_memory(lp));
    
    l_memory(lp+1:lp+N-k) = a_memory(lp+1:lp+N-k) / l_memory(lp);
    
    a_memory(lp+N-k+1:N*(N+1)/2) = a_memory(lp+N-k+1:N*(N+1)/2) - l_times_l_prime( l_memory(lp+1:lp+N-k), N-k);
    
    lp = lp + N - k + 1;
end

end