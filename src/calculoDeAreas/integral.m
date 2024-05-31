% Solicitar al usuario que ingrese las funciones
funcion1 = input('Ingresa la primera función en términos de x: ', 's');
f = str2sym(funcion1);
funcion2 = input('Ingresa la segunda función en términos de x: ', 's');
g = str2sym(funcion2);

% Solicitar al usuario que ingrese los límites de integración
a = sym(input('Ingresa el límite inferior de integración: '));
b = sym(input('Ingresa el límite superior de integración: '));

% Calcular el área entre las curvas
area = abs(int(f - g, a, b));

% Mostrar el área entre las curvas
disp(['El área entre las curvas es: ', char(area)])

% Crear la gráfica
fplot(f, [double(a) double(b)], 'LineWidth', 2)
hold on
fplot(g, [double(a) double(b)], 'LineWidth', 2)
xlabel('x')
ylabel('y')
title('Gráfica de las funciones y el área entre ellas')
legend('f(x)', 'g(x)', 'Location', 'best')
grid on
hold off
