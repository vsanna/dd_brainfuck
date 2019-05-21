require "bundler"
Bundler.require

require_relative './brainfuck'

filename = ARGV[0]

interpreter = BrainFuck::Interpreter.new(filename: filename)

interpreter.run