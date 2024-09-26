import 'dart:io';
import 'dart:math';

void main() {
  var random = Random();
  int targetNumber = random.nextInt(100) + 1;
  int? guess;
  int attempts = 0;

  print('Bienvenue dans le jeu "Guess the Number" !');
  print('Je pense à un nombre entre 1 et 100. Pouvez-vous le deviner ?');

  do {
    stdout.write('Entrez votre estimation: ');
    try {
      guess = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('ERR: Veuillez entrer un nombre valide.');
      continue;
    }
    attempts++;

    if (guess < targetNumber) {
      print('C\'est plus grand !');
    } else if (guess > targetNumber) {
      print('C\'est plus petit !');
    } else {
      print(
          "Congrats! You've found the number $targetNumber in $attempts attempts.");
    }
  } while (guess != targetNumber);
}
