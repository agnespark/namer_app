import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/pages/lounge/lounge_controller.dart';

class LoungePage extends StatelessWidget {
  const LoungePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoungeController());

    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (LoungeController.to.status.value == 0) {
              return const CircularProgressIndicator();
            } else if (LoungeController.to.status.value == 1) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('페이지 별 항목 수: '),
                      DropdownButton<int>(
                        value: LoungeController.to.selectedDisplayCount.value,
                        onChanged: (value) {
                          LoungeController.to.selectedDisplayCount.value =
                              value!;
                          LoungeController.to.loadData();
                        },
                        items: LoungeController.to.displayCount
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (LoungeController.to.loungeList.length /
                              LoungeController.to.selectedDisplayCount.value)
                          .ceil(),
                      itemBuilder: (context, index) {
                        final startIndex = index *
                            LoungeController.to.selectedDisplayCount.value;
                        final endIndex = startIndex +
                            LoungeController.to.selectedDisplayCount.value;
                        print(endIndex);
                        final sublist = LoungeController.to.loungeList.sublist(
                          startIndex,
                          endIndex > LoungeController.to.loungeList.length
                              ? LoungeController.to.loungeList.length
                              : endIndex,
                        );
                        print(sublist);
                        return Column(
                          children: sublist.map((lounge) {
                            return Row(
                              children: [
                                if (lounge.imageUrl != '')
                                  SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        lounge.imageUrl,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: ListTile(
                                    title: SelectableText(lounge.title),
                                    subtitle: SelectableText(
                                      lounge.content,
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (LoungeController.to.currentPage.value > 0) {
                            LoungeController.to.currentPage.value--;
                            // LoungeController.to.loadData();
                          }
                        },
                      ),
                      const SizedBox(width: 16),
                      for (int i = 1;
                          i <=
                              (LoungeController.to.loungeList.length /
                                      LoungeController
                                          .to.selectedDisplayCount.value)
                                  .ceil();
                          i++)
                        ElevatedButton(
                          onPressed: () {
                            LoungeController.to.currentPage.value = i - 1;
                            // LoungeController.to.loadData();
                          },
                          child: Text('$i'),
                        ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (LoungeController.to.currentPage.value <
                              (LoungeController.to.loungeList.length /
                                          LoungeController
                                              .to.selectedDisplayCount.value)
                                      .ceil() -
                                  1) {
                            LoungeController.to.currentPage.value++;
                            // LoungeController.to.loadData();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return SelectableText('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
            }
          },
        ),
      ),
    );
  }
}
