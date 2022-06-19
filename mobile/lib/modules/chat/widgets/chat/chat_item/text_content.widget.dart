import 'package:flutter/material.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/data/models/message.model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextContent extends StatelessWidget {
  final MessageModel message;
  final bool isSender;

  const TextContent({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: message.deleted
            ? Palette.gray300
            : (isSender ? Palette.blue300 : Colors.white),
        borderRadius: isSender
            ? const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
      ),
      child: Text(
        message.realContent,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 17.sp,
          fontFamily: FontFamily.fontNunito,
          color: message.deleted
              ? Colors.white
              : (isSender ? Colors.white : Palette.zodiacBlue),
        ),
      ),
    );
  }
}
