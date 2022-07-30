import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/home/widgets/bottom_layer_widget.dart';
import 'package:elred/presentation/home/widgets/custom_sliver.dart';
import 'package:elred/presentation/home/widgets/top_layer_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 1.0)
      ..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    // if (_scrollController.offset >=
    //         _scrollController.position.maxScrollExtent &&
    //     !_scrollController.position.outOfRange) {
    //   // _venuesCubit.fetchAllVenues(
    //   //   "0",
    //   //   _categoryid,
    //   // );
    // }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: CustomScrollView(
        // controller: _scrollController,
        shrinkWrap: true,
        slivers: [
          // SliverPersistentHeader(
          //     pinned: true,
          //     delegate: CustomSliverDelegate(
          //       maxHeight: 0.33.sh,
          //       child: ToplayerWidget(),
          //     )),
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      AppImages.drawer,
                      color: Colors.white,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: ToplayerWidget(),
            ),
            expandedHeight: 0.33.sh,
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BottomLayerWidget();
            },
          ))

          // BottomLayerWidget(),
        ],
      ),
    );
  }
}
