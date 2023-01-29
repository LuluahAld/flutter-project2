import 'package:Labayh/models/program.dart';
import 'package:flutter/material.dart';

import '../components/program_card.dart';
import '../constants.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

List<bool> isSelected = [true, false];
PageController controller = PageController();

class _ProgramPageState extends State<ProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ToggleButtons(
                selectedColor: Colors.white,
                fillColor: const Color.fromARGB(255, 72, 109, 245),
                renderBorder: false,
                onPressed: (int index) {
                  setState(() {
                    if (index == 1) {
                      controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    } else {
                      controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'All Programs',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'My Programs',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  AllPrograms(
                    program: programs,
                    text: '',
                  ),
                  AllPrograms(
                    program: programs_added,
                    text: 'last',
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class AllPrograms extends StatelessWidget {
  final List program;
  final String text;
  const AllPrograms({Key? key, required this.program, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(
          height: 16,
        ),
        for (var program in program)
          ProgramContainer(
            program: program,
            text: text,
          ),
      ],
    );
  }
}
