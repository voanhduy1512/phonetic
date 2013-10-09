class Translator
  def translate(text)
    i = 0
    result = text.clone
    while i < text.length do
      e, word = find_next_word(text, i)
      if word.present?
        puts i, word
        i = e + 1
        result[word] = get_replace(word)
      else
        i+=1
      end
    end
    result
  end

  def find_next_word(text, i)
    s = i
    while char?(text[i]) do
      i+=1
    end
    e=i
    return e, s <= e ? text[s..e-1] : ''
  end

  def char?(c)

    c =~ /[\w\-\.\'']/
  end

  def get_replace(word)
    daudau  = word.match(/^[\'\"]/)
    daucuoi = word.match(/[\.\,\;\'\"]$/)
    temp = word
    if daudau
      temp = temp[1,-1]
    end
    if daucuoi
      temp = temp[0,-2]
    end
    new_text = Word.where(:text => word.upcase).first

    word = new_text ? new_text.phonetic : word
    if daudau
      word = daudau.to_s + word
    end
    if daucuoi
      word = word+daucuoi.to_s
    end
    word
  end
end
