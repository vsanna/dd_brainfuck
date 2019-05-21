module BrainFuck
    class Tokenizer
        attr_accessor :filename
        attr_accessor :source
        attr_accessor :current_position

        TOKEN_TABLE = {
            # TODO: refactor namespace
            '>': BrainFuck::Token::MOVE_RIGHT,
            '<': BrainFuck::Token::MOVE_LEFT,
            '+': BrainFuck::Token::INCREMENT,
            '-': BrainFuck::Token::DECREMENT,
            '.': BrainFuck::Token::OUTPUT,
            ',': BrainFuck::Token::INPUT,
            '[': BrainFuck::Token::BRACKET_LEFT,
            ']': BrainFuck::Token::BRACKET_RIGHT,
            # '#': BrainFuck::Token::COMMENT,
            nil => BrainFuck::Token::EOF,
        }

        #
        # @param [String] filename
        #
        def initialize(filename:)
            unless File.exists?(filename)
                raise ArgumentError, "#{filename} doesn't exist"
            end

            self.filename = filename
            self.source = ''
            read_source

            self.current_position = -1
        end

        #
        # @return [Token]
        #
        def next_token
            lookup_token(next_char)
        end

        private

        def read_source
            File.open(filename) do |file|
                self.source = file.read
            end
        end

        #
        # @return [Boolean]
        #
        def next_is_blank?
            ["\s", "\n", "\r", "\t", "\v"].include?(source[current_position + 1])
        end
    
        #
        # @param [String] char
        # @return [Token]
        #
        def lookup_token(char)
            TOKEN_TABLE[char&.to_sym]
        end

        #
        # @return [String]
        # 
        def next_char
            while(next_is_blank?) do
                self.current_position += 1
            end

            self.current_position += 1

            # # remove comment line
            # if lookup_token(source[current_position]) == BrainFuck::Token::COMMENT
            #     while(source[current_position] == "\n") do
            #         self.current_position += 1
            #     end
            #     # TBD: refactor
            #     self.current_position += 1
            # end 

            source[current_position]
        end
    end
end
