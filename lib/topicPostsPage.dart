import 'package:flutter/material.dart';

// 주제별 게시물 페이지 위젯
class TopicPostsPage extends StatelessWidget {
  // 주제 정보 더미 데이터 리스트
  final List<String> topics = [
    '가족', '친구', '여행',
    '취미', '그림/공예', '사진/영상',
    '운동', '자연', '자유주제',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 리스트에 여백 추가
        child: ListView.builder(
          itemCount: (topics.length / 3).ceil() + 1, // 행의 개수 + 제목 추가
          itemBuilder: (context, rowIndex) {
            if (rowIndex == 0) {
              // 첫 번째 아이템은 제목
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '주제별 게시물', // 페이지 제목
                    style: TextStyle(
                      fontSize: 18, // 제목 폰트 크기
                      fontWeight: FontWeight.bold, // 폰트 두께 설정
                    ),
                  ),
                  SizedBox(height: 16), // 제목과 콘텐츠 사이 간격
                ],
              );
            } else {
              int startIndex = (rowIndex - 1) * 3; // 각 행의 시작 인덱스
              int endIndex = (startIndex + 3 < topics.length) ? startIndex + 3 : topics.length; // 각 행의 끝 인덱스 계산

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // 항목 간 간격 균등하게 설정
                    children: [
                      for (int index = startIndex; index < endIndex; index++)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // 버튼 클릭 시 수행할 작업
                              print('${topics[index]} 주제 클릭됨'); // 클릭된 주제 이름 출력
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300], // 배경색 설정
                                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                  ),
                                ),
                                SizedBox(height: 8), // 사각형과 텍스트 사이 간격
                                Text(
                                  topics[index], // 주제 이름 출력
                                  style: TextStyle(fontSize: 14), // 텍스트 스타일 지정
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 16), // 각 행과 구분선 사이 간격 설정
                  Divider(
                    color: Colors.grey, // 회색 구분선 추가
                    thickness: 1, // 구분선 두께 설정
                  ),
                  SizedBox(height: 10),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}