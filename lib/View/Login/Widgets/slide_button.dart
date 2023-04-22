import 'dart:developer';

import 'package:flutter/material.dart';

class SlideButton extends StatelessWidget {
  final PageController pageController;
  final int pageIndex;
  final String labelFirst;
  final String labelSecond;
  final double? textSize;
  final double? horizontalPadding;
  final double? verticalPadding;

  const SlideButton({
    Key? key,
    required this.pageController,
    required this.pageIndex,
    required this.labelFirst,
    required this.labelSecond,
    this.horizontalPadding,
    this.verticalPadding,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 3),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                log("pageIndex : $pageIndex");
                pageController.animateToPage(0,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 500));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? 15,
                    horizontal: horizontalPadding ?? 20),
                decoration: BoxDecoration(
                  color: pageIndex == 1 ? Colors.white : Colors.red,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(26),
                      bottomRight: Radius.circular(26)),
                ),
                child: Text(
                  labelFirst,
                  textAlign: TextAlign.center,
                  style: pageIndex == 1
                      ? TextStyle(
                          color: Colors.red,
                          fontSize: textSize,
                          fontWeight: FontWeight.w500)
                      : TextStyle(
                          color: Colors.white,
                          fontSize: textSize,
                          fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                log("pageIndex : $pageIndex");
                pageController.animateToPage(1,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 500));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? 15,
                    horizontal: horizontalPadding ?? 20),
                decoration: BoxDecoration(
                  color: pageIndex == 0 ? Colors.white : Colors.red,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(26),
                      bottomRight: Radius.circular(26)),
                ),
                child: Text(
                  labelSecond,
                  textAlign: TextAlign.center,
                  style: pageIndex == 0
                      ? TextStyle(
                          color: Colors.red,
                          fontSize: textSize,
                          fontWeight: FontWeight.w500)
                      : TextStyle(
                          color: Colors.white,
                          fontSize: textSize,
                          fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
