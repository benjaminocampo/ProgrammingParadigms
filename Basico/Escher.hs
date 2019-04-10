module Basico.Escher where
import Dibujo
import Interp
import Graphics.Gloss.Data.Picture

type Escher = Integer

blanko = Basica 0
interBas 0 = simple blank
interBas 1 = trian1
interBas 2 = fShape
interBas 3 = trian2

ejemplo = dibujo_u (Basica 2)

fish2 p = Espejar (Rot45 p)
fish3 p = r270 (fish2 p)

-- Dibujo u
dibujo_u :: Dibujo Escher -> Dibujo Escher
dibujo_u p = (^^^) ((^^^) (fish2 p) (Rotar (fish2 p))) 
            ((^^^) (r180 (fish2 p)) (r270 (fish2 p)))

-- Dibujo t
dibujo_t :: Dibujo Escher -> Dibujo Escher
dibujo_t p = (^^^) p ((^^^) (fish2 p) (fish3 p))

-- dibujo v
dibujo_v p = ciclar (Rotar (dibujo_t p))

-- esquina con nivel de detalle en base a la figura p
esquina :: Int -> Dibujo Escher -> Dibujo Escher
esquina 0 p = blanko
esquina n p = cuarteto (esquina (n-1) p) (lado (n-1) p) (Rotar (lado (n-1) p)) (dibujo_u p) 

-- lado con nivel de detalle en base a la figura p
lado :: Int -> Dibujo Escher -> Dibujo Escher
lado 0 p = blanko
lado n p = cuarteto (lado (n - 1) p) (lado (n - 1) p) (Rotar (dibujo_t p)) (dibujo_t p)

-- combinador de nueve figuras dentro de un espacio de dibujo
noneto p q r s t u v w x = Apilar 2 1 (Juntar 2 1 p (Juntar 1 1 q r)) 
                            (Apilar 1 1 (Juntar 2 1 s (Juntar 1 1 t u)) (Juntar 2 1 v (Juntar 1 1 w x))) 
