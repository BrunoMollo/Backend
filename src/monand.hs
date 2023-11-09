-- Función para calcular el factorial de un número
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Calculadora de Factorial"
    putStr "Ingresa un número: "
    input <- getLine
    let n = read input :: Integer
    let result = factorial n
    putStrLn ("El factorial de " ++ show n ++ " es " ++ show result)
