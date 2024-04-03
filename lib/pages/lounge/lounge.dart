import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/model/lounge_model.dart';
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
                        itemCount: LoungeController.to.endIndex.value -
                            LoungeController.to.startIndex.value,
                        itemBuilder: (context, index) {
                          // 현재 아이템의 인덱스 계산
                          final int itemIndex =
                              LoungeController.to.startIndex.value + index;

                          if (itemIndex >=
                              (0.7 * LoungeController.to.loungeList.length)) {
                            LoungeController.to.addData();
                          }
                          // 현재 아이템 표시
                          final LoungePostModel lounge =
                              LoungeController.to.loungeList[itemIndex];
                          return Row(
                            children: [
                              // 이미지 표시
                              // if (lounge.imageUrl != '')
                              //   SizedBox(
                              //     width: 48,
                              //     height: 48,
                              //     child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(8),
                              //       child: Image.network(
                              //         lounge.imageUrl,
                              //         width: double.infinity,
                              //         height: double.infinity,
                              //         fit: BoxFit.cover,
                              //         errorBuilder: (context, error, stackTrace) {
                              //           return Image.asset(
                              //               'assets/images/error_image.png');
                              //         },
                              //       ),
                              //     ),
                              //   ),
                              // 제목과 내용을 표시
                              Expanded(
                                child: ListTile(
                                  title: SelectableText(lounge.title),
                                  subtitle: SelectableText(
                                    lounge.content,
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () =>
                            LoungeController.to.firstPageButtonClicked(),
                      ),
                      // prev 버튼
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          LoungeController.to.prevButtonClicked();
                        },
                      ),
                      const SizedBox(width: 16),
                      // 숫자버튼
                      for (int i in LoungeController.to.pageCountList)
                        ElevatedButton(
                          onPressed: () {
                            LoungeController.to.pageClicked(i);
                          },
                          style: ButtonStyle(
                            backgroundColor: i ==
                                    LoungeController.to.currentPage.value
                                ? MaterialStateProperty.all<Color>(
                                    Colors.blue) // 현재 선택된 페이지의 버튼에 파란색 배경색 적용
                                : null,
                          ),
                          child: Text('$i'),
                        ),
                      const SizedBox(width: 16),
                      // next 버튼
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          LoungeController.to.nextButtonClicked();
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
