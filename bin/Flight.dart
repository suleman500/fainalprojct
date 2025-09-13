import 'user.dart';
import 'dart:io';
import 'dart:math';
import 'csin.dart';
import 'Data.dart';

int s = 0;

class Flight {
  String priceTrip = "null";

  User user;

  Flight({
    required this.user,
  });

  void flights() {
    print(" Flight Department");
    print("────────────────────");
    print("1. Choose a trip");

    print("2. Back");
    print("3-Flight time");

    print("────────────────────");
    bool o = true;

    while (o) {
      try {
        int i = int.parse(stdin.readLineSync()!);
        if (i > 0 && i <= 3) {
          switch (i) {
            case 1:
              printFlights();
              tripp();

              o = false;
              break;
            case 2:
              User.interfce(user);
              o = false;
              break;
            case 3:
              User.timeTr(user);
          }
        } else {
          print(" Enter 1 or 2 or 3 ");
        }
      } catch (f) {
        print("Enter 1 or 2 or 3");
      }
    }
  }

  void printFlights() {
    for (var i = 1; i <= dataflights.length; i++) {
      var flight = dataflights[i];
      print("${i}. ${flight['country']} - \$${flight['price']}");
    }
  }

  void tripp() {
    print("\nEnter flight number (1-13):");
    bool k = true;
    while (k) {
      try {
        int choice = int.parse(stdin.readLineSync()!);
        s = choice;
        if (choice >= 1 && choice <= dataflights.length) {
          var se = dataflights[choice];
          int fil = se['price'];
          String des = se['country'];
          if (user.balnce >= fil) {
            user.hotel = "null";
            user.balnce -= fil;
            user.totravel = des;
            user.tripName = des;
            print("\nBooked trip to ${se['country']}");
            print("Deducted \$${user.balnce} from your balance");
            k = false;
            flights();
          } else {
            print("\nInsufficient balance!");
            print("Flight price: \$$fil");
            print("Your balance: \$${user.balnce}");
            k = false;
            flights();
          }
        } else {
          print("Please enter number between 1-13");
        }
      } catch (ff) {
        print("Please enter number between 1-13");
      }
    }
  }

  void Hotell() {
    print("chise hotel : ");
    print("---------------------------------------------");
    bool g = true;
    while (g) {
      try {
        if (s != 0) {
          print(countryHotels[s]["hotels"]);
          var curData = countryHotels[s];
          var ht = curData["hotels"];
          print("0                        1                          2");

          int ch = int.parse(stdin.readLineSync()!);

          if (ch >= 0 && ch <= countryHotels.length) {
            String se = ht[ch];
            user.hotel = se;
            print("  hotel has been selected : $se");
            print("  In a country : ${user.totravel}");
            print("------------------------------------");
            User.interfce(user);
            g = false;
          }
        } else {
          print("Please select your travel location to book a hotel : ");
          print("Please select\n 1-Book a flight\n2-Home page");
          int d = int.parse(stdin.readLineSync()!);
          switch (d) {
            case 1:
              flights();
              g = false;
              break;
            case 2:
              User.interfce(user);
              g = false;
          }
        }
      } catch (e) {
        print("plesss enter nember : ");
      }
    }
  }
}
