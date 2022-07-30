import 'package:elred/presentation/home/widgets/custom_sliver.dart';
import 'package:elred/presentation/home/widgets/todo_tile.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomLayerWidget extends StatelessWidget {
  const BottomLayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TvText("Current Todos"),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
          TodoTileWidget(),
        ],
      ),
    );
  }
}
