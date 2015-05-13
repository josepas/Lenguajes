module Main (main) where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos), leerImagen)
import Graphics.Mosaico.Ventana  (Ventana, cerrar, crearVentana, leerTecla, mostrar)

import Diagramas (Orientación(Horizontal, Vertical), caminar, dividir, rectánguloImagen, sustituir)


ciclo :: Ventana -> Diagrama -> [Paso] -> IO ()
ciclo ventana 
    diagrama pasos 
    = do
        mostrar ventana pasos diagrama
        tecla <- leerTecla ventana
        case tecla of
            Nothing -> putStrLn "Ventana cerrada"
            
            Just "q" -> cerrar ventana

            Just "BackSpace" -> case pasos of 
                [] -> continuar
                _ -> ciclo ventana diagrama (init pasos)

            Just "Up" -> case actual of
                Nothing -> do
                    putStrLn "Los pasos especifican un diagrama que no existe."
                    cerrar ventana
                Just (Hoja rectangulo) -> case divididoH rectangulo of
                    Nothing -> continuar
                    Just d -> ciclo ventana (sustituir d pasos diagrama) (pasos ++ [Primero])
                Just (_ :-: _) -> ciclo ventana diagrama (pasos ++ [Primero])
                Just (_ :|: _) -> continuar

            Just "Down" -> case actual of
                Nothing -> do
                    putStrLn "Los pasos especifican un diagrama que no existe."
                    cerrar ventana
                Just (Hoja rectangulo) -> case divididoH rectangulo of
                    Nothing -> continuar
                    Just d -> ciclo ventana (sustituir d pasos diagrama) (pasos ++ [Segundo])
                Just (_ :-: _) -> ciclo ventana diagrama (pasos ++ [Segundo])
                Just (_ :|: _) -> continuar

            Just "Left" -> case actual of
                Nothing -> do
                    putStrLn "Los pasos especifican un diagrama que no existe."
                    cerrar ventana
                Just (Hoja rectangulo) -> case divididoV rectangulo of
                    Nothing -> continuar
                    Just d -> ciclo ventana (sustituir d pasos diagrama) (pasos ++ [Primero])
                Just (_ :|: _) -> ciclo ventana diagrama (pasos ++ [Primero])
                Just (_ :-: _) -> continuar
            
            Just "Right" -> case actual of
                Nothing -> do
                    putStrLn "Los pasos especifican un diagrama que no existe."
                    cerrar ventana
                Just (Hoja rectangulo) -> case divididoV rectangulo of
                    Nothing -> continuar
                    Just d -> ciclo ventana (sustituir d pasos diagrama) (pasos ++ [Segundo])
                Just (_ :|: _) -> ciclo ventana diagrama (pasos ++ [Segundo])
                Just (_ :-: _) -> continuar

            Just _ -> continuar
    where 
        divididoH = dividir Horizontal
        divididoV = dividir Vertical
        actual = caminar pasos diagrama
        continuar = ciclo ventana diagrama pasos




main :: IO ()
main = undefined

