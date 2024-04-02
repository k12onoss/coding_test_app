import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const Map<String, dynamic> problem = {
  "title": "1. Two Sum",
  "difficulty": "easy",
  "status": "solved",
  "tags": ["Hash Map", "Binary Search"],
  "description":
      "Given an array of integers `nums` and an integer `target`, return *indices of the two numbers such that they add up to `target`*.\n\nYou may assume that each input would have ***exactly* one solution**, and you may not use the *same* element twice.\n\nYou can return the answer in any order.",
  "examples":
      "**Example 1:**\n> **Input:** nums = [2,7,11,15], target = 9\n> **Output:** [0,1]\n> **Explanation:** Because nums[0] + nums[1] == 9, we return [0, 1].\n\n\n**Example 2:**\n> **Input:** nums = [3,2,4], target = 6\n> **Output:** [1,2]\n\n\n**Example 3:**\n> **Input:** nums = [3,3], target = 6\n> **Output:** [0,1]",
  "constraints":
      "**Constraints:**\n\n+ `2 <= nums.length <= 104`\n+ `-109 <= nums[i] <= 109`\n+ `-109 <= target <= 109`\n+ **Only one valid answer exists.**",
};

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final markdownStyleSheet = MarkdownStyleSheet(
      p: const TextStyle(color: Colors.white),
      code: const TextStyle(color: Colors.white54),
      blockquoteDecoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          left: BorderSide(
            color: Color.fromRGBO(42, 42, 42, 1),
            width: 2.0,
          ),
        ),
      ),
      listBullet: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              problem["title"],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                switch (problem["difficulty"]) {
                  "easy" => const Text(
                      "Easy",
                      style: TextStyle(color: Colors.teal),
                    ),
                  "medium" => const Text(
                      "Medium",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  "hard" => const Text(
                      "Hard",
                      style: TextStyle(color: Colors.red),
                    ),
                  _ => const SizedBox(),
                },
                const SizedBox(width: 20.0),
                switch (problem["status"]) {
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
                const SizedBox(width: 20.0),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  color: const Color.fromRGBO(42, 42, 42, 1),
                  itemBuilder: (context) {
                    return List.generate(
                      problem["tags"].length,
                      (index) => PopupMenuItem(
                        child: Text(
                          problem["tags"][index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Tags",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            MarkdownBody(
              selectable: true,
              data: problem["description"],
              styleSheet: markdownStyleSheet,
            ),
            const SizedBox(height: 20.0),
            MarkdownBody(
              selectable: true,
              data: problem["examples"],
              styleSheet: markdownStyleSheet,
            ),
            const SizedBox(height: 20.0),
            MarkdownBody(
              selectable: true,
              data: problem["constraints"],
              styleSheet: markdownStyleSheet,
            ),
          ],
        ),
      ),
    );
  }
}
