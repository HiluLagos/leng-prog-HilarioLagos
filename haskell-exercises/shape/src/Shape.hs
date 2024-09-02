module Shape where

data Point = Point { x::Double, y:: Double} deriving (Eq, Show)

data Circle    = Circle    Point Double deriving (Eq, Show)
data Rectangle = Rectangle Point Point deriving (Eq, Show)

-- A point from a tuple Pair
point::(Double, Double) -> Point
point (x, y) = Point {x=x, y=y}

-- The origin
origin::Point
origin = Point {x= 0.0, y=0.0}

-- Rectangle from a Tuple where (x0 y0) == origin
rectangle::(Double, Double) -> Rectangle
rectangle p = Rectangle origin (point p)

-- Usa el constructor de Point para aclarar que el rectanfulo esta compuesto por estos
base::Rectangle -> Double
base (Rectangle (Point x1 _) (Point x2 _)) = abs (x2 - x1)

height::Rectangle -> Double
height (Rectangle (Point _ y1) (Point _ y2)) = abs (y2 - y1)

-- Circle from radius
circle::Double -> Circle
circle r = Circle origin r

-- Clase Shift
class Shift a where
   shift::a -> (Double, Double) -> a

instance Shift Point where
   shift (Point x y) (dx, dy) = Point (x + dx) (y + dy)

-- Aca puedo reutilizar el shift anterior para no escribir las coordenadas de cada cosa
instance Shift Rectangle where
   shift (Rectangle p1 p2) (dx, dy) = Rectangle (shift p1 (dx, dy)) (shift p2 (dx, dy))

instance Shift Circle where
   shift (Circle p r) (dx, dy) = Circle (shift p (dx, dy)) r

-- Define the Surface class
class Surface a where
   surface::a -> Double

instance Surface Rectangle where
   surface rect = base rect * height rect

instance Surface Circle where
   surface (Circle _ r) = pi * r * r