import 'package:flutter/material.dart';

// 날짜별 게시물 페이지 위젯
class DatePostsPage extends StatefulWidget {
  @override
  _DatePostsPageState createState() => _DatePostsPageState();
}

class _DatePostsPageState extends State<DatePostsPage> {
  int selectedDateIndex = 3; // 선택된 날짜 인덱스 (기본적으로 28일 선택)
  final List<String> dates = ['24', '25', '26', '27', '28', '29', '30'];
  final List<String> days = ['일', '월', '화', '수', '목', '금', '토'];

  final List<Map<String, String>> posts = [
    {
      'thumbnail': 'assets/thumbnail_placeholder.png', // 썸네일 이미지 경로
      'title': '가족과 2박 3일 여행',
      'content': '!지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다. 다음에 또 ..',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자'
    },
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '!지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다. 다음에 또 ..',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자'
    },
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '!지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다. 다음에 또 ..',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자'
    },
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '!지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다. 다음에 또 ..',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자'
    },
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '!지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다. 다음에 또 ..',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 페이지 제목
            Text(
              '날짜별 게시물',
              style: TextStyle(
                fontSize: 18, // 제목 폰트 크기
                fontWeight: FontWeight.bold, // 폰트 두께 설정
              ),
            ),
            SizedBox(height: 16), // 제목과 날짜 목록 사이 간격

            // 날짜 선택 버튼 (가로로 화면 전체를 채움)
            Row(
              children: List.generate(dates.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index; // 선택된 날짜 업데이트
                      });
                    },
                    child: Column(
                      children: [
                        // 요일 텍스트 설정 (일요일과 토요일은 회색, 나머지는 검은색)
                        Text(
                          days[index],
                          style: TextStyle(
                            color: selectedDateIndex == index || (index != 0 && index != 6)
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        // 날짜 텍스트 설정
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedDateIndex == index ? Colors.red : Colors.transparent,
                          ),
                          child: Text(
                            dates[index],
                            style: TextStyle(
                              color: selectedDateIndex == index
                                  ? Colors.white
                                  : (index == 0 || index == 6)
                                  ? Colors.grey
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16), // 날짜 목록과 게시물 리스트 사이 간격

            // 게시물 리스트
            ...List.generate(posts.length, (index) {
              final post = posts[index];
              return Column(
                children: [
                  Row(
                    children: [
                      // 썸네일 이미지
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 16), // 썸네일과 텍스트 사이 간격
                      // 제목, 내용, 사용자 정보
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post['title'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              post['content'] ?? '',
                              style: TextStyle(fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[400],
                                ),
                                SizedBox(width: 8),
                                Text(
                                  post['userName'] ?? '',
                                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}