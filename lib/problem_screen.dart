import 'package:coding_test_app/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void onChange(int index) {
    _pageController.jumpToPage(index);
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.white,
              labelPadding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 8.0),
              // indicatorColor: Colors.amber,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0.0,
              onTap: onChange,
              tabs: const [
                Row(children: [
                  Icon(Icons.description),
                  SizedBox(width: 4.0),
                  Text("Description"),
                ]),
                Row(children: [
                  Icon(Icons.menu_book),
                  SizedBox(width: 4.0),
                  Text("Editorial"),
                ]),
                Row(children: [
                  Icon(Icons.question_answer),
                  SizedBox(width: 4.0),
                  Text("Solutions"),
                ]),
                Row(children: [
                  Icon(Icons.rotate_left),
                  SizedBox(width: 4.0),
                  Text("Submissions"),
                ]),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  DescriptionScreen(),
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed("code"),
        tooltip: "Code Editor",
        child: const Icon(Icons.code),
      ),
    );
  }
}
