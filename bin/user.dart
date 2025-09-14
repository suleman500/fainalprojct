import 'dart:io';
import 'Flight.dart';
import 'csin.dart';
import 'dart:math';
import 'Flight.dart';
import 'Data.dart';

/*-------------------------------------------------------------------------------------------------------------*/

int cont = 3;
List<User> user1 = [
  User(name: "ali", password: "500", balnce: 800),
  User(name: "ahmad", password: "00", balnce: 600)
];

class User {
  late String name;
  late String password;
  int id = cont;
  int balnce = 0;
  String totravel;
  String tripName;
  String hotel;
  late Flight fl;
  late Csin S1;
  var timet;
  var evnt;

  User(
      {required this.name,
      required this.password,
      this.balnce = 0,
      this.totravel = "null",
      this.tripName = "null",
      this.hotel = "null",
      this.timet = "null"}) {
    cont++;
    fl = Flight(user: this);
    S1 = Csin(Games: this);
    evnt = "null";
  }
  static Management(User user) {
    print("──────────────────────────");
    print("   Account Management     ");
    print("──────────────────────────");
    print("   1. My Information      ");
    print("   2. Update Information  ");
    print("   3.Back        ");
    print("──────────────────────────");
    int ma = int.parse(stdin.readLineSync()!);
    switch (ma) {
      case 1:
        accountInfo(user);

        break;
      case 2:
        Update(user);
        break;
      case 3:
        interfce(user);
    }
  }

  static void interfce(User user) {
    Flight fl = Flight(user: user);
    Csin S1 = Csin(Games: user);
    print("        GAME AND FLY           ");
    print("──────────────────────────────");
    print("  [1] Account Information     ");
    print("  [2] Book a Flight           ");
    print("  [3] Games                   ");
    print("  [4] Hotel Reservation       ");

    print("  [5] Printing the ticket     ");
    print("  [6] Events in Destination   ");
    print("  [7] TICKET Event ");
    print("  [8] Exet                    ");

    print("──────────────────────────────");

    try {
      int s = int.parse(stdin.readLineSync()!);
      if (s > 0 && s <= 8) {
        switch (s) {
          case 1:
            Management(user);

            break;

          case 2:
            fl.flights();
            interfce(user);

            break;
          case 3:
            S1.games();
            break;
          case 4:
            fl.Hotell();
            break;
          case 5:
            tiki(user);
            break;
          case 6:
            envent(user);
            break;
          case 7:
            tikteven(user);
            break;
          case 8:
            wlcoom();
            break;
          // case 9:
          //canceleTrip(user);
          //break;
        }
      } else {
        print("Enter 1--8 :");
        interfce(user);
      }
    } catch (d) {
      print("Enter intgr Number 1---8 : ");
      interfce(user);
    }
  }

  static void tiki(User user) {
    if (user.totravel != "null" && user.timet != "null") {
      print("");
      print("        TRAVEL TICKET");
      print("");
      print("Name: ${user.name}");
      print("Hotel: ${user.hotel}");
      print("Destination: ${user.totravel}");

      print("Flight Time: ${user.timet}");
      print("");
      interfce(user);
    } else {
      print(
          "Please choose a date and place for travel and select a hotel to obtain the ticket ");
      bool e = true;
      try {
        while (e) {
          print("1-Home\n2-Book flight");
          int k = int.parse(stdin.readLineSync()!);

          if (k > 0 && k < 3) {
            switch (k) {
              case 1:
                interfce(user);
                e = false;
                break;
              case 2:
                user.fl.flights();
                e = false;
                break;
            }
          } else {
            print("Enter 1 or 2");
          }
        }
      } catch (d) {
        print(" Enter 1 or 2");
      }
    }
  }

  static void login() {
    bool s = true;
    int j = 2;
    int t = 0;
    int l = 0;

    while (s) {
      if (t <= 2) {
        print("ples Enter name : ");
        String n = stdin.readLineSync()!.toLowerCase();
        bool chih = user1.any((o) => o.name == n);

        if (chih == true) {
          bool d = true;
          while (d) {
            if (l <= 2) {
              print("enter  password");
              String p = stdin.readLineSync()!.toLowerCase();
              bool chkp = user1.any((s) => s.password == p);
              if (chkp) {
                s = false;
                User log = user1
                    .firstWhere((user) => user.name == n && user.password == p);
                User.interfce(log);
                d = false;
              } else {
                print(" Password is incorrect");

                l++;
              }
            } else {
              print("PIN login locked");
              pin();
              d = false;
            }
          }
        } else {
          print(" Name does not exist ");
          t++;
        }
      } else {
        print("Please choose :    1-SingUP \n2-Login");

        int y = int.parse(stdin.readLineSync()!);
        switch (y) {
          case 1:
            print("please Create an Account ");
            User.SingUP();
            s = false;

            break;
          case 2:
            User.login();
            s = false;

            break;
        }
      }
    }

    /* else {
        print("PIN login locked");
        pin();
        s = false;
      }*/
  }

  static pin() {
    bool e = true;
    while (e) {
      try {
        print("Enter PIN code :");
        int PIN = int.parse(stdin.readLineSync()!);
        if (PIN == 555) {
          print("The lock has been unlocked");
          wlcoom();
          e = false;
        } else {
          print("Invalid PIN code. Try again:");
        }
      } catch (e) {
        print("Enter the wrong 3-digit number :");
      }
    }
  }

