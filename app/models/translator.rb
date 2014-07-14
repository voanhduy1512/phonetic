class Translator
  def translate(text)
    result = text.clone

    words(text).each do |word|
      if word.present?
        result[word] = get_replace(word)
      end
    end
    result
  end

  def words(text)
    text.split(/[^\w\-\.\'']/)
  end

  def get_replace(word)
    start = word.match(/^[\'\"]/)
    finish = word.match(/[\.\,\;\'\"]$/)
    temp = word

    if start
      temp = temp[1,-1]
    end

    if finish
      temp = temp[0,-2]
    end

    new_text = Word.where(:text => word.upcase).first
    word = new_text ? new_text.phonetic : word

    if start
      word = "#{start}#{word}"
    end

    if finish
      word = "#{word}#{finish}"
    end

    word
  end
end
