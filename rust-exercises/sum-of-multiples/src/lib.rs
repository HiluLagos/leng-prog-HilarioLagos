fn is_div(n: u32, factors: &[u32]) -> bool {
    factors.iter().any(|&f| n%f == 0)
}


pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).filter(|&n| is_div(n, factors)).sum()
}
