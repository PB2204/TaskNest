import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '/core/constant/app_colors.dart';
import '/features/todo/data/datasources/static/colors_status_image.dart';
import '/features/todo/domain/entities/todo_enti.dart';
import '/features/todo/presentation/widgets/todo_page/todo_posts_checkout.dart';

class TodoPostWidget extends StatelessWidget {
  const TodoPostWidget(
      {super.key, this.onTap, required this.showNumber, this.onTapCheckOut, required this.todoEnti, required this.ids});
  final TodoEnti todoEnti;
  final int showNumber;
  final void Function()? onTap;
  final void Function()? onTapCheckOut;
  final List<int> ids;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        width: double.maxFinite,
        height: 52,
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(color: AppColors.black.withOpacity(0.06), blurRadius: 6, offset: const Offset(0, 1))
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _iconStatusTodo(todoEnti.iconId),
                Container(margin: const EdgeInsets.only(left: 7, right: 12), child: _imageTodo(todoEnti.iconId)),
              ],
            ),
            _titleTodo(todoEnti.title , context),
            AnimatedCrossFade(
                firstChild: Container(
                    margin: const EdgeInsets.only(right: 7, left: 12),
                    child: _time(Jiffy.parse(todoEnti.time).MMMd, Jiffy.parse(todoEnti.time).jm, context)),
                secondChild: TodoPostsCheckout(
                  onTap: onTapCheckOut,
                  visibleIconCheck: ids.contains(todoEnti.id),
                ),
                crossFadeState: showNumber == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Durations.medium1)

          ],
        ));
  }

  Widget _iconStatusTodo(int id) {
    return SizedBox(
      height: 7,
      width: 7,
      child: CircleAvatar(
        backgroundColor: StaticData.colorsStatusImage[id].colorStatus,
      ),
    );
  }

  Widget _imageTodo(int id) {
    return SizedBox(
      height: 28,
      width: 28,
      child: CircleAvatar(
        backgroundImage: AssetImage(StaticData.colorsStatusImage[id].images),
      ),
    );
  }

  Widget _titleTodo(String title , BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _time(String month, String hour, BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            hour,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
