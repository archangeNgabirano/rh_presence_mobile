// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rh_presence_mobile/routes/api_url.dart';
import 'package:rh_presence_mobile/screen/PresenceScreen.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';
import 'package:rh_presence_mobile/widget/logout_componet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  String? token = "Lionel";
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MainPage();
    switch (_index) {
      case 0:
        child = MainPage();
        break;
      case 1:
        child = PresenceScreen();
        // child = Text("${l.token}");
        break;
      case 2:
        child = LogoutComponet();
        break;
    }
    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "Orange"),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Déconnexion",
          ),
        ],
      ),
    );
  }
}

class HeaderComponentPage extends StatefulWidget {
  const HeaderComponentPage({super.key});

  @override
  State<HeaderComponentPage> createState() => _HeaderComponentPageState();
}

class _HeaderComponentPageState extends State<HeaderComponentPage> {
  late SharedPreferences prefs;

  String userName = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    userName = UserSimplePeference.getUserName();
    email = UserSimplePeference.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    print("Emails: $email ");
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text("$userName", style: Theme.of(context).textTheme.titleLarge),
              Text("$email", style: Theme.of(context).textTheme.bodySmall),
              Divider(
                height: 20,
                color: Colors.grey,
              )
            ],
          ),
        ),
        CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person_2,
            size: 100,
          ),
        )
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Column(children: [
        HeaderComponentPage(),
        SizedBox(
          height: 20,
        ),
        CardDashBoard(),
        SizedBox(
          height: 20,
        ),
        ArriveButton(),
      ]),
    );
  }
}

class ArriveButton extends StatefulWidget {
  const ArriveButton({Key? key}) : super(key: key);

  @override
  State<ArriveButton> createState() => _ArriveButtonState();
}

class _ArriveButtonState extends State<ArriveButton> {
  late SharedPreferences prefs;
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
  }

  void setArrverUser(context) async {
    print(token);
    final response = await http.post(CHECK_ARRIVE_USER_URL, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ${token}',
    });

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text('Ok Vous etes dejariver'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => setArrverUser(context),
        child: Center(
          child: CircleAvatar(
            radius: 120,
            child: Icon(Icons.roofing_rounded, size: 120),
          ),
        ),
      ),
    );
  }
}

class CardDashBoard extends StatelessWidget {
  CardDashBoard({super.key});

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static final DateFormat formatterTime = DateFormat('HH:mm');
  final String formatted = formatter.format(now);
  final String formattedTime = formatterTime.format(now);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.black,
            Colors.purple,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            trailing: Text(
              'Date',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            leading: Text(
              'Bonjour',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            title: Center(
              child: Column(
                children: [
                  Text(
                    '$formattedTime',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    '$formatted',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBarComponent extends StatefulWidget {
  NavigationBarComponent(this._currentNavigation, {super.key});

  final VoidCallback _currentNavigation;
  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = FlutterLogo();
    switch (index) {
      case 0:
        child = FlutterLogo();
        break;
      case 1:
        child = FlutterLogo(
          textColor: Colors.black12,
        );
        break;
      case 2:
        child = FlutterLogo(textColor: Colors.red);
        break;
    }
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        widget._currentNavigation;
        setState(() {
          this.index = index;
        });
      },
      // Colors.black,
      backgroundColor: Color.fromARGB(255, 97, 111, 122),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.alarm,
            size: 30,
            color: Colors.white,
          ),
          label: 'A',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          label: 'B',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            size: 30,
            color: Colors.white,
          ),
          label: 'C',
        ),
      ],
    );
  }
}
