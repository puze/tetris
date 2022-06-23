import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris/block.dart';
import 'package:tetris/game_controller.dart';

class GameSreen extends StatelessWidget {
  GameSreen({Key? key}) : super(key: key);
  final GameController gameController = Get.put(GameController());
  final Block block = Block();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: 300, child: viewGameArea()),
    );
  }

  Widget viewGameArea() {
    return GridView.builder(
        itemCount: GameController.column * GameController.row,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, childAspectRatio: 1),
        itemBuilder: _buildGirdItem);
  }

  Widget _buildGirdItem(BuildContext context, int index) {
    return GetX<GameController>(
      builder: (gameController) {
        int gameAreaLength = gameController.gameArea.length;
        int x = (index % gameAreaLength);
        int y = (index / gameAreaLength).floor();
        return block.resources[gameController.gameArea[x][y]]!;
      },
    );
  }
}
