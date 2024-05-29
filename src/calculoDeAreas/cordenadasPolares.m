% Solicita al usuario ingresar el número de áreas a calcular
num_areas = input('Ingresa el número de áreas a calcular: ');

% Inicializa el área total
area_total = 0;

% Calcula el área para cada función y rango
for i = 1:num_areas
    fprintf('Área %d:\n', i);
    
    % Solicita al usuario ingresar la función f(x)
    prompt = 'Ingresa la función f(x): ';
    funcion = input(prompt, 's');
    f = str2func(['@(x)' funcion]);
    
    % Solicita al usuario ingresar los límites de inicio y fin
    a = input('Ingresa el límite inferior (a): ');
    b = input('Ingresa el límite superior (b): ');
    
    % Número de subintervalos (ajústalo según la precisión deseada)
    n = input('Ingresa el número de subintervalos (n): ');
    
    % Ancho de cada subintervalo
    dx = (b - a) / n;
    
    % Calcula el área bajo la curva para el área actual
    area_actual = 0;
    for j = 0:n-1
        area_actual = area_actual + f(a + j * dx) * dx;
    end
    
    % Muestra el resultado del área actual
    fprintf('El área bajo la curva f(x) = %s en el intervalo [%g, %g] es aproximadamente %g.\n', funcion, a, b, area_actual);
    
    % Grafica la función en el mismo gráfico
    x_vals = linspace(a, b, 1000);
    y_vals = f(x_vals);
    hold on;
    plot(x_vals, y_vals, 'LineWidth', 2);
end

% Configura la leyenda y muestra el área total
xlabel('x');
ylabel('f(x)');
title('Áreas bajo la curva utilizando el Método de Riemann');
legend('Función 1', 'Función 2', 'Función 3'); % Personaliza las etiquetas según tus funciones
hold off;

% Muestra el área total
fprintf('El área total de las %d áreas calculadas es aproximadamente %g.\n', num_areas, area_total);
