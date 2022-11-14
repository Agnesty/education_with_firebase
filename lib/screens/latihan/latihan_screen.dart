import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/latihan/components/tab_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatihanScreen extends StatefulWidget {
  const LatihanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LatihanScreen> createState() => _LatihanScreenState();
}

class _LatihanScreenState extends State<LatihanScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
     PembahasanCtr _pembahasanCtr = Get.find();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFB475F).withOpacity(.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Yuk Latihan!",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20.0),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Astronomi.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Pilihan Tab Bar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Color(0xFFFB475F).withOpacity(.8),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: [
                      Tab(text: "IPA"),
                      Tab(text: "Matematika"),
                    ]),
              ),
            ),
            // Search Box

            SizedBox(height: 20),
            //Pilihan Tab Bar View
            Container(
              height: 510,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                  itemCount: _pembahasanCtr.allPapers.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TabCard(
                            model1: _pembahasanCtr.allPapers[index],
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: _pembahasanCtr.allPapers.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TabCard(
                            model1: _pembahasanCtr.allPapers[index],
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
