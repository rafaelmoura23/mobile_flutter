import 'package:ex10_progress_bar/ProgressController.dart';
import 'package:ex10_progress_bar/ProgressModel.dart';
import 'package:ex10_progress_bar/ProgressView.dart';
import 'package:flutter/material.dart';

void main() {
  ProgressModel model = ProgressModel();
  ProgressController controller = ProgressController(model);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator Example'),
      ),
      body: ProgressView(controller: controller),
    ),
  ));
}
