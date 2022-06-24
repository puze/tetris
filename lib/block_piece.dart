import 'package:tetris/block_type.dart';

class BlockPiece {
  int id;
  BlockType blockType;
  BlockState blockState = BlockState.none;

  BlockPiece(this.id, this.blockType, this.blockState);
}
