import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListShimmer extends StatefulWidget {
  final String? type;
  const ListShimmer({this.type});

  @override
  _ListShimmerState createState() => _ListShimmerState();
}

class _ListShimmerState extends State<ListShimmer> {
  @override
  Widget build(BuildContext context) {
    return new OrientationBuilder(
      builder: (context, orientation) {
        return widget.type == 'horizontal'
            ? SizedBox(
            width: ScreenUtil().screenWidth,
            height: orientation == Orientation.portrait
                ? 2 * ScreenUtil().screenHeight * .25
                : ScreenUtil().screenHeight * .25,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: kInactiveColor,
                    highlightColor: Colors.grey[350]!,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Container(
                        height: ScreenUtil().screenWidth  * 0.50,
                        width:ScreenUtil().screenWidth * 0.25,
                        decoration: BoxDecoration(
                            color: kInactiveColor,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ));
              },
            ))
            : GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .9000,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                  baseColor: kInactiveColor,
                  highlightColor: Colors.grey[350]!,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: ScreenUtil().screenWidth * 0.25,
                      width: ScreenUtil().screenWidth * 0.25,
                      decoration: BoxDecoration(
                          color: kInactiveColor,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ));
            });
      },
    );

  }
}
