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
        if @text != "" && @num != 0

            new_text = ""
            text_split = @text.split

            text_split.each do |word|
            new_word = ""
            word_letters = word.split('')
            
            word_letters.each do |letter|

                # Checks if the character is withing the alphabet list, if not, it will just write it in the new word
                if @@alphabet_lowercase.find_index(letter) != nil || @@alphabet_uppercase.find_index(letter) != nil
                    # Checks if the letter given is lowercase or uppercase
                    if @@alphabet_lowercase.find_index(letter) != nil
                        new_word += lower_letter(letter)
                    else
                        new_word += uppper_letter(letter)
                    end
                else
                    new_word += letter
                end
            end
            # Adds the new word to the new text
            new_text += new_word + " "
            end

            puts new_text
        else
            puts "The text given is null and/or the number given is 0."
        end
    end

    # Private method that transforms lowercase letters
    private def lower_letter(letter)
        new_letter_index = @@alphabet_lowercase.find_index(letter).to_i+@num
        # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet
        if new_letter_index > @@alphabet_lowercase.length-1
            new_letter_index = new_letter_index-@@alphabet_lowercase.length
        end
        @@alphabet_lowercase[new_letter_index]
    end

    # Private method that transforms uppercase letters
    private def uppper_letter(letter)
        new_letter_index = @@alphabet_uppercase.find_index(letter).to_i+@num
        # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet
        if new_letter_index > @@alphabet_uppercase.length-1
            new_letter_index = new_letter_index-@@alphabet_uppercase.length
        end
        @@alphabet_uppercase[new_letter_index]
    end
end 

# Code tests
text_positive_number = Caesar.new("Hey There", 3).cipher
text_negative_number = Caesar.new("Hey There", -3).cipher
text_not_valid_text = Caesar.new("", 1).cipher
text_not_valid_number = Caesar.new("Hey There", 0).cipher