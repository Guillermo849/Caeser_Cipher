# Program that will cipher a String that the user will pass to it.

class Caesar
    @@alphabet = Array ('a'..'z')

    def initialize(text, num)
        @text = text
        @num = num
        cipher
    end

    # Method that ciphers the text that we give it
    private def cipher
        # It will check if there is text to cipher and if there is a valid number to change the letters
        if @text != nil && @num != 0

            new_text = ""
            text_split = @text.split

            text_split.each do |word|
            new_word = ""
            word_letters = word.split('')
            
            word_letters.each do |letter|
                new_letter_index = @@alphabet.find_index(letter).to_i+@num

                # Checks if the character is withing the alphabet list, if not, it will just write it in the new word
                unless @@alphabet.find_index(letter) == nil

                # Checks if the index number is within the length of the alphabet, if it's not it will start form the start of the alphabet
                if new_letter_index > @@alphabet.length-1
                    new_letter_index = new_letter_index-@@alphabet.length
                end

                new_word += @@alphabet[new_letter_index]
                else
                new_word += letter
                end
            end
            # Adds the new word to the new text
            new_text += new_word + " "
            end

            puts new_text
        else
            return "The text given is null and/or the number given is 0."
        end
    end
end 

text_positive_number = Caesar.new("hey there", 3)
text_negative_number = Caesar.new("hey there", -3)