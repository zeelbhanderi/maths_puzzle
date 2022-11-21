import 'package:flutter/material.dart';
import 'package:maths_puzzles/Pages/Continue_page.dart';
import 'package:maths_puzzles/Pages/Puzzles_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  SharedPreferences? prefs;
  int l = 0;

  //store a how many user passed value
  @override
  void initState() {
    //implement initState
    super.initState();
    //store in shared-preferences
    get();
    l = prefs?.getInt("level") ?? 0;
  }

  get() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //TODO : title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          "Math Puzzles",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),

                  //TODO: spacing
                  const SizedBox(
                    height: 70,
                  ),

                  //TODO: Bround
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/blackboard_main_menu.png"),
                            fit: BoxFit.fill),
                      ),

                      //TODO: Menu
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            //TODO: Continue button
                            InkWell(
                              onTap: () {
                                l = prefs!.getInt("level") ?? 0;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoutinuePage(l),
                                  ),
                                );
                              },
                              child: const Text(
                                "CONTINUE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'chalk_font',
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),

                            //TODO: Puzzles button
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PuzzlesPage(l),
                                    ));
                              },
                              child: const Text(
                                "PUZZLES",
                                style: TextStyle(
                                    fontFamily: 'chalk_font',
                                    letterSpacing: 3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),

                            //TODO: Donate button  function are bottom
                            ElevatedButton(
                              onPressed: _launchUrl,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: const Text(
                                "Donate",
                                style: TextStyle(
                                    fontFamily: 'chalk_font',
                                    letterSpacing: 3,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //TODO: spacing
                  const SizedBox(
                    height: 70,
                  ),

                  //TODO: for advancing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//TODO: calling URl in App Donate
final Uri _url = Uri.parse('https://www.buymeacoffee.com/zeelbhanderi28');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
