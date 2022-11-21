import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoutinuePage extends StatefulWidget {
  int level_num;
  CoutinuePage(this.level_num);

  

  @override
  State<CoutinuePage> createState() => _CoutinuePageState();
}

class _CoutinuePageState extends State<CoutinuePage> {

  late int level_num = 1;
  SharedPreferences? prefs;

  List skip_level = [];
  List ansList = ["10","25","6","14","128","7","70","1025","100","3","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110","110"];

  late String userEnterAns = "", ans = "";

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      level_num=widget.level_num;

      skip_level = List.filled(75, "no");
      get();
    }

    get()
    async {
      prefs = await SharedPreferences.getInstance();
    }
  void value2(String val) {
    ans = userEnterAns + val;


    setState(() {
      userEnterAns = ans;
    });
  }


  //Butten
  Widget NumBtn(String num) {
    return Expanded(
      child: InkWell(
        onTap: () => value2(num),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "$num",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgrounds.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                //TODO: Level Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    InkWell(
                      onTap: () {
                        level_num++;
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/skip.png"),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 170,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/level_board.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Text(
                        "Puzzle ${level_num+1}",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/hint.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 75),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/p${level_num+1}.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 200,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "$userEnterAns",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                if(userEnterAns.length != 0) {
                                  userEnterAns = userEnterAns.substring(0, userEnterAns.length - 1);
                                  return setState(() {
                                    userEnterAns;
                                  });
                                }
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/delete.png"))),
                              ),
                            ),
                          ),

                          //  submit btn
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                  if(ansList[level_num]==userEnterAns)
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Right Answer ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.greenAccent,
                                          textColor: Colors.white,
                                          fontSize: 18.0
                                      );
                                        setState(() {
                                          level_num ++;
                                          prefs!.setInt("level", level_num);
                                        });
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                          return CoutinuePage(level_num);
                                        },));
                                    }
                                  else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Wrong Answer",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 18.0
                                      );
                                    }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumBtn("1"),
                          NumBtn("2"),
                          NumBtn("3"),
                          NumBtn("4"),
                          NumBtn("5"),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumBtn("6"),
                          NumBtn("7"),
                          NumBtn("8"),
                          NumBtn("9"),
                          NumBtn("0"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
