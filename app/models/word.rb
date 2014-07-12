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
        data = "#{PHONETICS[d]}"
        return data
      end
    end

    ''
  end

  def self.is_phonetic(text)
    PHONETICS.keys.include?(text)
  end
end
