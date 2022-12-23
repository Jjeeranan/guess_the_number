// ignore_for_file: avoid_print
import 'dart:math';

enum GuessResult{
  correct, toHigh, tooLow
}

class Game{
  final int answer ;
  int _totalGuesses = 0;

  // constructor
  Game({required int maxRandom}) :
        answer = Random().nextInt(maxRandom) + 1 {
    print('Answer is $answer');
  }

  GuessResult doGuess(int guess){
    _totalGuesses++;

    if(guess == answer) {
      return GuessResult.correct;
    }else if(guess > answer) {
      return GuessResult.toHigh;
    }else{
      return GuessResult.tooLow;
    }
  }
  int get totalGuesses{
    return _totalGuesses;
  }
}