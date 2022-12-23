// ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';

void main(){
  var game = Game();
  late GuessResult guessResult ;


  print('╒══════════════════════════════════════════════════ ');
  print('│                GUESS THE NUMBERS');
  print('├❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ');

  do {
    stdout.write('│ Guess the number between 1 and 100 : ');
    var input = stdin.readLineSync();

    if (input == null) {
      continue;
    }
    var guess = int.tryParse(input);

    if (guess == null) {
      continue;

    }
    guessResult = game.doGuess(guess);

    if(guessResult == GuessResult.correct){
      print('│ ✔✔ $guess is CORRECT ʕᵔᴥᵔʔ☛ total guesses: ${game.totalGuesses}');
      print('├❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ');
      print('│                    THE END                    ');
      print('╘═══════════════════════════════════════════════════ ');
    }else if(guessResult == GuessResult.toHigh){
      print('│ ✎ $guess is TOO HIGH!  ⏫');
      print('├────────────────────────────────────────────────── ');
    }else{
      print('│ ✎ $guess is TOO LOW!   ⏬');
      print('├────────────────────────────────────────────────── ');
    }
  }
  while (guessResult  != GuessResult.correct);
}