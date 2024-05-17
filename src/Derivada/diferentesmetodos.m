function dy = calcularDerivadaMejorada()
    % Esta función mejorada calcula la derivada de funciones, incluyendo trigonométricas,
    % constantes, y simplifica el resultado.
    
    syms x;
    correcto = false;
    
    while ~correcto
        try
            % Solicitar al usuario que ingrese la función
            f_usuario = input('Ingresa la función f(x): ', 's');
            
            % Validar que la entrada no esté vacía y contenga variables simbólicas
            if isempty(f_usuario) || isempty(symvar(f_usuario))
                error('MATLAB:script:InputInvalidOrEmpty', 'La función ingresada es inválida o no contiene variables.');
            end
            
            f_simbolica = str2sym(f_usuario);
            
            % Calcular la derivada
            dy = diff(f_simbolica, x);
            
            % Simplificar la derivada
            dy_simplificada = simplify(dy);
            
            % Cambiar el formato de visualización a 'rat' para mostrar resultados como fracciones
            format rat;
            
            % Mostrar la derivada simplificada al usuario
            fprintf('La derivada simplificada de f(x) = %s es: %s\n', f_usuario, char(dy_simplificada));
            
            % Restaurar el formato de visualización a 'short'
            format short;
            
            correcto = true;
            
        catch ME
            % Manejar errores de entrada y mostrar mensaje adecuado al usuario
            switch ME.identifier
                case 'MATLAB:UndefinedFunction'
                    fprintf('Error: La función ingresada contiene operaciones o funciones no reconocidas.\n');
                case 'MATLAB:script:Str2SymConversionFailed'
                    fprintf('Error: No se pudo convertir la entrada a una expresión simbólica.\n');
                case 'MATLAB:script:InputInvalidOrEmpty'
                    fprintf('Error: La función ingresada es inválida o no contiene variables.\n');
                otherwise
                    fprintf('Error desconocido. Por favor, intenta de nuevo.\n');
            end
        end
    end
end
