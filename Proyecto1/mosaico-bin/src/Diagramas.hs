module
  Diagramas
  ( rectánguloImagen
  , Orientación(Horizontal, Vertical)
  , dividir
  , caminar
  , sustituir
  )
  where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo), Rectángulo(Rectángulo, color, imagen))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos))

import Imagen (colorPromedio, hSplit, vSplit)



rectánguloImagen :: Imagen -> Rectángulo
rectánguloImagen imag = Rectángulo {color = colorPromedio imag, imagen= imag}

data Orientación
  = Horizontal
  | Vertical
  deriving Show

dividir :: Orientación -> Rectángulo -> Maybe Diagrama
dividir 
  orientacion 
  rectángulo 
  = case esValida orientacion (anchura ima) (altura ima) of
                  False -> Nothing 
                  True  -> case orientacion of 
                    Horizontal -> Just (Hoja (rectánguloImagen arriba) :-: Hoja (rectánguloImagen abajo))
                    Vertical -> Just (Hoja (rectánguloImagen izquierda) :|: Hoja (rectánguloImagen derecha))
          where
            esValida Horizontal _ 1 = False
            esValida Vertical 1 _   = False
            esValida _ _ _          = True
            (arriba, abajo) = hSplit ima
            (izquierda, derecha) = vSplit ima
            ima = (imagen rectángulo)

caminar :: [Paso] -> Diagrama -> Maybe Diagrama
caminar []     diagrama             = Just diagrama
caminar _ (Hoja _)               = Nothing
caminar (x:xs) (primero :-: segundo)  = case x of
                                          Primero -> caminar xs primero
                                          Segundo -> caminar xs segundo

caminar (x:xs) (primero :|: segundo)  = case x of
                                          Primero -> caminar xs primero
                                          Segundo -> caminar xs segundo


sustituir :: Diagrama -> [Paso] -> Diagrama -> Diagrama
sustituir d   []   _          = d
sustituir _    _    (Hoja r)  = Hoja r
sustituir d  (x:xs) (primero :-: segundo) = case x of
                                            Primero -> (sustituir d xs primero) :-: segundo
                                            Segundo -> primero :-: (sustituir d xs segundo)
sustituir d (x:xs) (primero :|: segundo) = case x of
                                            Primero -> (sustituir d xs primero) :|: segundo
                                            Segundo -> primero :|: (sustituir d xs segundo)