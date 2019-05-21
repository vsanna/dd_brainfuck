module BrainFuck 
    class Machine
        attr_accessor :tape
        attr_accessor :pos
        attr_accessor :program
        attr_accessor :output_string

        # @param [Program] program
        def initialize(program: )
            self.tape = []
            self.pos = 0
            self.program = program
            self.output_string = []
        end

        def run
            loop do
                if program.next_token == BrainFuck::Token::EOF
                    break
                end

                execute!
            end

            puts output_string.join
        end

        private

        # envを受け取って処理し、新しいenvを返すイメージ
        def execute!
            
            token = program.current_token
            tape = self.tape.dup
            pos = self.pos
            
            puts "#{token.literal} => current: #{pos} | #{tape.join(" ")}"
            
            case token
            when Token::MOVE_RIGHT
                new_tape = tape
                new_pos = pos + 1
            when Token::MOVE_LEFT
                new_tape = tape
                new_pos = pos - 1
            when Token::INCREMENT
                tape[pos] = (tape[pos] || 0) + 1
                new_tape = tape
                new_pos = pos
            when Token::DECREMENT
                tape[pos] = (tape[pos] || 0) - 1
                new_tape = tape
                new_pos = pos
            when Token::OUTPUT
                output = (tape[pos] || 0).chr
                puts output
                output_string << output
                new_tape = tape
                new_pos = pos
            when Token::INPUT
                input = $stdin.gets.chomp.to_i
                tape[pos] = input
                new_tape = tape
                new_pos = pos
            when Token::BRACKET_LEFT
                if tape[pos] == 0
                    program.skip_to_loop_end
                end
                new_tape = tape
                new_pos = pos 
            when Token::BRACKET_RIGHT
                if tape[pos] != 0
                    program.back_to_loop_beginning
                end
                new_tape = tape
                new_pos = pos 
            when Token::EOF 
                exit
            else
                raise StandardError, "unexpected token. #{token}"
            end

            self.tape = new_tape
            self.pos = new_pos
        end            
    end
end