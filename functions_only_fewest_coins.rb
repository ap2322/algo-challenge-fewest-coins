require 'pry'
# go through array and push to build_array if unique character hasn't been added yet
# if it's a unique character that is at position 0 of build array, shift the build_array and add replcement
# keep adding characters until all unique characters are accounted for => ends build
# determine length, check against minimum length reset min if shorter

# start with next unique letter

# build array not valid if not all unique letters are in it. Also stop building arrays as soon as incomplete build array is found.

def fewestCoins(coins)
    coins_array = coins.split(//)
    build_arrays = make_all_subarrays(coins_array, coins)
    smallest_observed = build_arrays.min_by {|k,v| v}
    smallest_observed[1]
end

def make_all_subarrays(coins_array, coins)
  smallest_count = coins_array.uniq.length
  all_coins = coins.split(//)
  build_arrays = {}

  while coins_array.length > 0 && coins_array.length >=smallest_count
    # due to alteration of both coins_array and unique_coins in def make_substring,
    # passing all_coins.uniq provides a static value not altered by either function
    build_array = make_substring(coins_array, all_coins.uniq)
    if build_array
      build_arrays[build_array.join] = build_array.length
    end
    coins_array.shift
  end

  build_arrays
end

def make_substring(coins_array, unique_coins)
  build_array = []
  coins_array.each_with_index do |coin, idx|
    if unique_coins.length > 0
      build_array.push(coin)
    end

    if unique_coins.include?(coin)
      unique_coins.delete(coin)
    end

    if idx > 0 && build_array[0] == coin
      build_array.delete_at(0)
    end

    if unique_coins.length == 0
      break
    end
  end

  if unique_coins.length == 0
    return build_array
  end
end



# coins1 = 'asdfkjeghfalawefhaef'
# # 'sdfkjeghfalaw'
# # 'sdfkjeghfalaw'
#
# coins2 = 'bab'
# # 'ba'
# # 'ab'
#
# coins3 = 'aaabbbcccaabbb'
# # 'abbbc' => 5
# # 'bccca' => 5
# # 'caab' = > 4
#
# p fewestCoins(coins1)
# p fewestCoins(coins2)
# p fewestCoins(coins3)
