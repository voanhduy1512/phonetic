class Word < ActiveRecord::Base
  def self.new_word(word, word_phonetics)

    record = Word.new
    record.text = word
    arr = Array.new
    word_phonetics.each do |p|
      arr << to_phonetic(p)
    end
    record.phonetic = arr.join
    record.save
  end

  private
  def self.to_phonetic(p)
    if is_phonetic p
      return PHONETICS[p]
    end
    stress = p.last.match(/\d$/)
    if stress
      d = p[0..-2]
      if is_phonetic d
        # if stress.to_s == '1'
        #   data = "ˈ#{PHONETICS[d]}"
        # elsif stress.to_s == '2'
        #   data = "ˌ#{PHONETICS[d]}"
        # else
          data = "#{PHONETICS[d]}"
        # end
        return data
      end
    end
    return ''
  end

  def self.is_phonetic(text)
    PHONETICS.keys.include?(text)
  end
end
