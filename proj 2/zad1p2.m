A = 8;
B = 9;
G1 = tf([A], [B 1]);

% Wykres Nyquista
figure;
nyquist(G1);
title('Charakterystyka Nyquista');
xlabel('Część rzeczywista');
ylabel('Część urojona');

% Wektory częstotliwości i czasu
omega = linspace(0.1, 10, 100);  % Wektor pulsacji kątowych
t = linspace(0, 100, 1000);       % Wektor czasu

% Symulacja i rysowanie odpowiedzi systemu
figure;
hold on;
y_ss = zeros(1, length(omega));  % Inicjalizacja wektora odpowiedzi ustalonej
for i = 1:length(omega)
    u = sin(omega(i) * t);  % Generowanie sinusoidy dla danej pulsacji
    y = lsim(G1, u, t);  % Symulacja odpowiedzi systemu
    plot(t, y);  % Rysowanie odpowiedzi czasowej dla każdej pulsacji
    y_ss(i) = y(end);  % Odpowiedź w stanie ustalonym dla danej pulsacji
end
hold off;
title('Odpowiedź układu na sygnał sinusoidalny');
xlabel('Czas [s]');
ylabel('Odpowiedź y(t)');

% Charakterystyka amplitudowa
A_estimated = abs(y_ss);  % Amplituda wyjścia
figure;
plot(omega, A_estimated);
title('Charakterystyka amplitudowa');
xlabel('Pulsacja \omega [rad/s]');
ylabel('Amplituda');

% Charakterystyka fazowa
phase_shift = angle(y_ss);  % Przesunięcie fazowe wyjścia
figure;
plot(omega, phase_shift);
title('Charakterystyka fazowa');
xlabel('Pulsacja \omega [rad/s]');
ylabel('Przesunięcie fazowe [rad]');