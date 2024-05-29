% Solicita los límites inferior y superior
x_min = input('Ingresa el límite inferior (x_min): ');
x_max = input('Ingresa el límite superior (x_max): ');

% Solicita la función f(x) como una cadena
funcion_str = input('Ingresa la función f(x) = ', 's');

% Convierte la cadena a una función anónima
fun = str2func(['@(x) ', funcion_str]);

% Evalúa la integral definida
q = integral(fun, x_min, x_max);

% Muestra el resultado en diferentes formas
resultado_fraccion = rat(q);
resultado_logaritmo = log(q);

fprintf('\n El valor de la integral desde %.2f hasta %.2f es:\n', x_min, x_max);
fprintf('Como fracción: %s\n', resultado_fraccion);
fprintf('En forma decimal: %.4f\n', q);
fprintf('Logaritmo natural del resultado: %.4f\n', resultado_logaritmo);