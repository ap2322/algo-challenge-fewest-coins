# Algorithm Challenge: Fewest Coins
Given a string of characters, where each character represents a coin, find the length of the shortest substring that includes all of the distinct characters in the full string.

### Example 1:
```
coins1 = 'aba'
```
- Expect `fewestCoins(coins1)` to equal 2
- Substrings containing all unique coins: `ab` and `ba`
- Shortest length: 2


### Example 2:
```
coins2 = 'aaabbbcccaabbb'
```
- Expect `fewestCoins(coins2)` to equal 4
- Substrings containing all unique coins:
```
'abbbc' => 5
'bccca' => 5
'caab' = > 4
```
- Shortest length: 4

## Using this repository

`git clone` this repository and then run `bundle install` (requires [Bundler](https://bundler.io/)) to install minitest and pry. To check the tests are running correctly, run the following: 
- `ruby fewest_coins_test.rb` 
- `ruby functions_only_fewest_coins_test.rb`

Modify tests or files as desired. To dig into the code, insert `binding.pry` to stop the file execution of `ruby fewest_coins.rb` or `ruby functions_only_fewest_coins.rb`. 

## Technology Used
- [Ruby](https://ruby-doc.org/) v2.4.1
- [Minitest](https://github.com/seattlerb/minitest) v5.14.0
- [Pry](https://github.com/pry/pry) v0.13.1


## Solution

This repository has 2 primary solutions: One as a class and one with standalone functions. The class was created as a way to instantiate and test helper functions. The `functions_only_fewest_coins.rb` file allows for running the function without instatiating a `Coins` object.

Start with the `make_substring` function: Given an array of coins `coins_array` and it's unique coins array `unique_coins`, it returns an array of a substring that includes all unique coins. Looping through the `coins_array` it adds a coin to the `build_array` if not all unique coins have been added yet. It then removes the unique coin from the `unique_coins` array to keep track of which unique coins have been added. If the first coin on the `build_array` is the same as the coin just added to the end, it deletes the first coin. When all unique coins have been added to the `build_array` the iteration through `coins_array` stops. The `make_substring` function returns either the `build_array` if all unique coins have been added or `nil` if there are still coins left in `unique_coins`.

This `make_substring` function is then used in the `make_all_subarrays` function to find all possible substrings and their lengths. Within the while loop, all `build_arrays` are made for the `coins_array` and stored as joined strings with their lengths in the `build_arrays` hash. A tricky bit here is that instead of passing an array into `make_substring(coins_array, all_coins.uniq)` a separate array with the `.uniq` function is called in order to prevent `make_substring` from altering the unique collection of coins. 

The resulting hash from `make_all_subarrays` is then evaluated in `def fewestCoins(coins)` to find the minimum value in the hash and return it. This is the length of the smallest substring in the given string `coins` that includes all unique characters found in `coins`.
