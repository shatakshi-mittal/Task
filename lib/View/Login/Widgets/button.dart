import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double? width;

  const SubmitButton(
      {Key? key, required this.title, required this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      highlightColor: Colors.white,
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: width ?? MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
