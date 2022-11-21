import 'package:flutter/material.dart';

class PuzzlesPage extends StatefulWidget {
  int level_num;

  PuzzlesPage(this.level_num);

  @override
  State<PuzzlesPage> createState() => _PuzzlesPageState();
}

class _PuzzlesPageState extends State<PuzzlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  //block shad
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image:
                      AssetImage("assets/images/puzzles_page_background.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: const Text("Select Puzzle",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontStyle: FontStyle.italic)),
                ),
                Container(
                  height: 440,
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5),
                    children: List.generate(
                      75,
                      (index) {
                        return Container(
                          child: (widget.level_num < index)
                              ? Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red[300],
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/lock.gif"),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("${index+1}",style: TextStyle(fontSize: 30,color: Colors.black45),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.green[300],
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/tick.png"),
                                            ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ),

                //TODO: gif
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/swipe.gif"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
