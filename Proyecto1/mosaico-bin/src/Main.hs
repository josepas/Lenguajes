module Main (main) where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos), leerImagen)
import Graphics.Mosaico.Ventana  (Ventana, cerrar, crearVentana, leerTecla, mostrar)

import Diagramas (Orientación(Horizontal, Vertical), caminar, dividir, rectánguloImagen, sustituir)

--define GDK_KEY_KP_Left 0xff96
--define GDK_KEY_KP_Up 0xff97
--define GDK_KEY_KP_Right 0xff98
--define GDK_KEY_KP_Down 0xff99
--define GDK_KEY_q 0x071
-- BackSpace

ciclo :: Ventana -> Diagrama -> [Paso] -> IO ()
ciclo vent = 



main :: IO ()
main = undefined

