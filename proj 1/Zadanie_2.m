syms s t

% Define the function F(s)
F_s = (s^3 + 4*s^2 + 6*s + 5) / ((s + 8)*(s^2 + 8*s + 3)*(s^2 + 5*s + 7));

% Calculate the partial fraction decomposition if needed
F_s_part = partfrac(F_s, s);

% Compute the inverse Laplace transform
f_t = ilaplace(F_s_part);

% Define the time vector
time_vec = 0:0.1:50;

% Convert symbolic expression to MATLAB function
f_t_func = matlabFunction(f_t);

% Calculate the values of the function over time
f_t_values = f_t_func(time_vec);

% Plot the function
figure;
fplot(f_t, [0, 50]);
xlabel('Time (s)');
ylabel('f(t)');
title('Inverse Laplace Transform of F(s)');