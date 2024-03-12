# Program that will cipher a String that the user will pass to it.

class Caesar
    ALPHABET_LOWERCASE = Array ('a'..'z')
    ALPHABET_UPPERCASE = Array ('A'..'Z')

    def initialize(text, num)
        @text = text
        @num = num
    end

    # Method that ciphers the text that we give it
    def cipher
        # It will check if there is text to cipher and if there is a valid number to change the letters
        return puts "The text given is null and/or the number given is 0." if text == "" || num.zero?
        new_text = ""
        text_split = text.split('')

        text_split.each do |letter|
            # Checks if the character is withing the alphabet list, if not, it will just write it in the new word
            if ALPHABET_LOWERCASE.include?(letter) || ALPHABET_UPPERCASE.include?(letter)
                # Checks if the letter given is lowercase or uppercase
                new_text += ALPHABET_LOWERCASE.include?(letter).nil? ? uppper_letter(letter) : lower_letter(letter)
                next
            end
            new_text += letter
        end
        puts new_text
    end

    private

    attr_reader :text, :num
    # Private method that transforms lowercase letters
    def lower_letter(letter)
        new_letter_index = ALPHABET_LOWERCASE.find_index(letter).to_i+num
        # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet
        if new_letter_index > ALPHABET_LOWERCASE.length-1
            new_letter_index = new_letter_index-ALPHABET_LOWERCASE.length
        end
        ALPHABET_LOWERCASE[new_letter_index]
    end

    # Private method that transforms uppercase letters
    def uppper_letter(letter)
        new_letter_index = ALPHABET_UPPERCASE.find_index(letter).to_i+num
        # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet
        if new_letter_index > ALPHABET_UPPERCASE.length-1
            new_letter_index = new_letter_index-ALPHABET_UPPERCASE.length
        end
        ALPHABET_UPPERCASE[new_letter_index]
    end
end 

# Code tests
text_positive_number = Caesar.new("Hey There", 3).cipher
text_negative_number = Caesar.new("Hey There", -3).cipher
text_not_valid_text = Caesar.new("", 1).cipher
text_not_valid_number = Caesar.new("Hey There", 0).cipher