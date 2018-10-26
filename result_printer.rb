# ResultPrinter is a class that displays the intermediate
# and final result of the game
# Created by v.n.zubarev@gmail.com on 10/10/18.
class ResultPrinter
# class constructor that responsible for the result
# of the graphical part of the game it checks
# if there is a image file corresponding to the
# specific game status reads the file and displays
# the image corresponding to it at the console
  def initialize
    @status_image = []
    current_path = File.dirname(__FILE__)
    counter = 0
    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"
      if File.exist?(file_name)
        f = File.new(file_name)
        @status_image << f.read
        f.close
      else
        @status_image << "\n [File not found] \n"
      end
      counter += 1
    end
  end

  # method that describes the state of the game,
  # displays the word, number of errors,
  # state of the game (loss / win)
  # and the number of remaining attempts
  def print_status(game)
    cls
    puts "\nThe word is: " + get_word_for_print(game.letters, game.good_letters)
    puts "Mistakes (#{game.errors}): #{game.bad_letters.join(', ')}"
    print_viselitsa(game.errors)
    if game.errors >= 7
      puts 'You loose :('
      else
        if game.letters.uniq.size == game.good_letters.size
          puts 'Congrtulations! You win! See you next time!'
          else
            puts 'Attempts left: ' + (7 - game.errors).to_s
        end
    end
  end

  # Method that responsible for displaying the hidden word
  def get_word_for_print(letters, good_letters)
    result = ""
    for letter in letters
      if good_letters.include? letter
        result += letter + " "
        else
          result += "__ "
      end
    end
    result
  end

  # Method that clears the console window every time a new input
  def cls
    system "clear" or system "cls"
  end

  # Method of displaying the graphic part of the game to the console
  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end
