import 'package:flutter/material.dart';
import 'package:ex10_progress_bar/ProgressModel.dart';


class ProgressController {
  ProgressModel model;

  ProgressController(this.model);

  void updateBox1(bool value) {
    model.checkbox1 = value;
    updateProgress();
  }

  void updateBox2(bool value) {
    model.checkbox2 = value;
    updateProgress();
  }

  void updateProgress() {
    if (model.checkbox1 && model.checkbox2) {
      model.progress = 1.0;
    } else if(model.checkbox1 || model.checkbox2) {
      model.progress = 0.5;
    } else {
      model.progress = 0.0;
    }
  }
}