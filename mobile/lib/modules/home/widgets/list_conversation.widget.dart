import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';

class ListConversation extends StatelessWidget {
  const ListConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70.h,
            padding: const EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(
                  width: 18,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conversation',
                        style: TextStyle(
                          color: Palette.zodiacBlue,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.fontNunito,
                          fontSize: 17.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tin nhắn',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.fontNunito,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
