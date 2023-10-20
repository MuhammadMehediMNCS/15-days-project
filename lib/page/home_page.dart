import 'package:flutter/material.dart';
import 'package:hive_app_1/page/add_note_info_page.dart';
import 'package:hive_app_1/page/bin_page.dart';
import 'package:hive_app_1/page/complete_page.dart';
import 'package:hive_app_1/page/notes_page.dart';
import 'package:hive_app_1/page/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notes'),
        bottom: TabBar(
          controller: controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 18),
          tabs: [
            buildTabs('My Notes'),
            buildTabs('Task Completed')
          ]
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          NotesPage(),
          CompletePage()
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNoteInfoPage()));
        }
      ),
    );
  }

  Widget buildTabs(String title) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Tab(
          text: title,
        )
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.deepPurple,
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserPage()));
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
        ),
        child: Column(
          children: [],
        ),
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.delete_forever_outlined),
          title: const Text('Recycle Bin'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BinPage()));
          },
        )
      ],
    ),
  );
}