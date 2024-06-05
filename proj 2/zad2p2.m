A = 8;
B = 9;
C = A + B;

% Transmitancja obiektu
G2 = tf([C], conv([1 2], conv([1 3], [1 -1])));

% Definiowanie regulatora P i PI
Kp = 1;  % wartość początkowa
Ki = 1;  % wartość początkowa

% Regulator P
G_P = tf([Kp], [1]);

% Regulator PI
G_PI = tf([Kp Ki], [1 0]);

% Transmitancja układu otwartego z regulatorem P
open_loop_P = series(G_P, G2);
% Transmitancja układu zamkniętego z regulatorem P
closed_loop_P = feedback(open_loop_P, 1);

% Transmitancja układu otwartego z regulatorem PI
open_loop_PI = series(G_PI, G2);
% Transmitancja układu zamkniętego z regulatorem PI
closed_loop_PI = feedback(open_loop_PI, 1);

% Symulacja odpowiedzi skokowej
figure;
subplot(2,1,1);
step(closed_loop_P);
title('Odpowiedź skokowa dla układu z regulatorem P');
xlabel('Czas [s]');
ylabel('Odpowiedź');

subplot(2,1,2);
step(closed_loop_PI);
title('Odpowiedź skokowa dla układu z regulatorem PI');
xlabel('Czas [s]');
ylabel('Odpowiedź');

% Analiza stabilności
figure;
margin(open_loop_P);
title('Marginesy stabilności dla regulatora P');

figure;
margin(open_loop_PI);
title('Marginesy stabilności dla regulatora PI');

% Sprawdzanie stabilności dla różnych wartości Kp i Ki
Kp_values = [0.5, 2];
Ki_values = [0.5, 2];

for Kp = Kp_values
    for Ki = Ki_values
        % Regulator PI
        G_PI = tf([Kp Ki], [1 0]);
        % Układ otwarty
        open_loop_PI = series(G_PI, G2);
        % Układ zamknięty
        closed_loop_PI = feedback(open_loop_PI, 1);

        % Sprawdzenie stabilności
        [Gm, Pm, Wcg, Wcp] = margin(open_loop_PI);
        fprintf('Dla Kp = %.2f i Ki = %.2f:\n', Kp, Ki);
        fprintf('Margines amplitudy: %.2f dB\n', 20*log10(Gm));
        fprintf('Margines fazy: %.2f stopni\n', Pm);
        fprintf('Częstotliwość przecięcia fazowego: %.2f rad/s\n', Wcp);
        fprintf('Częstotliwość przecięcia amplitudowego: %.2f rad/s\n\n', Wcg);

        figure;
        step(closed_loop_PI);
        title(sprintf('Odpowiedź skokowa dla układu z regulatorem PI (Kp = %.2f, Ki = %.2f)', Kp, Ki));
        xlabel('Czas [s]');
        ylabel('Odpowiedź');
    end
end
