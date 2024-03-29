import 'package:flutter/material.dart';
import 'package:mobile/core/constants/enums/request_status.enum.dart';
import 'package:mobile/core/theme/palette.dart';
import 'package:mobile/modules/friend/controllers/friend.controller.dart';
import 'package:mobile/modules/friend/widgets/add_friend/add_friend_page.widget.dart';
import 'package:mobile/modules/friend/widgets/friend_page/list_friend_page.widget.dart';
import 'package:mobile/modules/friend/widgets/tab_bar.widget.dart';
import 'package:get/get.dart';

class FriendScreen extends GetView<FriendController> {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            right: 20,
            bottom: 30,
          ),
          child: Obx(
            () => _buildGetData(),
          ),
        ),
        backgroundColor: Palette.gray200,
      ),
    );
  }

  Widget _buildGetData() {
    switch (controller.getDataStatus) {
      case RequestStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case RequestStatus.hasData:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onPressed: controller.rootController.openDrawer,
              icon: const Icon(
                Icons.menu,
                color: Palette.red100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TabNavigationBar(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  ListFriendPage(),
                  AddFriendPage(),
                ],
              ),
            )
          ],
        );
      case RequestStatus.hasError:
        return const Center(
          child: Text('Lỗi không thể lấy dữ liệu'),
        );

      default:
        return const SizedBox();
    }
  }
}
