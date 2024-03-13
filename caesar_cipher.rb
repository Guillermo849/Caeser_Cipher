# Program that will cipher a String that the user will pass to it.

class Caesar
    ALPHABET_UPPERCASE = Array ('A'..'Z')
    ALPHABET_LOWERCASE = Array ('a'..'z')

    def initialize(text, num)
        @text = text
        @num = num
    end

    # Method that ciphers the text that we give it
    def cipher
        # It will check if there is text to cipher and if there is a valid number to change the letters
        return puts "The text given is null and/or the number given is 0." if text == "" || num.zero?
        text_split = text.split('')
        puts refactor_text(text_split)
    end

    private

    attr_reader :text, :num
    
    # Will create a hash for the uppercase letter or the lower case ones
    def fill_alphabet_upper
        return @fill_alphabet_upper if defined? @fill_alphabet_upper
        @fill_alphabet_upper = Hash.new
        ALPHABET_UPPERCASE.each_with_index do |key, l|
            @fill_alphabet_upper[key.to_sym] = l
        end
        @fill_alphabet_upper
    end

    def fill_alphabet_lower
        return @fill_alphabet_lower if defined? @fill_alphabet_lower
        @fill_alphabet_lower = Hash.new
        ALPHABET_LOWERCASE.each_with_index do |key, l|
            @fill_alphabet_lower[key.to_sym] = l
        end
        @fill_alphabet_lower
    end

    def refactor_text(text)
        new_text = ""
        text.each do |letter|
            
            # Checks if the character is withing the alphabet list, if not, it will just write it in the new word
            if fill_alphabet_lower.key?(letter.to_sym) || fill_alphabet_upper.key?(letter.to_sym)
                # Checks if the letter given is lowercase or uppercase
                new_text += fill_alphabet_upper.key?(letter.to_sym) ? uppper_letter(letter.to_sym) : lower_letter(letter.to_sym)
                next
            end
            new_text += letter
        end
        new_text
    end

    # Private method that transforms lowercase letters
    def lower_letter(letter)
        new_letter_value = fill_alphabet_lower[letter].to_i
        num_change = num < 0? -1 : 1
        for v in 1..num.abs do
            new_letter_value += num_change
            # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet or from the end
            if new_letter_value > fill_alphabet_lower.length()-1
                new_letter_value = 0
            end
            if new_letter_value < 0
                new_letter_value = fill_alphabet_lower.length()-1
            end
        end
        return fill_alphabet_lower.key(new_letter_value).to_s
    end

    # Private method that transforms uppercase letters
    def uppper_letter(letter)
        new_letter_value = fill_alphabet_upper[letter].to_i
        num_change = num < 0? -1 : 1
        for v in 1..num.abs do
            new_letter_value += num_change
            # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet or from the end
            if new_letter_value > fill_alphabet_upper.length()-1
                new_letter_value = 0
            end
            if new_letter_value < 0
                new_letter_value = fill_alphabet_upper.length()-1
            end
        end
        return fill_alphabet_upper.key(new_letter_value).to_s
    end
end 

# Code tests
text_positive_number = Caesar.new("Hey There", 3).cipher
text_negative_number = Caesar.new("Heb There", -300).cipher
text_not_valid_text = Caesar.new("", 1).cipher
text_not_valid_number = Caesar.new("Hey There", 0).cipher