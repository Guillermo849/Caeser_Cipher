# Program that will cipher a String that the user will pass to it.

class Caesar
    ALPHABET_UPPERCASE = Array('A'..'Z')
    ALPHABET_LOWERCASE = Array('a'..'z')
    GO_FOWARD_THE_ALPHABET = 1
    GO_BACK_THE_ALPHABET = -1
    START_OF_ALPHABET = 1
    END_OF_ALPHABET = 26

    def initialize(text, num)
        @text = text
        @num = num
    end

    # Method that ciphers the text that we give it
    def cipher
        # It will check if there is text to cipher and if there is a valid number to change the letters
        return puts "The text given is null and/or the number given is 0." if text.strip.empty? || num.zero?

        text_split = text.split('')
        puts refactor_text(text_split)
    end

    private

    attr_reader :text, :num
    
    # Will create a hash for the uppercase letter or the lower case ones
    def fill_alphabet_upper
        return @fill_alphabet_upper if defined? @fill_alphabet_upper
    
        @fill_alphabet_upper = {}
        ALPHABET_UPPERCASE.each_with_index do |key, l|
            @fill_alphabet_upper[key] = l+1
        end
        @fill_alphabet_upper
    end

    def fill_alphabet_lower
        return @fill_alphabet_lower if defined? @fill_alphabet_lower

        @fill_alphabet_lower = {}
        ALPHABET_LOWERCASE.each_with_index do |key, l|
            @fill_alphabet_lower[key] = l+1
        end
        @fill_alphabet_lower
    end

    def refactor_text(text)
        new_text = ""
        text.each do |letter|
            
            # Checks if the character is withing the alphabet list, if not, it will just write it in the new word
            if fill_alphabet_lower.key?(letter) || fill_alphabet_upper.key?(letter)
                # Checks if the letter given is lowercase or uppercase
                new_text += fill_alphabet_upper.key?(letter) ? uppper_letter(letter) : lower_letter(letter)
                next
            end
            new_text += letter
        end
        new_text
    end

    # Private method that transforms lowercase letters
    def lower_letter(letter)
        refactor_letter(fill_alphabet_lower, letter)
    end

    # Private method that transforms uppercase letters
    def uppper_letter(letter)
        refactor_letter(fill_alphabet_upper, letter)
    end

    def refactor_letter(alphabet, letter)
        new_letter_value = alphabet[letter].to_i
        num_change = num.positive? ? GO_FOWARD_THE_ALPHABET : GO_BACK_THE_ALPHABET
        num.abs.times do
            new_letter_value += num_change
            # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet or from the end
            if new_letter_value > END_OF_ALPHABET
                new_letter_value = START_OF_ALPHABET
            end
            if !new_letter_value.positive?
                new_letter_value = END_OF_ALPHABET
            end
        end
        
        alphabet.key(new_letter_value)
    end
end 

# Code tests
text_positive_number = Caesar.new("Hey There", 3).cipher
text_negative_number = Caesar.new("Hey There", -3).cipher
text_not_valid_text = Caesar.new("", 1).cipher
text_not_valid_number = Caesar.new("Hey There", 0).cipher
