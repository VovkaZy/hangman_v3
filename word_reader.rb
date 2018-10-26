# Class WordReader is for checking if file with game words exist
# If yes, it's read all words from this file with UTF-8 encoding
# Then select a random word to play with from this file
#
# Created by v.n.zubarev@gmail.com on 10/10/18
class WordReader
  def read_from_file(file_name)
    if File.exist?(file_name)
      f = File.new(file_name, 'r:UTF-8')
      lines = f.readlines
      f.close
      lines.sample.chomp.downcase
    else
      nil
    end
  end
end
