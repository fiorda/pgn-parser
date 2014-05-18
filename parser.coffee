
gamestring = "[Event \"70th ch-ITA\"]
[Site \"Siena ITA\"]
[Round \"10\"]
[Date \"2010.12.3\"]
[White \"Caruana, Fabiano\"]
[Black \"Godena, Michele\"]
[Result \"1-0\"]
1.d4 d5 2.c4 dxc4 3.e4 e5 4.Nf3 Bb4+ 5.Nc3 
exd4 6.Nxd4 Ne7 7.Bf4 Bxc3+ 8.bxc3 Ng6 9.Bg3 
Qe7 10.Bxc4 Qxe4+ 11.Qe2 Qxe2+ 12.Bxe2 Na6 
13.Rb1 O-O 14.O-O Re8 15.Rfe1 Nc5 16.Bxc7 Bd7 
17.Bf3 Rxe1+ 18.Rxe1 Rc8 19.Bg3 b6 20.h4 Ne6 
21.h5 Ne7 22.Be5 Nc6 23.Nxc6 Bxc6 24.Bg4 Re8 
25.Bg3 g6 26.h6 f5 27.Bd1 f4 28.Bh4 Kf8 29.Re5 g5 
30.Bh5 Rc8 31.Bxg5 Nxg5 32.Rxg5 Bd7 33.Rg7 Rc5 
34.Bf3 Bf5 35.Rxa7 Rxc3 36.Bd5 Bg6 37.Ra4 Rc1+ 
38.Kh2 Rc5 39.Rxf4+ Ke7 40.Bf3 Ra5 {ciao} 41.Rb4 b5 
42.Bd5 Kf6 43.f4 Bf5 44.Bc6 Bd3 45.Rd4 Ra3 46.Bd5 Bb1 
47.Rd1 Bd3 48.Bb3 Bc4 49.Bc2 Ke7 50.Bf5 Rxa2 
51.Rd7+ Kf8 52.Rxh7 Bd5 53.Rd7 1-0"

parse = (gamestring) ->
  parsed = {}
  info  = /\[(\w+) "([^\"]*)"\]/g
  moves = /\d+\. *((?:\w|-|=)+)[\+#!?]* *(?:\{([\w ,.]+)\})* ((?:\w|-)+|=)[\+#!?]* *(?:\{([\w ,.]+)\})*/g

  while (result = info.exec(gamestring))
      parsed[result[1]] = result[2]

  parsed.FEN ?= "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

  parsed.moves = []
  parsed.comments = []

  while (result = moves.exec(gamestring))
      parsed.moves.push result[1]
      parsed.moves.push result[3]
      parsed.comments.push result[2] || ''
      parsed.comments.push result[4] || ''

  parsed
  
console.log parse gamestring
