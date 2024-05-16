% Solicita al usuario que ingrese la función
%La función input muestra el texto
funcion_str = input('Ingresa la función a Integrar (por ejemplo: x.^2 + sin(x)): ', 's');

% Convierte la cadena en una expresión simbólica
%La función str2sym convierte en un objeto simbólico 
funcion = str2sym(funcion_str);

% Define la variable simbólica
% Podemos utilizar (x) en expresiones matemáticas y operaciones simbólicas.
syms x;

% Calcula la integral indefinida
% F= guarda la info, int es para la integral indefinida
F = int(funcion, x);

% Muestra la expresión simbólica de la integral
% La función disp se utiliza para mostrar un mensaje de comandos de matlab
% El resultado de la integral indefinida (almacenado en la variable (F)) se convierte en una cadena de caracteres utilizando char(F).
disp(['La integral indefinida es: ', char(F),' + C']);