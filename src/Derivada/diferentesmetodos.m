% Define la variable simbólica
syms x;

% Pide al usuario que ingrese la función de la que quiere calcular la derivada
funcion_usuario = input('Introduce la función f(x): ', 's');
funcion_usuario = str2sym(funcion_usuario);

% Calcula la derivada de la función
derivada = diff(funcion_usuario, x);

% Simplifica y muestra la derivada
derivada_simplificada = simplify(derivada);
disp(['La derivada de la función es: ', char(derivada_simplificada)]);

% Si el usuario desea evaluar la derivada en un punto específico
punto_evaluacion = input('Si deseas evaluar la derivada en un punto específico, introduce el valor de x (o deja en blanco para omitir): ', 's');
if ~isempty(punto_evaluacion)
    punto_evaluacion = str2double(punto_evaluacion);
    valor_derivada = eval(subs(derivada_simplificada, x, punto_evaluacion));
    disp(['El valor de la derivada en x = ', num2str(punto_evaluacion), ' es: ', num2str(valor_derivada)]);
end
