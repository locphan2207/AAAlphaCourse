# EASY

# Define a method that returns an array of only the even numbers in its argument
# (an array of integers).
def get_evens(arr)
  arr.select {|num| num.even?}
end

# Define a method that returns a new array of all the elements in its argument
# doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  arr.map {|num| num * 2}
end

# Define a method that returns its argument with all the argument's elements
# doubled. This method should modify the original array.
def calculate_doubles!(arr)
  arr.map! {|num| num * 2}
end

# Define a method that returns the sum of each element in its argument
# multiplied by its index. array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) +
# (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  arr1 = arr.map.with_index {|num, index| num * index}
  arr1.reduce(0) {|acc, el| acc + el} #pls initialize acc to 0 by parsing 0 to reduce
end

# MEDIUM

# Given an array of bids and an actual retail price, return the bid closest to
# the actual retail price without going over that price. Assume there is always
# at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)
  arr = bids.select {|num| num < actual_retail_price}
  arr.max
end

# Given an array of numbers, return an array of those numbers that have at least
# n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1,
# 2, 4, 8, 16) and the others have fewer than five factors. Consider writing a
# helper method num_factors
def at_least_n_factors(numbers, n)
  numbers.select {|num| num_factors(num) >= n}
end

def num_factors(number)
  (1..number).count {|num| number % num == 0}
end

# HARD

# Define a method that accepts an array of words and returns an array of those
# words whose vowels appear in order. You may wish to write a helper method:
# ordered_vowel_word?
def ordered_vowel_words(words)
  words.select {|word| ordered_vowel_word?(word)}
end

def ordered_vowel_word?(word)
  vowels = "aeiou".chars
  onlyVow = word.chars.select {|char| vowels.include?(char.downcase) }
  onlyVow.reduce do |acc, el|
    if acc.ord > el.ord
      return false
    else
      acc = el
    end
  end
  true
end

# Given an array of numbers, return an array of all the products remaining when
# each element is removed from the array. You may wish to write a helper method:
# array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where: 12 because you take out 2,
# leaving 3 * 4. 8, because you take out 3, leaving 2 * 4. 6, because you take out
# 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where: 30 because you
# take out 1, leaving 2 * 3 * 5 15, because you take out 2, leaving 1 * 3 * 5
# 10, because you take out 3, leaving 1 * 2 * 5 6, because you take out 5,
# leaving 1 * 2 * 3
def products_except_me(numbers)
  numbers.map.with_index  do |num, index|
    array_product(numbers.reject.with_index {|num, index2| index2 == index})
  end
end

def array_product(array)
  return array if array.length == 1
  array.reduce(:*)
end
