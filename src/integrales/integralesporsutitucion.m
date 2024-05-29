% Pide al usuario que ingrese la función a integrar
funcion_str = input('Ingresa la función a integrar (en términos de x): ', 's');

% Convierte la cadena de caracteres en una expresión simbólica
funcion = str2sym(funcion_str);

% Define la variable simbólica
syms x;

% Calcula la integral indefinida utilizando el método de sustitución
resultado = int(funcion, x);

% Muestra el resultado con la constante de integración
fprintf('La integral indefinida es: %s + C\n', char(resultado));