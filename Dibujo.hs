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

-- Pone una figura al lado de la otra, ambas ocupan el mismo espacio
(///) :: Dibujo a -> Dibujo a -> Dibujo a
(///) x y = Juntar 1 1 x y

-- Superpone una figura con otra
(^^^) :: Dibujo a -> Dibujo a -> Dibujo a
(^^^) x y = Encimar x y

-- Dada una figura la repite en cuatro cuadrantes
cuarteto :: Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a
cuarteto x y z w = (.-.) ((///) x y) ((///) z w)

-- una figura repetida con las cuatro rotaciones, superimpuestas.
encimar4 :: Dibujo a -> Dibujo a
--encimar4 x = (^^^) (Rot45 (Rot45 (Rot45 x))) ((^^^) (Rot45 (Rot45 x)) ((^^^) (Rot45 x) x))
encimar4 x = (^^^) (erre 3) ((^^^) (erre 2) ((^^^) (erre 1) (erre 0)))
            where erre k = (comp Rot45 k) x

-- cuadrado con la misma figura rotada $i$ por $90$ para $i \in \{1..3\}$.
-- No confundir con encimar4!
ciclar :: Dibujo a -> Dibujo a
ciclar x = cuarteto x (Rotar x) (r180 x) (r270 x) 

-- ver un a como una figura
pureDibe :: a -> Dibujo a
pureDibe a = Basica a
