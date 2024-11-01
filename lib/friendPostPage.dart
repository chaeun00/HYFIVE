import 'package:flutter/material.dart';

// 친구별 게시물 페이지 위젯
class FriendPostsPage extends StatelessWidget {
  // 친구 정보 더미 데이터 리스트
  final List<String> userNames = [
    '사용자1', '사용자2', '사용자3',
    '사용자4', '사용자5', '사용자6',
    '사용자7', '사용자8', '사용자9',
    '사용자10', '사용자11', '사용자12',
    '사용자13', '사용자14', '사용자15',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 리스트에 여백 추가
        child: ListView.builder(
          itemCount: (userNames.length / 3).ceil() + 1, // 행의 개수 + 제목 추가
          itemBuilder: (context, rowIndex) {
            if (rowIndex == 0) {
              // 첫 번째 아이템은 제목
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '친구별 게시물', // 페이지 제목
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
              int endIndex =
              (startIndex + 3 < userNames.length) ? startIndex + 3 : userNames.length; // 각 행의 끝 인덱스 계산

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // 항목 간 간격 균등하게 설정
                    children: [
                      for (int index = startIndex; index < endIndex; index++)
                        Expanded(
                          child: InkWell(
                            // 원형 아바타를 누를 수 있도록 InkWell 위젯으로 감싸기
                            onTap: () {
                              // 원형 아바타 클릭 시 수행할 작업
                              print('${userNames[index]} 아바타 클릭됨'); // 클릭된 사용자 이름 출력
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // 세로 크기를 내용에 맞춤
                              children: [
                                CircleAvatar(
                                  radius: 50, // 원형 아바타의 반지름 설정
                                  backgroundColor: Colors.grey[300], // 아바타 배경색 설정
                                ),
                                SizedBox(height: 8), // 아바타와 사용자명 사이 간격
                                Text(
                                  userNames[index], // 사용자 이름 출력
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
                  SizedBox(height: 16),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}