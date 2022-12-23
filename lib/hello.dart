import 'dart:io';
import 'dart:math';

void main() {
  var r = Random();
  var answer = r.nextInt(100) + 1;
  var isCorrect = false;
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
    isCorrect = doGuess(guess, answer);
  }
  while (!isCorrect);
}
var sum =1;
bool doGuess(int guess, int answer){
  if(guess == answer) {
    print('│ ✔✔ $answer is CORRECT ʕᵔᴥᵔʔ☛ total guesses: $sum');
    print('├❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ❀ ');
    print('│                    THE END                    ');
    print('╘═══════════════════════════════════════════════════ ');
    return true;
  }else if(guess > answer) {
    print('│ ✎ $guess is TOO HIGH!  ⏫');
    print('├────────────────────────────────────────────────── ');
    sum += 1;
    return false;
  }else{
    print('│ ✎ $guess is TOO LOW!   ⏬');
    print('├────────────────────────────────────────────────── ');
    sum +=1;
    return false;
  }
}

