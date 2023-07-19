// ?: Write a guessing game with how many tries were needed.

import 'dart:io';
import 'dart:math';

void main () {
    int secret = Random().nextInt(50); // random number from 0 to 50
    int attempts = 0, guess;
    do {
        stdout.write("Your Guess: ");
        guess = int.parse(stdin.readLineSync()!);
        if (guess > secret) {
            stdout.write("\tSecret is more Lesser!\n");
        } else if (guess < secret) {
            stdout.write("\tSecret is more Greater!\n");
        }
        attempts++;
    } while (guess != secret);
    stdout.write("Secret ${secret} is Guessed Correctly with ${attempts} Attempts!\n");
}
