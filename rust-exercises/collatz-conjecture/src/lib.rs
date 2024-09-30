pub fn collatz(mut n: u64) -> Option<u64> {
  collatz_loop(n, 0)
}


pub fn collatz_loop(mut n: u64, s: u64) -> Option<u64> {
  if n <= 0{
    None
  }
  else{
    if n == 1{
      Some(s)
    }
    else if n%2 == 0{
      collatz_loop(n/2, s+1)
    }
    else{
      collatz_loop(3*n+1, s+1)
    }
  }
}