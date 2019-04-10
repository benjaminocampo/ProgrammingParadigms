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
