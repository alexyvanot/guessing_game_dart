import 'dart:io';
import 'dart:math';

enum Difficulty {
  EASY,
  MEDIUM,
  HARD,  
}

void main() {
  var random = Random();
  int? targetNumber;
  int? guess;
  int attempts = 0;
  Set<int> numTried = {};
  DateTime? start;
  Difficulty? difficulty;

  print('Welcome to "Guess the Number" !');

  print("Choose your difficulty:");
  do {
    print("1. Easy");
    print("2. Medium");
    print("3. Hard");
    stdout.write("> ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        difficulty = Difficulty.EASY;
        targetNumber = random.nextInt(100) + 1;
        break;
      case 2:
        difficulty = Difficulty.MEDIUM;
        targetNumber = random.nextInt(500) + 1;
        break;
      case 3:
        difficulty = Difficulty.HARD;
        targetNumber = random.nextInt(1000) + 1;
        break;
      default:
        print("ERR: Please enter a valid choice.");
        continue;
    }
  } while (targetNumber == null);
  if (difficulty == Difficulty.EASY) {
    print('You have chosen the easy mode. I am thinking of a number between 1 and 100. Try to find it !');
  } else if (difficulty == Difficulty.MEDIUM) {
    print('You have chosen the medium mode. I am thinking of a number between 1 and 500. Try to find it !');
  } else {
    print('You have chosen the hard mode. I am thinking of a number between 1 and 1000. Try to find it !');
  }

  do {
    stdout.write('> ');
    try {
      guess = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('ERR: Please enter a valid number.');
      continue;
    }
    if (numTried.contains(guess)) {
      print('You have already tried this number. Try another one.');
      continue;
    }
    attempts++;
    numTried.add(guess);
    if (start == null) {
      start = DateTime.now();
      print("START: " + start.toString());
    }

    if (guess < targetNumber) {
      print('The number is higher.');
    } else if (guess > targetNumber) {
      print('The number is lower.');
    } else {
      print(
          "Congrats! You've found the number $targetNumber in $attempts attempts in ${DateTime.now().difference(start).inSeconds} seconds with the difficulty ${difficulty.toString().split('.').last.toLowerCase()}.");
      print("END: " + DateTime.now().toString());
    }
  } while (guess != targetNumber);
}
