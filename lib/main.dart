import 'package:flutter/material.dart';
import 'package:poke_app/api_services.dart';
import 'package:poke_app/splash_screen.dart';

import 'const/colors.dart';
import 'const/poke_type_container.dart';
import 'const/text_style.dart';
import 'details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "circula",
      ),

      home:SplashScreen(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "PokeApp",
                style: TextStyle(
                  fontFamily: "circula_bold",
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder(
                  future: getAPI(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    var data=snapshot.data;

                    if(snapshot.hasData){

                      return GridView.builder(

                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: width < 600
                                  ? 2
                                  : width < 1100
                                  ? 4
                                  : 6,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          data: data[index],
                                        )));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -20,
                                        right: -20,
                                        child: Image.asset(
                                          "assets/pokeball.png",
                                          width: 150,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 8,
                                        child: Image.network(
                                          data[index]["imageurl"],
                                          width: 150,
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            headingText(color: Colors.white, size: 24, text: data[index]['name']),
                                            typeContainer(
                                              color: Colors.white,
                                              size: 16,
                                              text: data[index]['typeofpokemon'][0],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            typeContainer(
                                              color: Colors.white,
                                              size: 16,
                                              text: data[index]['typeofpokemon'].length==2?
                                              data[index]['typeofpokemon'][1]:"No type",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          });
                    }else{
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Colors.grey,
                          ),
                        ),
                      );
                    }

                  },

                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

