import 'dart:ui';

import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:elred/common/extensions/date_extensions.dart';

class ToplayerWidget extends StatelessWidget with PreferredSizeWidget {
  const ToplayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        // Stack(
        //   children: [
        //     Container(
        //       height: 0.35.sh,
        //       decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           image: DecorationImage(
        //               image: AssetImage(
        //             AppImages.hills,
        //           ))),
        //     ),
        //     Container(
        //       height: 0.35.sh,
        //       color: Colors.blue.shade100,
        //     )
        //   ],
        // );
        Container(
      height: 0.35.sh,
      child: Stack(
        children: <Widget>[
          ConstrainedBox(
            child: Image.asset(
              AppImages.hills,
              fit: BoxFit.cover,
            ),
            constraints: BoxConstraints.expand(),
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 0),
                        child: Container(
                            decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                        )),
                      ),
                    ),
                    Container(
                      height: 5.h,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 0),
                    child: Container(
                        decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.4),
                    )),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    // height: 0.08.sh,
                    width: double.infinity,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    // color: Colors.blueGrey,
                    // height: 0.15.sh,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 0.3.sw,
                          child: TvText(
                            "Your Things",
                            color: Colors.white.withOpacity(0.9),
                            alignment: TextAlign.left,
                            fontSize: 30.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: SizedBox(
                              width: 0.5.sw,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TvText(
                                        "25",
                                        isHeading: true,
                                        color: Colors.white,
                                        fontSize: 25.sp,
                                      ),
                                      TvText(
                                        "Personal",
                                        isHeading: true,
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 15.sp,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TvText(
                                        "15",
                                        isHeading: true,
                                        color: Colors.white,
                                        fontSize: 25.sp,
                                      ),
                                      TvText(
                                        "Business",
                                        isHeading: true,
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 15.sp,
                                      )
                                    ],
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    // height: 0.11.sh,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TvText(
                          DateTime.now().dateTostring,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: 0.3.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  strokeWidth: 2,
                                  backgroundColor: Colors.blue.shade100,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.blue),
                                ),
                              ),
                              TvText(
                                "65% done",
                                color: Colors.white54,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 0.35.sh);
}
