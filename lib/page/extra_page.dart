import 'package:flutter/material.dart';

class ExtraPage extends StatefulWidget {
  const ExtraPage({super.key});

  @override
  State<ExtraPage> createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'My Note'),
                Tab(text: 'Task Completed',)
              ]
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            child: TabBarView(
              controller: tabController,
              children: const [
                Text('1'),
                Text('2')
              ]
            ),
          )
        ],
      ),
    );
  }
}