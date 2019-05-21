module BrainFuck

    class Interpreter
        attr_accessor :machine

        def initialize(filename:)
            tokenizer = BrainFuck::Tokenizer.new(filename: filename)
            program = BrainFuck::Program.new(tokenizer: tokenizer)
            self.machine = BrainFuck::Machine.new(program: program)
        end

        def run
            machine.run
        end
    end
end