import 'package:Labayh/models/program.dart';
import 'package:flutter/material.dart';

class ProgramContainer extends StatefulWidget {
  final Program program;
  final String text;
  const ProgramContainer({Key? key, required this.program, required this.text}) : super(key: key);

  @override
  State<ProgramContainer> createState() => _ProgramContainerState();
}

class _ProgramContainerState extends State<ProgramContainer> {
  @override
  Widget build(BuildContext context) {
    Widget button;
    Widget divider;
    if (widget.text == 'last') {
      button = const Text('');
      divider = const Text('');
    } else {
      button = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.program.price} SAR',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 109, 245),
            ),
            onPressed: () {
              programs_added.add(widget.program);
              setState(() {});
            },
            child: const Text('Join Now'),
          )
        ],
      );
      divider = const Divider(
        thickness: 1,
      );
    }
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.blueGrey.withOpacity(0.3),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.program.img),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.program.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('${widget.program.milestones} Milestones'),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    divider,
                    const SizedBox(
                      height: 12,
                    ),
                    button
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
