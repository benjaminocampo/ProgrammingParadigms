module Dibujo where

data Fig bas = Basica bas | Rotar (Fig bas) | Espejar (Fig bas) | Rot45 (Fig bas)
     | Apilar Int Int (Fig bas) (Fig bas)
     | Juntar Int Int (Fig bas) (Fig bas)
     | Encimar (Fig bas) (Fig bas)
    deriving (Show, Eq)

-- definir el lenguaje
type Dibujo a = Fig a

-- composición n-veces de una función con sí misma.
comp :: (a -> a) -> Int -> a -> a
comp f 0 = id
comp f n = f . (comp f (n-1))


-- rotaciones de múltiplos de 90
r180 :: Dibujo a -> Dibujo a
r180 = Rotar . Rotar

r270 :: Dibujo a -> Dibujo a
r270 = Rotar . Rotar . Rotar

-- Pone una figura sobre la otra, ambas ocupan el mismo espacio
(.-.) :: Dibujo a -> Dibujo a -> Dibujo a
(.-.) x y = Apilar 1 1 x y
