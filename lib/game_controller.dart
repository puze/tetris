import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tetris/block_piece.dart';
import 'package:tetris/block_widget.dart';
import 'package:tetris/block_object.dart';
import 'package:tetris/block_type.dart';
import 'package:tetris/position.dart';
import 'package:vector_math/vector_math.dart';

import 'enum_class.dart';

class GameController extends GetxController {
  static int column = 10;
  static int row = 20;
  static int frameTime = 16;
  static int fixedFallenTIme = 200;
  static Position initBlockPosition = Position(5, 18);
  late BlockObject currentBlock;
  int globalBlockId = 0;
  bool isGame = false;

  var gameArea = List.generate(
      column,
      (index) => List.generate(
            row,
            (index) => BlockPiece(-1, BlockType.none, BlockState.none),
          )).obs;

  @override
  void onInit() async {
    super.onInit();
    createBlock();
    isGame = true;
    while (isGame) {
      updateController();
      await Future.delayed(Duration(milliseconds: frameTime));
    }
  }

  void updateController() {
    autoFallObject();
    renderingCurrentBlock();
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
    // debugPrint('autoFallObject : $index');

    if (determinCollision(Position(
        currentBlock.worldPosition.x, currentBlock.worldPosition.y - 1))) {
      fixCurrentBlock();
    } else {
      currentBlock.worldPosition = Position(
          currentBlock.worldPosition.x, currentBlock.worldPosition.y - 1);
    }
  }

  void createBlock() {
    if (gameArea[initBlockPosition.x][initBlockPosition.y].blockType !=
        BlockType.none) {
      loseGame();
      return;
    }

    int blockTypeNum = Random().nextInt(7) + 1;
    currentBlock = BlockObject(
        id: globalBlockId++,
        blockType: BlockType.values[blockTypeNum],
        worldPosition: initBlockPosition);
  }

  void renderingCurrentBlock() {
    // 기존 블록 제거
    for (int i = 0; i < column; i++) {
      for (int j = 0; j < row; j++) {
        if (gameArea[i][j].blockState == BlockState.active) {
          gameArea[i][j].blockState = BlockState.none;
          gameArea[i][j].blockType = BlockType.none;
        }
      }
    }

    for (int i = 0; i < currentBlock.blockData.length; i++) {
      for (int j = 0; j < currentBlock.blockData[0].length; j++) {
        if (currentBlock.blockData[i][j] != BlockType.none) {
          setGameArea(currentBlock.worldPosition.x + i,
              currentBlock.worldPosition.y + j, currentBlock.blockData[i][j]);
        }
      }
    }
  }

  void fixCurrentBlock() {
    for (int i = 0; i < column; i++) {
      for (int j = 0; j < row; j++) {
        gameArea[i][j].blockState = BlockState.none;
      }
    }
    createBlock();
  }

  bool determinCollision(Position nextPosition) {
    debugPrint('next position : (${nextPosition.x},${nextPosition.y})');

    for (int i = 0; i < currentBlock.blockData.length; i++) {
      for (int j = 0; j < currentBlock.blockData[0].length; j++) {
        // 게임영역 판정
        if (nextPosition.x + i < 0 ||
            nextPosition.x + i >= column ||
            nextPosition.y + j < 0 ||
            nextPosition.y + j >= row) {
          return true;
        }

        // 블록 판정
        var currentCell = gameArea[nextPosition.x + i][nextPosition.y + j];
        if (currentBlock.blockData[i][j] != BlockType.none &&
            currentCell.blockType != BlockType.none &&
            currentCell.blockState != BlockState.active) {
          return true;
        }
      }
    }
    return false;
  }

  void loseGame() {
    debugPrint('game over');
    isGame = false;
  }

  void setGameArea(int x, int y, BlockType blockType) {
    if (y >= row) return;
    gameArea[x][y] = BlockPiece(globalBlockId, blockType, BlockState.active);
    gameArea.refresh();
  }

  void inputDirection(Direction direction) {
    switch (direction) {
      case Direction.up:
        // TODO: Handle this case.
        break;
      case Direction.down:
        // TODO: Handle this case.
        break;
      case Direction.left:
        Position nextPosition = Position(
            currentBlock.worldPosition.x - 1, currentBlock.worldPosition.y);
        if (!determinCollision(nextPosition)) {
          currentBlock.worldPosition = nextPosition;
        }
        break;
      case Direction.right:
        Position nextPosition = Position(
            currentBlock.worldPosition.x + 1, currentBlock.worldPosition.y);
        if (!determinCollision(nextPosition)) {
          currentBlock.worldPosition = nextPosition;
        }
        break;
    }
  }
}