  static void wlcoom() {
    print("           Main menu           ");
    print("                         ");
    print("----------------------------------");
    print("          Welcome                  ");
    print("----------------------------------");
    print("    1. Login      ");
    print("    2. SingUP        ");
    print("----------------------------------");

    try {
      int c = int.parse(stdin.readLineSync()!);
      if (c <= 2 && c > 0) {
        switch (c) {
          case 1:
            User.login();
            // User r = User(name: n, password: p);

            break;
          case 2:
            User.SingUP();
            break;
        }
      } else {
        print("plese enter 1 or 2");
        wlcoom();
      }
    } catch (e) {
      print("pless Enter 1 or 2 ");
      wlcoom();
    }

    ;
  }

  static SingUP() {
    print("Enter name");
    String n = stdin.readLineSync()!.toLowerCase();
    print("enter  password");
    String p = stdin.readLineSync()!.toLowerCase();
    User s1 = User(name: n, password: p);
    user1.add(User(name: n, password: p));
    s1.balnce = 800;
    User.interfce(s1);
  }

  static void timeTr(User user) {
    if (user.timet == "null") {
      if (user.totravel != "null") {
        Random random = Random();
        int randoml = random.nextInt(7) + 1;
        Map rch = flightSchedule[randoml];
        user.timet = rch;

        print("Your flight time is : ${user.timet}");
        interfce(user);
      } else {
        print("!!!!!!!!!-----------------------------!!!!!!!!!");
        print(
            "You must book a trip in order for the date and time to be reserved");
        user.fl.flights();
      }
    } else {
      print(
          "The flight date has been scheduled in advance on the ticket${user.timet}");
      user.fl.flights();
    }
  }

  static tikteven(User user) {
    if (user.evnt != "null") {
      print("========================================");
      print("            EVENT TICKET");
      print("========================================");
      print("Name:  ${user.name}");
      print("Event: ${user.evnt}");
      print("========================================");
      interfce(user);
    } else {
      print("Please book an event first (Option 7)");
      interfce(user);
    }
  }

  static void envent(User user) {
    try {
      print("1-Event vision\n2-Back");
      print("If you choose the first option, 55 will be deducted");
      int g = int.parse(stdin.readLineSync()!);

      switch (g) {
        case 1:
          if (user.evnt == "null") {
            if (user.totravel != "null") {
              if (user.balnce > 0 && 55 <= user.balnce) {
                //List events = countryEvents[user.totravel]["events"];

                if (countryEvents.containsKey(user.totravel)) {
                  print("The events in this country:${user.totravel}");
                  // print(countryEvents[user.totravel]["events"]);

                  var eventss = countryEvents[user.totravel]["events"];

                  user.evnt = eventss;
                  user.balnce -= 55;
                  print("55 has been deducted from your balance \n");

                  print(eventss);
                  print("---------------------------------------------------");
                  bool mm = true;
                  while (mm) {
                    print("1-Home");
                    try {
                      int g = int.parse(stdin.readLineSync()!);
                      switch (g) {
                        case 1:
                          interfce(user);
                          mm = false;
                          break;
                        default:
                          mm = false;
                          interfce(user);
                          break;
                      }
                    } catch (s) {
                      print("Enter Intger nmber");
                    }
                  }
                }
              } else {
                print("Your balance is insufficient");
                print("Your Balnce ${user.balnce}");
                interfce(user);
              }
            } else {
              print("You must book a trip first to see he events (Option 2)");
              interfce(user);
            }
          } else {
            print(
                "Events that have been previously booked cannot be reserved again!!!!!");
            interfce(user);
          }
          break;
        case 2:
          interfce(user);
          break;
        default:
          print("Input eroor - pless enter 1 or 2 ");
          interfce(user);
          break;
      }
    } catch (e) {
      print("Input Error ");
      interfce(user);
    }
  }

  static void accountInfo(User user) {
    print("──────────────────────────────");
    print("User Information:");
    print("────────────────");
    print("Name     : ${user.name}");
    print("Password : ${user.password}");
    print("Balance  : \$${user.balnce}");
    print("ID       : ${user.id}");
    // print("Travel   : ${user.totravel}");
    // print("Hotel    : ${user.hotel}");
    print("------------------------------");
    Management(user);
  }

  static Update(User user) {
    print("Update Options:");
    print("───────────────");
    print("1. Name");
    print("2. Password");
    print("3. Back");
    try {
      int u = int.parse(stdin.readLineSync()!);
      if (u > 0 && u <= 3) {
        switch (u) {
          case 1:
            stdout.write("Current name: ${user.name} | Enter new name: ");
            String l = stdin.readLineSync()!;

            user.name = l;
            stdout.write("newa name is :${l}");
            print("   ");
            Update(user);
            // } else {
            //   print("*");
            // }

            break;

          case 2:
            stdout.write(
                "Current password: ${user.password} | Enter new password: ");
            String l = stdin.readLineSync()!;

            user.password = l;
            stdout.write("newa paswword is :${l}");
            print("   ");
            Update(user);
            break;

          case 3:
            Management(user);
            break;
        }
      } else {
        print(" Input Error");
        Update(user);
      }
    } catch (s) {
      print("ples enter namber ");
      Update(user);
    }
  }
}

/*static  canceleTrip(user) {
    if  (user.totravel!= "null") {
      print("1-Cancellation of the trip\n2-Back");
      int c = int.parse(stdin.readLineSync()!);
      switch (c) {
        case 1:
          print(
              "The trip will be canceled along with the hotel and the event ticket");
         user.totravel= "null";
          break;
        case 2:
          interfce;
          break;
      }
    } else {}
  }*/

