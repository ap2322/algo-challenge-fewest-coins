require 'minitest/autorun'
require './functions_only_fewest_coins.rb'

class FunctionsTest < Minitest::Test

  def test_it_makes_subarray_with_all_unique_characters
    # collection = Coins.new('aba')
    substring_array = make_substring(['a', 'b', 'a'], ['a', 'b'])

    assert_equal(['a', 'b'], substring_array)

    coins = 'aaabbbcccaabbb'
    substring_array = make_substring(coins.split(//), ["a", "b", "c"])

    assert_equal(['a', 'b', 'b', 'b', 'c'], substring_array)
  end

  def test_it_makes_all_subarrays
    expected_hash = {'ab'=> 2, 'ba' => 2}

    assert_equal(expected_hash, make_all_subarrays(['a', 'b', 'a'], 'aba'))

    coins = 'aaabbbcccaabbb'
    coins_array = coins.split(//)
    expected_hash = {'abbbc'=> 5, 'bccca' => 5, 'caab'=>4}

    assert_equal(expected_hash, make_all_subarrays(coins_array, coins))
  end

  def test_it_finds_the_fewest_coins
    coins1 = 'aba'

    assert_equal(2, fewestCoins(coins1))

    coins2 = 'aaabbbcccaabbb'
    assert_equal(4, fewestCoins(coins2))

    input003txt = File.read("./input003_substring.txt")
    assert_equal(42, fewestCoins(input003txt))

    input004txt = File.read("./input004_substring.txt")
    assert_equal(41, fewestCoins(input004txt))
  end

end
