import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff1C1D20),
      ),
      home: RoutePage(),
    );
  }
}

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeroControllerScope(
        controller: MaterialApp.createMaterialHeroController(),
        child: Navigator(
          onGenerateRoute: (RouteSettings setting) {
            return MaterialPageRoute(
                settings: setting,
                builder: (context) {
                  switch (setting.name) {
                    case "/detail":
                      return DetailPage();
                    default:
                      return HomePage();
                  }
                });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.3),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "")
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text("Book"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Tag("Classic"),
                  Tag("Romance"),
                  Tag("Histories"),
                  Tag("Business"),
                  Tag("Poems")
                ],
              ),
            ),
          ),
          Header("Friends recommend"),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RecommendCard("assets/s3.jpg", () {
                  Navigator.pushNamed(context, "/detail",
                      arguments: "assets/s3.jpg");
                }),
                RecommendCard("assets/s4.jpg", () {
                  Navigator.pushNamed(context, "/detail",
                      arguments: "assets/s4.jpg");
                }),
                RecommendCard("assets/s5.jpg", () {
                  Navigator.pushNamed(context, "/detail",
                      arguments: "assets/s5.jpg");
                })
              ],
            ),
          ),
          Header("Bestseller"),
          SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BestsellerCard("assets/s1.jpg"),
                  BestsellerCard("assets/s2.jpg"),
                  BestsellerCard("assets/s3.jpg"),
                  BestsellerCard("assets/s4.jpg"),
                  BestsellerCard("assets/s5.jpg"),
                  BestsellerCard("assets/s6.jpg")
                ],
              )),
          Header("Popular Author"),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AuthorCard("assets/s1.jpg"),
                AuthorCard("assets/s2.jpg"),
                AuthorCard("assets/s3.jpg"),
                AuthorCard("assets/s4.jpg"),
                AuthorCard("assets/s5.jpg"),
                AuthorCard("assets/s6.jpg")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  final String image;

  AuthorCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80,
        height: 80,
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}

class BestsellerCard extends StatelessWidget {
  final String image;

  BestsellerCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 100,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ))),
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 10,
                color: Colors.orange,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "4.5",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RecommendCard extends StatelessWidget {
  final String image;
  final VoidCallback callback;

  RecommendCard(this.image, this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          callback();
        },
        child: SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Color(0xff36383F),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Rear Window",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Cornell Woolrich",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, right: 10),
                        child: Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: Colors.orange,
                                size: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: Colors.orange,
                                size: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: Colors.orange,
                                size: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: Colors.orange,
                                size: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xff5C5E65),
                                size: 10,
                              ),
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: SizedBox(
                  width: 100,
                  height: 140,
                  child: Hero(
                    tag: image,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right: 10,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/s2.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/s3.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.orange),
                        child: Center(
                            child: Text(
                          "3+",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;

  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            "All",
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white.withOpacity(0.5),
            size: 15,
          )
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String tag;

  Tag(this.tag);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(15)),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
