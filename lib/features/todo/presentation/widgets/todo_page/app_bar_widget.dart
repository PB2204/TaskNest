import 'package:flutter/material.dart';
import '/core/constant/app_image.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.onTapIcon});
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "TaskNest",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
          Expanded(
              child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(onTap: onTapIcon, child: SizedBox(height: 15, child: Image.asset(AppImages.appBarIcon))),
          )),
        ],
      ),
    );
  }
}
