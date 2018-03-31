dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings_word(word, dictionary)
  res = Hash.new(0)
  for defn in dictionary
    if not word.scan(/#{Regexp.quote(defn)}/).empty?
      res[defn] += 1
    end
  end
  return res
end

def substrings(text, d)
  words = text.split(" ")
  words.map {|word| word.chop if word.match(/\W/)} #chop punctuation
  return {} if words.empty?
  return substrings_word(words[0], d).merge(substrings(words.drop(1).join(" "), d)) {|key, oldval, newval| newval + oldval}
  #merge block so that overlapping Hash keys add values together
end




puts substrings_word("going", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
