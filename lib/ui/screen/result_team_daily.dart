part of 'screens.dart';

class ResultTeamDaily extends GetView<ResultTeamController> {
  const ResultTeamDaily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.totalPlanTaskDaily == 0
                    ? SizedBox(
                        width: double.infinity,
                        height: 210,
                        child: Center(
                          child: Text(
                            'NO DATA',
                            style: blackFontStyle1.copyWith(color: white),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PieCharResult(
                              closed: controller.totalActualDaily.toDouble(),
                              open: controller.totalOpenDaily.toDouble()),
                          MyButton(
                            label: "Detail",
                            onTap: () => Get.to(
                              () => const DetailDailyTeam(),
                              transition: Transition.cupertino,
                            ),
                            height: 40,
                            width: 80,
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardDetailResult(
                        title: "Plan Task",
                        value: '${controller.totalPlanTaskDaily}'),
                    CardDetailResult(
                        title: "Extra Task",
                        value: '${controller.totalExtraTaskDaily}'),
                    CardDetailResult(
                        title: "Achievement",
                        value: NumberFormat("###.#", "en_US")
                                .format(controller.achievemntDaily) +
                            "%"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardDetailResult(
                        title: "Actual Task",
                        value: '${controller.totalActualDaily}'),
                    CardDetailResult(
                        title: "Day / Total Day",
                        value: '${controller.totalDaysData} / 6'),
                    CardDetailResult(
                        title: "Total Point",
                        value: NumberFormat("###.#", "en_US")
                            .format(controller.totalPointDaily)),
                  ],
                ),
              ],
            ),
    );
  }
}
