import 'package:flutter/material.dart';

// 게시물 클릭 시 동작을 정의하기 위해 콜백 추가
class DatePostsPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onPostTap;

  DatePostsPage({required this.onPostTap});

  @override
  _DatePostsPageState createState() => _DatePostsPageState();
}

class _DatePostsPageState extends State<DatePostsPage> {
  int selectedDateIndex = 3; // 기본 선택된 날짜 인덱스 (28일)
  final List<String> dates = ['24', '25', '26', '27', '28', '29', '30'];
  final List<String> days = ['일', '월', '화', '수', '목', '금', '토'];

  final List<Map<String, dynamic>> posts = [
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '지난 주말에 가족들과 2박 3일 여행을 다녀왔다. 손녀들과 떠나는 첫 여행이라 너무 즐거웠다.',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자',
      'satisfied': 0,
      'favorite': 0,
      'cool': 0,
      'sad': 0,
    },
    {
      'thumbnail': 'assets/thumbnail_placeholder.png',
      'title': '가족과 2박 3일 여행',
      'content': '이번 여행에서 새로운 곳을 많이 구경했다.',
      'userImage': 'assets/user_placeholder.png',
      'userName': '시니어 사용자',
      'satisfied': 0,
      'favorite': 0,
      'cool': 0,
      'sad': 0,
    },
    // 추가 게시물 데이터...
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // 페이지 제목
          Text(
            '날짜별 게시물',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16), // 제목과 날짜 목록 사이 간격

          // 날짜 선택 버튼
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
            return GestureDetector(
              onTap: () {
                widget.onPostTap(post); // 게시물 클릭 시 부모로 전달하는 콜백 호출
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      // 썸네일 이미지
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: post['thumbnail'] != null
                              ? DecorationImage(
                            image: AssetImage(post['thumbnail']),
                            fit: BoxFit.cover,
                          )
                              : null,
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
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                  backgroundImage: AssetImage(post['userImage'] ?? ''),
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
                  Divider(color: Colors.grey, thickness: 1), // 구분선
                  SizedBox(height: 8),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}