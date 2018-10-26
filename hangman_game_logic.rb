# The main game logic class HangmanGameLogic
# Created by v.n.zubarev@gmail.com on 10/10/18.
class HangmanGameLogic
  attr_reader :letters, :good_letters, :bad_letters, :status, :errors
  # game creation constr., with class fields available from the class methods
  def initialize(word)
    @letters = get_letters(word)
    # error counter
    @errors = 0
    # good and bad letters arrays
    @good_letters = []
    @bad_letters = []
    # status counter
    @status = 0
  end

  # the internal class method for checking the correctness of the entered word
  # and splitting it up into an array of letters, puts the resulting in @letters
  def get_letters(word)
    abort "You didn't type any word" if word.nil? || word == ' '
    word.split('')
  end

  # method that ask user to enter letter from console
  # and calling other method to check the status of a game
  def ask_next_letter
    puts "\n Type next letter, please"
    letter = ' '
    letter = STDIN.gets.encode('UTF-8').chomp.downcase while letter == ' '
    next_step(letter)
  end

  # method checks the status of the game, as well as the presence of
  # the entered letter in the hidden word and in the arrays of
  # already entered good and bad letters, puts the letter into the
  # good array if it is present in the word or in a bad array if not
  def next_step(simbol)
    return if @status == -1 || @status == 1
    return if @good_letters.include?(simbol) || @bad_letters.include?(simbol)
    if @letters.include?(simbol)
      @good_letters << simbol
      @status = 1 if @good_letters.size == @letters.uniq.size
    else
      @bad_letters << simbol
      @errors += 1
      @status = -1 if @errors >= 7
    end
  end
end
