function dy = calcularDerivadaMejorada()
    % Esta función mejorada calcula la derivada de funciones que pueden contener
    % constantes, potencias, funciones trigonométricas y raíces, además de simplificar el resultado.
    
    syms x;
    correcto = false;
    
    while ~correcto
        try
            % Solicitar al usuario que ingrese la función
            f_usuario = input('Ingresa la función f(x) (puedes incluir raíces usando sqrt o nthroot): ', 's');
            
            % Validar que la entrada no esté vacía y sea una expresión válida
            if isempty(f_usuario) || ~isValidExpression(f_usuario)
                error('MATLAB:script:InputInvalidOrEmpty', 'La función ingresada es inválida o está vacía.');
            end
            
            % Convertir la cadena de entrada a una expresión simbólica
            f_simbolica = str2sym(f_usuario);
            
            % Calcular la derivada
            dy = diff(f_simbolica, x);
            
            % Simplificar la derivada utilizando opciones adicionales
            dy_simplificada = simplify(dy, 'Steps', 100, 'Criterion', 'preferReal');
            
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
                    fprintf('Error: La función ingresada es inválida o está vacía.\n');
                otherwise
                    fprintf('Error desconocido. Por favor, intenta de nuevo.\n');
            end
        end
    end
end

function isValid = isValidExpression(expr)
    % Esta función verifica si la expresión ingresada es válida en MATLAB
    try
        % Intentar evaluar la expresión con un valor de prueba
        eval(['syms x; f = ', expr, ';']);
        isValid = true;
    catch
        % Si la evaluación falla, la expresión no es válida
        isValid = false;
    end
end
