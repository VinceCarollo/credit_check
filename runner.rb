require './lib/credit_card'

def start
  input = ''
  until input.scan(/\D/).empty? && input != ''
    p "Please enter credit card number to be verified"
    input = gets.chomp
  end

  card = CreditCard.new(input, 23)

  p card.is_valid? ? "The number #{card.number} is valid!" : "The number #{card.number} is invalid!"

  p "Would you like a checksum for this card?"

  until input == 'y' || input == 'n'
    p "Enter y or n"
    input = gets.chomp.downcase
  end

  if input == 'y'
    p "Check sum on card entered: #{card.check_sum}"
  end
  welcome
end


def welcome
  input = ''
  until input == 'q' || input == 'c'
    p "Welcome to card check! Enter c to check or q to quit."
    input = gets.chomp

    if input == 'c'
      start
    elsif input == 'q'
      exit
    end
  end
end

welcome
