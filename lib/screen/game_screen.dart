import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris/block_widget.dart';
import 'package:tetris/enum_class.dart';
import 'package:tetris/game_controller.dart';

class GameSreen extends StatelessWidget {
  GameSreen({Key? key}) : super(key: key);
  final GameController gameController = Get.put(GameController());
  final BlockWidget block = BlockWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 250,
          child: Column(
            children: [viewGameArea(), inputFiled()],
          )),
    );
  }

  Widget viewGameArea() {
    return Expanded(
      child: GridView.builder(
        itemCount: GameController.column * GameController.row,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, childAspectRatio: 1),
        itemBuilder: _buildGirdItem,
        reverse: true,
      ),
    );
  }

  Widget _buildGirdItem(BuildContext context, int index) {
    // return GetX<GameController>(
    //   builder: (_) {
    //     int gameAreaLength = gameController.gameArea.length;
    //     int x = (index % gameAreaLength);
    //     int y = (index / gameAreaLength).floor();
    //     return block.resources[gameController.gameArea[x][y]]!;
    //   },
    // );

    int gameAreaLength = gameController.gameArea.length;
    int x = (index % gameAreaLength);
    int y = (index / gameAreaLength).floor();
    return Obx(() => block.resources[gameController.gameArea[x][y].blockType]!);
  }

  Widget inputFiled() {
    return Row(
      children: [
        ElevatedButton(
            onPressed: (() => gameController.inputDirection(Direction.left)),
            child: Text('left')),
        ElevatedButton(
            onPressed: (() => gameController.inputDirection(Direction.right)),
            child: Text('right')),
      ],
    );
  }
}
