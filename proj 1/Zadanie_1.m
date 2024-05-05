syms t s
A = 8; %indeks M. Zubrzyckiego: 272568
B = 9; %indeks S. Nowickiego: 272509
C = A + B; % Suma A i B

% Definicja funkcji f1(t) i f2(t)
f1(t) = A*t*exp(-B*t);
f2(t) = A - exp(-2*t)*(sin(t - B) - cos(t - B) + sin(t - C)*cos(t - C));

% Obliczenie transformacji Laplace’a dla f1(t) i f2(t)
L_f1 = laplace(f1, t, s);
L_f2 = laplace(f2, t, s);


% Wypisanie wyniku
disp('Transformata Laplace’a dla funkcji f1(t): ');
disp(simplify(L_f1));
disp('Transformata Laplace’a dla funkcji f2(t): ');
disp(simplify(L_f2));
