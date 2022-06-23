import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetris/block_type.dart';

class Block {
  Map<BlockType, Widget> resources = Map.identity();
  Block() {
    resources[BlockType.none] = Container(
      color: Colors.grey,
    );
    resources[BlockType.i] = Container(
      color: Colors.lightBlue,
    );
    resources[BlockType.o] = Container(
      color: Colors.yellow,
    );
    resources[BlockType.t] = Container(
      color: Colors.purple,
    );
    resources[BlockType.l] = Container(
      color: Colors.orange,
    );
    resources[BlockType.j] = Container(color: Colors.blue);
    resources[BlockType.s] = Container(
      color: Colors.green,
    );
    resources[BlockType.z] = Container(
      color: Colors.red,
    );
  }
}
