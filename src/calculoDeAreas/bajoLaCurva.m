% Solicitar al usuario que ingrese la función
funcion = input('Ingresa la función en términos de x: ', 's');
f = str2func(['@(x)' funcion]);

% Solicitar al usuario que ingrese los límites de integración
a = input('Ingresa el límite inferior de integración: ');
b = input('Ingresa el límite superior de integración: ');

% Definir el rango de x
x = a:0.01:b;

% Calcular el valor de y
y = f(x);

% Calcular el área bajo la curva usando la regla del trapecio
area = trapz(x, y);

% Mostrar el área bajo la curva
disp(['El área bajo la curva es: ', num2str(area)])

% Crear la gráfica
figure
plot(x, y, 'LineWidth', 2)
xlabel('x')
ylabel('y')
title('Gráfica de la función y su área bajo la curva')
grid on
