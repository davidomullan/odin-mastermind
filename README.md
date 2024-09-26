# odin-mastermind
Assignment: Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.

- Developer: [David O'Mullan](https://github.com/davidomullan)
- Guidelines: [The Odin Project](https://www.theodinproject.com/lessons/ruby-mastermind)

# Game Rules
In the game of Mastermind, one player generates a code of 4 marbles from a possible 6 colors (code may include more than one of each color). The other player has 12 turns to guess the code. After each guess, the guesser is provided with the number of guesses of correct position and color (white pegs), correct color but not position (black pegs), and neither correct position or color (empty pegs). The guess wins if he discovers the code; otherwise the codemaker wins.

# Implementation
- Marble Colors are selected as digits 1-6, but displayed in color
- Pegs are displayed as color O's (black, white, and ' ')
- The user may choose to be the guesser or codemaker
- The computer guessing algorithm guesses by guessing at random from all possible solutions, and the reducing the array of possible solutions by removing any code that wouldn't produce the pegs shown.

# Credit
- [wikiHow](https://www.wikihow.com/Play-Mastermind)
- [Sinan Oz](https://www.swtestacademy.com/algorithms-mastermind/#google_vignette) provided idea for best guessing algorithm. Interesting article on using computers strengths in algorithm versus how a human would play, such as Knuth's algorithm.