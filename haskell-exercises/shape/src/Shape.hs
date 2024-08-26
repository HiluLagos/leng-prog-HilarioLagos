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
base (Rectangle (Point x1 _) (Point x2 _)) = x2 - x1

height::Rectangle -> Double
height (Rectangle (Point _ y1) (Point _ y2)) = y2 - y1

-- Circle from radius
circle::Double -> Circle
circle r = Circle origin r

-- Clase Shift

class Shift a where
   shift::a -> (Double, Double) -> a
   
instance Shift Point where
   shift (Point x1 y1) (x2, y2) = point (x2+x1, y2+y1)
   
instance Shift Rectangle where
   shift (Rectangle (Point x1 y1) (Point x2 y2)) (px, py) = Rectangle (point (x1 + px, y1 + py)) (point (x2 + px, y2 + py))
   
instance Shift Circle where
   shift  (Circle (Point x y) r) (px, py) = Circle (point (x+px, y+py)) r
   
-- Define the Surface class
   
-- Define the Surface class
class Surface a where
   surface::a -> Double

instance Surface Rectangle where
   surface rect = base rect * height rect

instance Surface Circle where
   surface (Circle _ r) = pi * r * r
