use std::ops;

#[derive(Debug, PartialEq, Eq)]
pub struct Fraction(pub i32, pub i32);

impl Fraction {
    pub fn add(self, rhs: Self) -> Self {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = rhs;
        simplify(n1 * d2 + n2 * d1, d1 * d2)
    }

    pub fn subtract(self, rhs: Self) -> Self {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = rhs;
        simplify(n1 * d2 - n2 * d1, d1 * d2)
    }

    pub fn multiply(self, rhs: Self) -> Self {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = rhs;
        simplify(n1 * n2, d1 * d2)
    }

    pub fn divide(self, rhs: Self) -> Self {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = rhs;
        simplify(n1 * d2 , d1 * n2)
    }
}

impl ops::Add for Fraction {
    type Output = Fraction;

    fn add(self, rhs: Self) -> Self::Output {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = rhs;
        simplify(n1 * d2 + n2 * d1, d1 * d2)
    }
}

/// Calculate the Highest common factor between 2 numbers
pub fn hcf(a: i32, b: i32) -> i32 {
    if b == 0 { a } else { hcf(b, a % b) }
}

pub fn simplify(n: i32, d: i32) -> Fraction {
    let h = hcf(n, d);
    Fraction(n/h, d/h)
}