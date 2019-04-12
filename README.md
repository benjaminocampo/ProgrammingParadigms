# **PART 1: The language**

The language is formed by all valid figures that can be build using the basic constructors, where each constructor has its own specific sintaxis:

    data Fig bas = Basica bas | Rotar (Fig bas) | Espejar (Fig bas) | Rot45 (Fig bas)
         | Apilar Int Int (Fig bas) (Fig bas)
         | Juntar Int Int (Fig bas) (Fig bas)
         | Encimar (Fig bas) (Fig bas)
        deriving (Show, Eq)

Basica: this is the basic figure, 'the atom', it takes as argument something of type 'bas'.
Rotar: rotates a figure, it only takes as argument the figure to rotate.
Espejar: flips a figure, it only takes as argument the figure to flip.
Rot45: rotates a figure by 45 grades, anti-clockwise; it only takes as argument the figure to rotate.
Apilar: it puts a figure above another: it takes two integers, and two figures; where the first integers means the proportion in size of the first figure in regard to the result of both of them, and the second integer is the same for the second figure.
Juntar: it puts one figure beside another: it takes two integers, and two figures; where the first integers means the proportion in size of the first figure in regard to the result of both of them, and the second integer is the same for the second figure.
Encimar: it puts two figures, one over the other. It only takes as arguments these two figures.

In this part, we are not concerned on how these figures are going to be interpretated. We only define its sintaxis and some combinators on figures.

# **PART 2: Geometric interpretation**

After having defined our language and its sintaxis, we are to define its semantics.

The semantic of each constructor is given by a geometric interpretation.

*interp*:
Takes a figure and makes its geometric interpretation. To do this, *interp* parse-matches over all possible figures, i.e those builded using the constructors.
For each possible figure, there's an associated function (a transformation) named by the same name that makes some vector transformations. These associated functions, return the 'picture' of such resulting transformation. 
Now you know how to picture each possible figure. So *interp* takes a figure and applies to it the corresponding transformation, giving as result a 'gloss' picture as its representation.

The transformations are: *rotar*, *rot45*, *espejar*, *encimar*, *juntar* and *apilar*.

For instance, when *interp* sees a figure constructed like *Rotar x* (where x is a figure), it applies the transformation *rotar* to the interpretation of x.

# **PART 3: Uses**

Our goal is to reconstruct the escher graph. The **Escher** graph is the final result of this part, but to get there we had to build other figures.
Those figures are called *dibujo_u*, *dibujo_t* and *dibujo_v*. To build them we used the combinators that we defined in the part1 like *cuarteto* and *ciclar*.
We also define some other new combinators: 
*esquina*: Comprise the top left corner of the picture using *dibujo_u*
*lado*: Comprise the upper side of the picture using *dibujo_t*
In order to build the final picture we need to be able to construct an arrangement of nine tiles, defining so, *noneto*.
Using these constructors (*esquina*, *lado*, and *noneto*) we can build **Escher** rotating each of the nine parts to match with the correct sides and corners.
**Escher** is actually squarelimit to depth 3.

### **Conclusions**

The project was very interesting and very educative. We learned a lot, specially to separate the sintaxis from the semantics, and to think in abstractions. We learned to relate and unify all the layers of the project, that is, sintaxis, interpretation and uses; and to see the final result.















