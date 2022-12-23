// ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';

void main() {
  late GuessResult guessResult;
  String? playagain = 'Y';
  var game;

  do {
    if (playagain == 'Y' || playagain == 'y') {
      stdout.write('Enter a maximum number to random: ');
      var maxRandom = stdin.readLineSync();
      if (maxRandom == null) {
        return;
      }
      var max = int.tryParse(maxRandom);
      if (max == null) {
        return;
      }
      game = Game(max);


      print('╒══════════════════════════════════════════════════ ');
      print('│                GUESS THE NUMBERS');
      print('├❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ');

      do {
        stdout.write('│ Guess the number between 1 and 100 : ');
        var input = stdin.readLineSync();

        if (input == null) {
          return;
        }
        var guess = int.tryParse(input);

        if (guess == null) {
          continue;
        }
        guessResult = game.doGuess(guess);

        if (guessResult == GuessResult.correct) {
          print('│ ✔✔ $guess is CORRECT ʕᵔᴥᵔʔ☛ total guesses: ${game
              .totalGuesses}');
          print('├❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ');
          print('│                    THE END                    ');
          print('╘═══════════════════════════════════════════════════ ');
        } else if (guessResult == GuessResult.toHigh) {
          print('│ ✎ $guess is TOO HIGH!  ⏫');
          print('├────────────────────────────────────────────────── ');
        } else {
          print('│ ✎ $guess is TOO LOW!   ⏬');
          print('├────────────────────────────────────────────────── ');
        }
      }
      while (guessResult != GuessResult.correct);
    }
    stdout.write('(´･ω･`)? Play again? (Y/N ) : ');
    playagain = stdin.readLineSync();
    if (playagain == null) {
      continue;
    }
  } while (playagain != 'N' && playagain != 'n');
  List totalGuess = game.round;
  print("You've play ${totalGuess.length} game");
  for(int i=0; i< totalGuess.length; i++){
    print('⛄ Game #${i+1}: ${totalGuess[i]} guesses');
  }
}