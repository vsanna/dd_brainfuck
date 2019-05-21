module BrainFuck 
    Token = Struct.new(:name, :literal)
    Token::MOVE_RIGHT    = Token.new('move_right', '>') 
    Token::MOVE_LEFT     = Token.new('move_left', '<')
    Token::INCREMENT     = Token.new('increment', '+')
    Token::DECREMENT     = Token.new('decrement', '-')
    Token::OUTPUT        = Token.new('output', '.')
    Token::INPUT         = Token.new('input', ',')
    Token::BRACKET_LEFT  = Token.new('bracket_left', '[')
    Token::BRACKET_RIGHT = Token.new('bracket_right', ']')
    # Token::COMMENT       = Token.new('comment', '#')
    Token::EOF           = Token.new('eof', 'nil')
end