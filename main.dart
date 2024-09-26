import 'dart:io';
import 'dart:math';

void main() {
  var random = Random();
  int targetNumber = random.nextInt(100) + 1;
  int? guess;
  int attempts = 0;
  Set<int> numTried = {};
  DateTime? start;

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
    if (numTried.contains(guess)) {
      print('Vous avez déjà essayé ce nombre... Essayez un autre !');
      continue;
    }
    attempts++;
    numTried.add(guess);
    if (start == null) {
      start = DateTime.now();
      print("Début du chrono " + start.toString());
    }

    if (guess < targetNumber) {
      print('C\'est plus grand !');
    } else if (guess > targetNumber) {
      print('C\'est plus petit !');
    } else {
      print(
          "Congrats! You've found the number $targetNumber in $attempts attempts in ${DateTime.now().difference(start).inSeconds} seconds.");
      print(DateTime.now().toString());
    }
    
  } while (guess != targetNumber);
}
