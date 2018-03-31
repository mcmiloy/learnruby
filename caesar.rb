

caesar_char = lambda do |a_char, shift_int|
  if not a_char.scan(/[a-z]/).empty?
    (97 + (a_char.ord + shift_int - 19)%26).chr
  elsif not a_char.scan(/[A-Z]/).empty?
    (65 + (a_char.ord + shift_int - 13)%26).chr
  else
    a_char
  end
end

def caesar(a_str, shift_int, fn)
  (0...(a_str.length)).each do |i|
    a_str[i] = fn.call(a_str[i], shift_int)
  end
  return a_str
end

puts caesar("Hello, World!", 3, caesar_char)
puts caesar(caesar("Hello, World!", 3, caesar_char), -3, caesar_char)
puts caesar("What a string!", 5, caesar_char)
puts caesar("IBM", -1, caesar_char)
