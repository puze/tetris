import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tetris/block.dart';
import 'package:tetris/block_type.dart';

class GameController extends GetxController {
  final int column = 10;
  final int row = 20;
  late RxList<List<BlockType>> gameArea;

  @override
  void onInit() {
    gameArea = List.generate(
        row,
        (index) => List.generate(
              column,
              (index) => BlockType.none,
            )).obs;
    super.onInit();
  }
}
