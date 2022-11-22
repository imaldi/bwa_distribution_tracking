import 'package:flutter/material.dart';

import '../../../core/resources/consts/colors.dart';
import '../../../core/resources/consts/sizes.dart';
import '../container/rounded_container.dart';

class MyPaginator extends StatefulWidget {
  final int pageLength;
  final Function(int) onPageChanged;
  const MyPaginator({required this.pageLength, required this.onPageChanged, Key? key}) : super(key: key);

  @override
  State<MyPaginator> createState() => _MyPaginatorState();
}

class _MyPaginatorState extends State<MyPaginator> {
  var selectedIndex = 1;
  var targetKey = <GlobalKey>[];
  @override
  void initState() {
    super.initState();
    targetKey = List<GlobalKey>.generate(widget.pageLength, (index) => GlobalKey());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            width: double.infinity,
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemCount: widget.pageLength,
              itemBuilder: (BuildContext context, int i) {
                // if (i == 0 || i == widget.pageLength + 1) {
                //   return const RoundedContainer(
                //     sizeNormal,
                //     boxDecoration:
                //     BoxDecoration(color: Colors.transparent),
                //     child: Icon(
                //       Icons.do_not_disturb_on_total_silence,
                //       color: Colors.white,
                //       size: 32,
                //     ),
                //   );
                // }
                return InkWell(
                  onTap: (){
                    setState(() {
                      selectedIndex = i;
                      widget.onPageChanged(i);
                    });
                  },
                  child: Container(
                    key: targetKey[i],
                    color: selectedIndex == i ? primaryColor : null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: sizeNormal),
                      child: Center(child: Text("${i + 1}",style: TextStyle(color: selectedIndex == i ? Colors.white : Colors.black),))),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    if(selectedIndex > 1){
                      selectedIndex--;
                      widget.onPageChanged(selectedIndex);
                      Scrollable.ensureVisible(
                        targetKey[selectedIndex].currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        alignment: 32,
                        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
                      );
                    }
                  });
                },
                child: const RoundedContainer(
                  sizeNormal,
                  boxDecoration:
                  BoxDecoration(color: primaryColor),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    if(selectedIndex < widget.pageLength){
                      selectedIndex++;
                      widget.onPageChanged(selectedIndex);
                      Scrollable.ensureVisible(
                        targetKey[selectedIndex].currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        alignment: 32,
                        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
                      );
                    }
                  });
                },
                child: const RoundedContainer(
                  sizeNormal,
                  // padding: const EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  boxDecoration:
                  BoxDecoration(color: primaryColor),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
    ;
  }
}
