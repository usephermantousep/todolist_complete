part of 'screens.dart';

class ResultTeamMonthly extends GetView<ResultTeamController> {
  const ResultTeamMonthly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.totalPlanTaskMonthly == 0
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
                              closed: controller.totalActualMonthly.toDouble(),
                              open: controller.totalOpenMonthly.toDouble()),
                          MyButton(
                            label: "Detail",
                            onTap: () => Get.to(
                              () => const DetailMonthlyTeam(),
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
                        value: '${controller.totalPlanTaskMonthly}'),
                    CardDetailResult(
                        title: "Extra Task",
                        value: '${controller.totalExtraTaskMonthly}'),
                    CardDetailResult(
                        title: "Achievement",
                        value: NumberFormat("###.#", "en_US")
                            .format(controller.achievemntMonthly)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardDetailResult(
                        title: "Actual",
                        value: '${controller.totalActualMonthly}'),
                    CardDetailResult(
                        title: "Total Point",
                        value: NumberFormat("###.#", "en_US")
                            .format(controller.totalPointMonthly)),
                  ],
                ),
              ],
            ),
    );
  }
}
