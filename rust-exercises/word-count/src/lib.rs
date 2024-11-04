use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
  let words: Vec<&str> = phrase.split_whitespace().collect();
  let mut ocurrance_map: HashMap<String, u32> = HashMap::new();
  for word in words {
    let lower_word = word.to_lowercase();
    if let Some(&count) = ocurrance_map.get(&lower_word) {
      ocurrance_map.insert(lower_word, count + 1);
    } else {
      ocurrance_map.insert(lower_word, 1);
    }
  }
  ocurrance_map
}