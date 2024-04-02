import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<Map<String, dynamic>> problems = [
  {
    "title": "1. Two sum",
    "status": "solved",
    "difficulty": "easy",
    "tags": ["String"],
  },
  {
    "title": "2. Add two numbers",
    "status": "solved",
    "difficulty": "medium",
    "tags": ["Array", "Hash Table"],
  },
  {
    "title": "3. Longest substring without repeating characters",
    "status": "done",
    "difficulty": "medium",
    "tags": ["Hash Table", "String", "Sliding Window"],
  },
  {
    "title": "4. Median of Two Sorted Arrays",
    "status": "attempted",
    "difficulty": "hard",
    "tags": ["Array", "Binary Search", "Divide and Conquer"],
  },
  {
    "title": "5. Longest Palindromic Substring",
    "status": "solved",
    "difficulty": "medium",
    "tags": ["String", "Dynamic Programming"],
  },
  {
    "title": "6. Zigzag conversion",
    "status": "attempted",
    "difficulty": "medium",
    "tags": ["String"],
  },
];

class ProblemsListScreen extends StatelessWidget {
  const ProblemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SearchBar(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(42, 42, 42, 1),
                ),
                surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
                leading: const Icon(Icons.search, color: Colors.white),
                hintText: "Search problems",
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                  shrinkWrap: true,
                  itemCount: problems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0.0,
                      child: ListTile(
                        onTap: () => context.goNamed("problem"),
                        contentPadding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 12.0, 0.0),
                        leading: switch (problems[index]["status"]) {
                          "solved" => const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          "attempted" => const Icon(
                              Icons.rotate_left,
                              color: Colors.yellow,
                            ),
                          _ => const SizedBox(),
                        },
                        title: Text(
                          problems[index]["title"],
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        trailing: switch (problems[index]["difficulty"]) {
                          "easy" => Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "E",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          "medium" => Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "M",
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                            ),
                          "hard" => Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "H",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          _ => const SizedBox(),
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
