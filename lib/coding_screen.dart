import 'package:coding_test_app/code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:highlight/highlight.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/rust.dart';
import 'package:highlight/languages/typescript.dart';

const String initialText = '''
  class Solution {
    List<int> twoSum(List<int> nums, int target) {
      
    }
  }
''';

final languageList = [
  "Dart",
  "Java",
  "cpp",
  "Python",
  "Rust",
  "JavaScript",
  "TypeScript",
];

final Map<String, Mode> languageMap = {
  "Dart": dart,
  "Java": java,
  "cpp": cpp,
  "Python": python,
  "Rust": rust,
  "JavaScript": javascript,
  "TypeScript": typescript,
};

class CodingScreen extends StatefulWidget {
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen>
    with TickerProviderStateMixin {
  Mode currLanguage = dart;

  final CodeController codeController = CodeController(
    text: initialText,
    language: java,
    analyzer: DartPadAnalyzer(),
  );

  final DraggableScrollableController draggableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: DropdownButton(
          style: const TextStyle(color: Colors.white),
          underline: const SizedBox(),
          value: currLanguage,
          items: List.generate(
            languageList.length,
            (index) => DropdownMenuItem(
              value: languageMap[languageList[index]],
              child: Text(languageList[index]),
            ),
          ),
          onChanged: (lang) {
            setState(() {
              currLanguage = lang!;
              codeController.setLanguage(
                currLanguage,
                analyzer: currLanguage == dart
                    ? DartPadAnalyzer()
                    : const DefaultLocalAnalyzer(),
              );
            });
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color.fromRGBO(42, 42, 42, 1),
                    surfaceTintColor: Colors.transparent,
                    content: const Text(
                      "This test is monitored for plagiarism. Submitted code will be compared against a large database to ensure originality.  Cheating will not be tolerated.",
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Understood"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.warning, color: Colors.red),
            label: const Text(
              "Plagiarism Warning",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          CodeTheme(
            data: CodeThemeData(styles: draculaTheme),
            child: CodeField(
              controller: codeController,
              expands: true,
              wrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
          DraggableScrollableSheet(
            controller: draggableController,
            initialChildSize: 0.07,
            minChildSize: 0.07,
            maxChildSize: 0.5,
            shouldCloseOnMinExtent: false,
            snap: true,
            snapSizes: const [0.07, 0.2, 0.5],
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  color: const Color.fromRGBO(42, 42, 42, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BlocBuilder<CodeBloc, SubmissionStatus>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => draggableController.jumpTo(0.5),
                                child: const Text(
                                  "Testcases",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Spacer(),
                              TextButton.icon(
                                onPressed: () {
                                  draggableController.jumpTo(0.5);
                                  context.read<CodeBloc>().runCode();
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                icon: const Icon(Icons.play_arrow),
                                label: const Text("Run"),
                              ),
                              const Text(
                                "|",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  draggableController.jumpTo(0.5);
                                  context.read<CodeBloc>().submitCode();
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.teal),
                                ),
                                icon: const Icon(Icons.cloud_upload),
                                label: const Text("Submit"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          if (state == SubmissionStatus.initial)
                            const Text(
                              "Case 1",
                              style: TextStyle(color: Colors.white),
                            ),
                          if (state == SubmissionStatus.initial)
                            const SizedBox(height: 16.0),
                          if (state == SubmissionStatus.initial)
                            TextFormField(
                              initialValue: "9\n[2,7,11,15]",
                              style: const TextStyle(color: Colors.white),
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          if (state == SubmissionStatus.initial)
                            const SizedBox(height: 20.0),
                          if (state == SubmissionStatus.initial)
                            const Text(
                              "Case 2",
                              style: TextStyle(color: Colors.white),
                            ),
                          if (state == SubmissionStatus.initial)
                            const SizedBox(height: 16.0),
                          if (state == SubmissionStatus.initial)
                            TextFormField(
                              initialValue: "6\n[3,2,4]",
                              style: const TextStyle(color: Colors.white),
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          if (state == SubmissionStatus.running ||
                              state == SubmissionStatus.submitting)
                            const Expanded(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          if (state == SubmissionStatus.runSuccess)
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Your code ran successfully",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          if (state == SubmissionStatus.submitSuccess)
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Your code submitted successfully",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
