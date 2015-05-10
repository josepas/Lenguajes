module Imagen
  ( hSplit, vSplit
  , colorPromedio
  )
  where

import Graphics.Mosaico.Imagen (Color(Color, rojo, verde, azul), Imagen(Imagen, altura, anchura, datos))



subImagen
  :: Integer -> Integer
  -> Integer -> Integer
  -> Imagen -> Imagen

subImagen 
  xI yI 
  anch alt 
  imagen 
  = Imagen {anchura=anch, altura=alt, 
            datos= (filtrarFilas yI alt . filtrarColumnas xI anch) (datos imagen)}
    where 
      filtrarFilas    ini alto  = take (fromInteger alto) . drop (fromInteger ini) 
      filtrarColumnas ini ancho = map (take (fromInteger ancho) . drop (fromInteger ini))


hSplit :: Imagen -> (Imagen, Imagen)
hSplit imagen = (subImagen 0 0 ancho mitad imagen, 
               subImagen 0 mitad ancho resto imagen)
            where 
              mitad = (altura imagen) `div` 2
              resto = (altura imagen) - mitad
              ancho = (anchura imagen)  

vSplit :: Imagen -> (Imagen, Imagen)
vSplit imagen = (subImagen 0 0 mitad alto imagen, 
               subImagen mitad 0 resto alto imagen)
            where 
              mitad = (anchura imagen) `div` 2
              resto = (anchura imagen) - mitad
              alto  = (altura imagen)  

colorPromedio :: Imagen -> Color
colorPromedio imagen = (promediar 0 0 0 0 . map (promediar 0 0 0 0)) (datos imagen)
                    where
                      promediar n r v a []      = Color {rojo=round (r/n),verde=round (v/n),azul=round (a/n)}
                      promediar n r v a (x:xs)  = promediar (n+1) (r + fromIntegral(rojo x)  :: Double) 
                                                                  (v + fromIntegral(verde x) :: Double) 
                                                                  (a + fromIntegral(azul x)  :: Double) xs 



{- Para testear -}
--ima = Imagen {anchura = 2, altura = 2, 
--                  datos = [[Color { rojo = 1, verde = 1, azul = 1 }, Color { rojo = 2, verde = 2, azul = 2 }]
--                          ,[Color { rojo = 3, verde = 3, azul = 3 }, Color { rojo = 4, verde = 4, azul = 4 }]]}

--(arriba,abajo) = hSplit ima
--(izq,der) = vSplit ima

--ima2 = Imagen { anchura = 4, altura = 1, 
--  datos= [ [ Color { rojo = 14, verde = 35, azul = 250 }
--          , Color { rojo = 75, verde = 25, azul = 0 }
--          , Color { rojo = 120, verde = 0, azul = 250 }
--          , Color { rojo = 0, verde = 3, azul = 100 }]]}