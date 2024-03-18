import 'package:ex10_progress_bar/ProgressController.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatefulWidget {
  final ProgressController controller;

  ProgressView({required this.controller});

  @override
  _ProgressViewState createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.controller.model.checkbox1,
          onChanged: (value) {
            setState(() {
              widget.controller.updateBox1(value!);
            });
          },
        ),
        Checkbox(
          value: widget.controller.model.checkbox2,
          onChanged: (value) {
            setState(() {
              widget.controller.updateBox2(value!);
            });
          },
        ),
        LinearProgressIndicator(
          value: widget.controller.model.progress,
        ),
      ],
    );
  }
}
