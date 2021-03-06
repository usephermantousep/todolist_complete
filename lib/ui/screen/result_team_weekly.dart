part of 'screens.dart';

class ResultTeamWeekly extends GetView<ResultTeamController> {
  const ResultTeamWeekly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.planTaskWeekly == 0
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
                              closed: controller.actualTaskWeekly.toDouble(),
                              open: controller.totalOpenWeekly.toDouble()),
                          MyButton(
                            label: "Detail",
                            onTap: () => Get.to(
                              () => const DetailWeeklyTeam(),
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
                        value: '${controller.planTaskWeekly}'),
                    CardDetailResult(
                        title: "Extra Task",
                        value: '${controller.extraTaskWeekly}'),
                    CardDetailResult(
                        title: "Achievement",
                        value: NumberFormat("###.#", "en_US")
                            .format(controller.achievementWeekly)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardDetailResult(
                        title: "Actual Task",
                        value: '${controller.actualTaskWeekly}'),
                    CardDetailResult(
                        title: "Total Point",
                        value: NumberFormat("###.#", "en_US")
                            .format(controller.totalPointWeekly)),
                  ],
                ),
              ],
            ),
    );
  }
}
