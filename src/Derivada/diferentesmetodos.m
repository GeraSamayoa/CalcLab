function dy = calcularDerivadaMejorada()
    % Esta función mejorada solicita al usuario que ingrese una función,
    % verifica si la entrada es válida y calcula su derivada.
    
    syms x;
    correcto = false;
    
    while ~correcto
        try
            % Solicitar al usuario que ingrese la función
            f_usuario = input('Ingresa la función f(x): ', 's');
            f_simbolica = str2sym(f_usuario);
            
            % Verificar si la función es válida
            assert(~isempty(symvar(f_simbolica)), 'Error: Debes ingresar una función de x.');
            
            % Calcular la derivada
            dy = diff(f_simbolica, x);
            
            % Mostrar la derivada al usuario
            fprintf('La derivada de f(x) = %s es: %s\n', f_usuario, char(dy));
            correcto = true;
            
        catch ME
            % Manejar errores de entrada y mostrar mensaje adecuado al usuario
            switch ME.identifier
                case 'symbolic:sym:sym:AssumptionsNotMet'
                    fprintf('Error: La entrada no es reconocida como una función matemática válida.\n');
                case 'MATLAB:assertion:failed'
                    fprintf('%s\n', ME.message);
                otherwise
                    fprintf('Error desconocido. Por favor, intenta de nuevo.\n');
            end
        end
    end
end

% Ejemplo de uso:
% Simplemente llama a la función y sigue las instrucciones en la consola
calcularDerivadaMejorada()
