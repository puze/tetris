import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tetris/block.dart';
import 'package:tetris/block_object.dart';
import 'package:tetris/block_type.dart';

class GameController extends GetxController {
  static int column = 10;
  static int row = 20;
  static int frameTime = 16;
  static int fixedFallenTIme = 1000;

  var gameArea = List.generate(
      column,
      (index) => List.generate(
            row,
            (index) => BlockType.none,
          )).obs;

  @override
  void onInit() async {
    super.onInit();
    while (true) {
      updateController();
      await Future.delayed(Duration(milliseconds: frameTime));
    }
  }

  void updateController() {
    autoFallObject();
  }

  int fallenTime = 0;
  int index = 0;
  void autoFallObject() {
    fallenTime += frameTime;
    if (fallenTime <= fixedFallenTIme) {
      return;
    }

    fallenTime = 0;
    index++;
    debugPrint('autoFallObject : $index');
  }

  void choiceBlock() {
    BlockObject.getBlockObject(BlockType.t)!;
  }
}
