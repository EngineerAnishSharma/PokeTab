import 'const/colors.dart';
import 'const/landscape_container.dart';
import 'const/portait_continer.dart';
import 'const/rowStyling.dart';
import 'const/stat_row.dart';
import 'package:flutter/material.dart';

import 'const/text_style.dart';
class DetailsScreen extends StatelessWidget {
  final dynamic data;

  const DetailsScreen({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: orientation == Orientation.portrait ? portraitContainer(data) : landspaceContainer(data),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const TabBar(labelColor: black, unselectedLabelColor: grey, tabs: [
                      Tab(text: "About"),
                      Tab(text: "Base Stats"),
                    ]),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              normalText(color: black, size: 16, text: data['xdescription']),
                              const SizedBox(
                                height: 10,
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: width - 100,
                                  child: Card(
                                    color: lightGrey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              headingText(color: grey, size: 16, text: "Height"),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              headingText(color: grey, size: 16, text: data['height']),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              headingText(color: grey, size: 16, text: "Weight"),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              headingText(color: grey, size: 16, text: data['weight']),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              headingText(color: black, size: 16, text: "Breeding"),
                              const SizedBox(
                                height: 10,
                              ),
                              rowStyling(text: "Male percentage", value: data['male_percentage'].toString()),
                              rowStyling(text: "Female percentage", value: data['female_percentage'].toString()),
                              rowStyling(text: "Egg Cycle", value: data['cycles'].toString()),
                              rowStyling(text: "Category", value: data['category'].toString()),
                              rowStyling(text: "Ability", value: data['abilities'].toString()),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              statRow(text: "HP", value: data['hp'].toString()),
                              statRow(text: "Attack", value: data['attack'].toString()),
                              statRow(text: "Defense", value: data['defense'].toString()),
                              statRow(text: "Speed", value: data['speed'].toString()),
                              statRow(text: "Power", value: data['special_attack'].toString()),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}