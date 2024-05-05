function numerical_solution
    % Stałe zadania
    A = 8; B = 9; C = 17;

    % Definicja przedziału czasu
    t0 = 0; Tend = 50; DeltaT = 0.1;
    tspan = t0:DeltaT:Tend;

    % Warunki początkowe
    x0 = [0; 0];  % x(0) i x'(0)

    % ODE solver call
    [t, x] = ode45(@(t, x) oscylator(t, x, A, B, C), tspan, x0);

    % Wykres wyników
    plot(t, x(:,1), 'DisplayName', 'Numerical Solution');
    title('Rozwiązanie numeryczne równania różniczkowego');
    xlabel('Czas [s]');
    ylabel('x(t)');
    grid on;
    legend show;
end

function dxdt = oscylator(t, x, A, B, C)
    % Równanie różniczkowe zdefiniowane jako funkcja
    dxdt = zeros(2,1);  % Inicjalizacja wektora pochodnych
    dxdt(1) = x(2);  % dx/dt = v
    dxdt(2) = A*sin(B*t) - C*x(2) - 5*x(1);  % d^2x/dt^2 równanie
end