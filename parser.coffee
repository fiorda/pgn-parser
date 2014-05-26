class Move
  constructor: (@move, comment)->
    if comment?
      @comment = comment


parse = (gamestring) ->
  gamestring = gamestring.replace(/(\r\n|\n|\r)/gm," ")
  parsed = {}
  info  = /\[(\w+) "([^\"]*)"\]/g
  moves = /\d+\. *((?:\w|-|=)+)[\+#!?]? *(?:\{([^\}]+)\})? ((?:\w|-|=)+)[\+#!?]? *(?:\{([^\}]+)\})?/g

  while (result = info.exec(gamestring))
      parsed[result[1]] = result[2]

  parsed.FEN ?= "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

  parsed.moves = []

  while (result = moves.exec(gamestring))
      move1 = new Move result[1], result[2]
      move2 = new Move result[3], result[4]
      parsed.moves.push move1
      parsed.moves.push move2
  
  x =parsed.moves[parsed.moves.length - 1].move
  if x in ["1-0", "0-1", "1/2-1/2", "*"]
    parsed.moves.pop()

  parsed
