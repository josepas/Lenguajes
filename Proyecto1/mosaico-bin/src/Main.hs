module Main (main) where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos), leerImagen)
import Graphics.Mosaico.Ventana  (Ventana, cerrar, crearVentana, leerTecla, mostrar)

import Diagramas (Orientación(Horizontal, Vertical), caminar, dividir, rectánguloImagen, sustituir)


ciclo :: Ventana -> Diagrama -> [Paso] -> IO ()
ciclo vent (Hoja _) xs

ciclo vent dia@(primero :-: segundo) xs = case leerTecla vent of
										Left 		-> return () 
										Right 		-> return ()
										Up 			-> ciclo vent dia (xs ++ Primero)
										Down 		-> ciclo vent dia (xs ++ Segundo)
										BackSpace	-> ciclo vent PADRE
										q 			-> cerrar vent

ciclo vent (primero :|: segundo) xs	= case leerTecla vent of
										Left 		-> ciclo vent dia (xs ++ Primero) 
										Right 		-> ciclo vent dia (xs ++ Segundo)
										Up 			-> return ()
										Down 		-> return ()
										BackSpace	-> ciclo vent PADRE (init xs)
										q 			-> cerrar vent

ciclo vent dia xs 					= case leerTecla vent of
										Left = 




main :: IO ()
main = undefined

