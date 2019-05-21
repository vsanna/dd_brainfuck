require "bundler"
Bundler.require


# 順番だいじ
require_relative './brainfuck/token'
require_relative './brainfuck/tokenizer'
require_relative './brainfuck/program'
require_relative './brainfuck/machine'
require_relative './brainfuck/interpreter'

# activesupportではないautoloadではpathが結局必要
# module BrainFuck
#     autoload :Token
#     autoload :Tokenizer
# end