part of 'widgets.dart';

class CardWeeklyRequest extends GetView<RequestTaskController> {
  final WeeklyModel weekly;
  final bool? isCanDelete;
  const CardWeeklyRequest(
      {required this.weekly, this.isCanDelete = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.2, color: greyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/task.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WEEKLY ${weekly.type! == 'NON' ? "NON RESULT" : "RESULT"} ${!weekly.isAdd! ? '' : '(Extra Task)'}",
                    style: blackFontStyle2.copyWith(
                        wordSpacing: 1,
                        fontSize: 10,
                        color: greyColor,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SelectableText(
                    "${weekly.task!.toUpperCase()} ${weekly.type != "NON" ? controller.formatNumber(weekly.valPlan!.toString()) : ""}",
                    maxLines: 1,
                    style: blackFontStyle2.copyWith(
                      wordSpacing: 1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            isCanDelete!
                ? InkWell(
                    onTap: () => showDialog<String>(
                        context: context,
                        builder: (context) => _dialogDelete(context)),
                    child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red[400]),
                      child: const Icon(
                        Icons.delete_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _dialogDelete(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Hapus",
        style: blackFontStyle1,
      ),
      content: Text(
        'Apakah anda yakin menghapus\n"${weekly.task}"',
        style: blackFontStyle3,
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.weeklyChange
                  .removeWhere((element) => element == weekly);
              controller.update(['tag']);
              Get.back();
            },
            child: Text(
              "YES",
              style: blackFontStyle3.copyWith(color: Colors.green[400]),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "NO",
              style: blackFontStyle3.copyWith(color: Colors.red[400]),
            )),
      ],
    );
  }
}