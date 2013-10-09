Word.delete_all
file = File.open(File.join(Rails.root, 'lib', 'data'),'r')
text = file.read
text.each_line do |l|
  line = l.clone
  word = line.match(/^([\w\.\'\-\_'])+/).to_s
  next unless word.present?
  line.slice(word)
  word_phonetics = line.split(' ')
  Word.new_word(word, word_phonetics)
end
file.close()



