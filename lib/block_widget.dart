import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetris/block_type.dart';

class BlockWidget {
  Map<BlockType, Widget> resources = Map.identity();
  BlockWidget() {
    resources[BlockType.none] = _item(Colors.grey);
    resources[BlockType.i] = _item(Colors.lightBlue[100]!);
    resources[BlockType.o] = _item(Colors.yellow);
    resources[BlockType.t] = _item(Colors.purple);
    resources[BlockType.l] = _item(Colors.orange);
    resources[BlockType.j] = _item(Colors.blue[700]!);
    resources[BlockType.s] = _item(Colors.green);
    resources[BlockType.z] = _item(Colors.red);
  }

  Widget _item(Color color) {
    return Container(
      margin: const EdgeInsets.all(1),
      color: color,
    );
  }
}
