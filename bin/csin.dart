import 'user.dart';
import 'Flight.dart';
import 'dart:io';
import 'dart:math';
import 'Data.dart';

class Csin {
  User Games;

  Csin({required this.Games});

  void games() {
    bool t = true;
    while (t) {
      print("──────────────");
      print("  GAMES MENU  ");
      print("──────────────");
      print("1. Roulette");
      print("2. Question Game");
      print("3. Back");
      print("──────────────");
      try {
        int o = int.parse(stdin.readLineSync()!);
        switch (o) {
          case 1:
            rouletteGames();
            t = false;
            break;
          case 2:
            QuestionGame();
            t = false;
            break;
          case 3:
            User.interfce(Games);
            t = false;
            break;
        }
      } catch (r) {
        print("Incorrect input, please rewrite the options");
        games();
      }
    }
  }

  void rouletteGames() {
    try {
      print("Welcome to Roulette");
      print("================================================================");

      Random random = Random();
      int randoml = random.nextInt(9) + 1;
      if (Games.balnce > 0) {
        print("Please enter a number between 1 and 9:");
        int g = int.parse(stdin.readLineSync()!);
        if (g == randoml) {
          print("You win!");
          Games.balnce += 60;
          print("New balance: ${Games.balnce} (+60)");
          games();
        } else {
          print("Game over! You lose.");
          Games.balnce -= 100;
          print("New balance: ${Games.balnce} (-100)");
          games();
        }
      } else {
        print("!!!! Insufficient balance !!!!");
        games();
      }
    } catch (s) {
      print("ples Enter Intger Number : ");
      rouletteGames();
    }
  }

  void QuestionGame() {
    print("Welcome to the Question and Answer game");
    Random random = Random();
    int randomNumber = random.nextInt(6) + 1;

    if (Games.balnce > 0) {
      switch (randomNumber) {
        case 1:
          try {
            stdout.write(
                "What is Cristiano Ronaldo's number in Real Madrid 2015? ");
            int o = int.parse(stdin.readLineSync()!);
            if (o == 7) {
              print("Correct! +56 added to your account");
              Games.balnce += 56;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 100;
              games();
            }
          } catch (e) {
            Games.balnce -= 100;
            print("100 deducted from your account");
            games();
          }
          break;
        case 2:
          try {
            print("In what year did Jordan gain independence?");
            int o = int.parse(stdin.readLineSync()!);
            if (o == 1946) {
              print("Correct! +56 added to your account");
              Games.balnce += 56;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 100;
              print("100 deducted from your account");
              games();
            }
          } catch (e) {
            print("Invalid input");
            Games.balnce -= 100;
            print("100 deducted from your account");
            games();
          }
          break;
        case 3:
          try {
            stdout.write("What year did the company Mercedes establish? ");
            int o = int.parse(stdin.readLineSync()!);
            if (o == 1926) {
              print("Correct! +56 added to your account");
              Games.balnce += 56;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 100;
              print("100 deducted from your account");
              games();
            }
          } catch (e) {
            print("Invalid input");
            Games.balnce -= 100;
            print("100 deducted from your account");
            games();
          }
          break;
        case 4:
          try {
            stdout.write("How many sides does a hexagon have? ");
            int o = int.parse(stdin.readLineSync()!);
            if (o == 6) {
              print("Correct! +40 added to your account");
              Games.balnce += 40;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 80;
              print("80 deducted from your account");
              games();
            }
          } catch (e) {
            print("Invalid input");
            Games.balnce -= 80;
            print("80 deducted from your account");
            games();
          }
          break;
        case 5:
          try {
            stdout.write("What is the capital of Japan? ");
            String o = stdin.readLineSync()!.toLowerCase();
            if (o == "tokyo") {
              print("Correct! +70 added to your account");
              Games.balnce += 70;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 50;
              print("50 deducted from your account");
              games();
            }
          } catch (e) {
            print("Invalid input");
            Games.balnce -= 50;
            print("50 deducted from your account");
            games();
          }
          break;
        case 6:
          try {
            stdout.write("What is 8 × 9? ");
            int o = int.parse(stdin.readLineSync()!);
            if (o == 72) {
              print("Correct! +30 added to your account");
              Games.balnce += 30;
              games();
            } else {
              print("Incorrect");
              Games.balnce -= 60;
              print("60 deducted from your account");
              games();
            }
          } catch (e) {
            print("Invalid input");
            Games.balnce -= 60;
            print("60 deducted from your account");
            games();
          }
          break;
      }
    } else {
      print("Insufficient balance");
      games();
    }
  }
}