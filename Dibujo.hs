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


