import 'package:tetris/block_type.dart';
import 'package:tetris/enum_class.dart';
import 'package:tetris/position.dart';

class BlockObject {
  BlockType blockType = BlockType.none;
  Position worldPosition = Position.zero();
  Position localPosition = Position.zero();
  Direction direction = Direction.up;
  late List<List<BlockType>> blockData;
  int id;

  BlockObject(
      {required this.id,
      required this.blockType,
      required this.worldPosition}) {
    blockData = getBlockObject(blockType)!;
  }

  List<List<BlockType>>? getBlockObject(BlockType blockType) {
    switch (blockType) {
      case BlockType.none:
        return [
          [BlockType.none]
        ];
      case BlockType.i:
        return [
          [BlockType.i],
          [BlockType.i],
          [BlockType.i],
          [BlockType.i]
        ];
      case BlockType.o:
        return [
          [BlockType.o, BlockType.o],
          [BlockType.o, BlockType.o]
        ];
      case BlockType.t:
        return [
          [BlockType.none, BlockType.t, BlockType.none],
          [BlockType.t, BlockType.t, BlockType.t],
        ];
      case BlockType.l:
        return [
          [BlockType.none, BlockType.none, BlockType.l],
          [BlockType.l, BlockType.l, BlockType.l],
        ];
      case BlockType.j:
        return [
          [BlockType.j, BlockType.none, BlockType.none],
          [BlockType.j, BlockType.j, BlockType.j],
        ];
      case BlockType.s:
        return [
          [BlockType.none, BlockType.s, BlockType.s],
          [BlockType.s, BlockType.s, BlockType.none],
        ];
      case BlockType.z:
        return [
          [BlockType.z, BlockType.z, BlockType.none],
          [BlockType.none, BlockType.z, BlockType.z],
        ];
    }
  }
}
