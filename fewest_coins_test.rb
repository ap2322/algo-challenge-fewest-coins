require 'minitest/autorun'
require './fewest_coins.rb'

class CoinsTest < Minitest::Test

  def test_it_initializes
    collection = Coins.new('teststring')
    assert_instance_of(Coins, collection)
    assert_equal('teststring', collection.coins)
  end

  def test_it_makes_subarray_with_all_unique_characters
    collection = Coins.new('aba')
    substring_array = collection.make_substring(collection.all_coins, collection.all_coins.uniq)

    assert_equal(['a', 'b'], substring_array)

    collection2 = Coins.new('aaabbbcccaabbb')
    substring_array = collection2.make_substring(collection2.all_coins, collection2.all_coins.uniq)

    assert_equal(['a', 'b', 'b', 'b', 'c'], substring_array)
  end

  def test_it_makes_all_subarrays
    collection = Coins.new('aba')
    expected_hash = {'ab'=> 2, 'ba' => 2}

    assert_equal(expected_hash, collection.make_all_subarrays(['a', 'b', 'a']))

    collection2 = Coins.new('aaabbbcccaabbb')
    coins = collection2.coins.split(//)
    expected_hash = {'abbbc'=> 5, 'bccca' => 5, 'caab'=>4}

    assert_equal(expected_hash, collection2.make_all_subarrays(coins))
  end

  def test_it_finds_the_fewest_coins
    collection = Coins.new('aba')

    assert_equal(2, collection.fewestCoins('aba'))

    collection2 = Coins.new('aaabbbcccaabbb')
    assert_equal(4, collection2.fewestCoins('aaabbbcccaabbb'))

    input003txt = File.read("./input003_substring.txt")
    collection3 = Coins.new(input003txt)
    assert_equal(42, collection3.fewestCoins(input003txt))

    input004txt = File.read("./input004_substring.txt")
    collection4 = Coins.new(input004txt)
    assert_equal(41, collection4.fewestCoins(input004txt))
  end

end
