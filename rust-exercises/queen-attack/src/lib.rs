#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

fn is_diagonal(q1: &ChessPosition, q2: &ChessPosition) -> bool {
    let ChessPosition(y1, x1) = *q1;
    let ChessPosition(y2, x2) = *q2;
    (y1 - y2).abs() == (x1 - x2).abs()
}

fn is_straight(q1: &ChessPosition, q2: &ChessPosition) -> bool{
    let ChessPosition(y1, x1) = *q1;
    let ChessPosition(y2, x2) = *q2;
        (y1 == y2) || (x1 == x2)
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        if (rank < 8 && rank >= 0) && (file < 8 && file > 0) {
            Some(ChessPosition(rank, file))
        }
        else {
            None
        }
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Queen { position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        let straight: bool = is_straight(&self.position, &other.position);
        let diagonal: bool = is_diagonal(&self.position, &other.position);
        straight || diagonal
    }
}
