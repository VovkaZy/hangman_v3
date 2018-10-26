# Hangman console version of guessing game for two or more players
# ver.: 4.0, reading from file
# wiki: https://en.wikipedia.org/wiki/Hangman_(game)
# Created by v.n.zubarev@gmail.com on 10/10/18
require_relative 'hangman_game_logic.rb'
require_relative 'result_printer.rb'
require_relative 'word_reader.rb'

current_path = File.dirname(__FILE__)

# creating an object that print result of a game in console
printer = ResultPrinter.new

# creating new instance of a WordReader class
# for entering a word in a game from file
word_reader = WordReader.new

# variable with a path to file from which we take a words for game
words_file_name = current_path + '/data/words.txt'

# creating new instance of a HangmanGameLogic class
# pass it a word from file that must be guess
game = HangmanGameLogic.new(word_reader.read_from_file(words_file_name))

# main game loop which will ends game
# when game status will change to 1 (win) or -1 (lose)
while game.status.zero?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
