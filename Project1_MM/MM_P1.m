clear vars;
h = 0.1;

% wyznaczenie odpowiedzi na poszczególne zadania
[y1_1, y2_1] = zadanie1(h);
[y1_2a, y2_2a] = zadanie2a();
[y1_2b, y2_2b] = zadanie2b(h);
[y1_2c, y2_2c] = zadanie2c(h);
[y1_2d, y2_2d] = zadanie2d(h);
[err1b, err2b, err1c, err2c, err1d, err2d] = zadanie3(0.01:0.15:1);

% przedstawienie odpowiedzi na poszczególne zadania w formie wykresów
figure
subplot(2, 3, 1)
hold on
title("Zadanie 1")
xlabel("Czas")
ylabel("y(t)")
plot(0:h:8,y1_1)
plot(0:h:8,y2_1)
legend('y1', 'y2')
hold off

subplot(2, 3, 2)
hold on
title("Zadanie 2a")
xlabel("Czas")
ylabel("y(t)")
plot(y1_2a)
plot(y2_2a)
legend('y1', 'y2')
hold off

subplot(2, 3, 3)
hold on
title("Zadanie 2b")
xlabel("Czas")
ylabel("y(t)")
plot(0:h:8,y1_2b)
plot(0:h:8,y2_2b)
legend('y1', 'y2')
hold off

subplot(2, 3, 4)
hold on
title("Zadanie 2c")
xlabel("Czas")
ylabel("y(t)")
plot(0:h:8,y1_2c)
plot(0:h:8,y2_2c)
legend('y1', 'y2')
hold off

subplot(2, 3, 5)
hold on
title("Zadanie 2d")
xlabel("Czas")
ylabel("y(t)")
plot(0:h:8,y1_2d)
plot(0:h:8,y2_2d)
legend('y1', 'y2')
hold off

subplot(2, 3, 6)
hold on
title("Zadanie 3")
loglog(0.01:0.15:1,err1b);
loglog(0.01:0.15:1,err2b);
loglog(0.01:0.15:1,err1c);
loglog(0.01:0.15:1,err2c);
loglog(0.01:0.15:1,err1d);
loglog(0.01:0.15:1,err2d);
legend('err1b', 'err2b', 'err1c', 'err2c', 'err1d', 'err2d')
xlabel("Krok interpolacji")
ylabel("Błąd względny wyniku")
hold off