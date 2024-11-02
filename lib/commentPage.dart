import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onGoBack;

  CommentPage({required this.post, required this.onGoBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 감정 표현 버튼 섹션
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // 원형 배경색 설정
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.sentiment_satisfied_alt, size: 30),
                      ),
                      SizedBox(height: 8), // 아이콘과 숫자 사이의 간격
                      Text('00', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // 원형 배경색 설정
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite, size: 30),
                      ),
                      SizedBox(height: 8), // 아이콘과 숫자 사이의 간격
                      Text('00', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // 원형 배경색 설정
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.sentiment_very_satisfied, size: 30),
                      ),
                      SizedBox(height: 8), // 아이콘과 숫자 사이의 간격
                      Text('00', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // 원형 배경색 설정
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.sentiment_dissatisfied, size: 30),
                      ),
                      SizedBox(height: 8), // 아이콘과 숫자 사이의 간격
                      Text('00', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 댓글 리스트 섹션
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '00개의 댓글',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),

          Divider(color: Colors.grey[400], thickness: 1, height: 0,),

          Expanded(
            child: ListView.builder(
              itemCount: 5, // 임시 댓글 개수
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 서클 아바타가 텍스트 묶음의 세로 중앙에 위치하도록 설정
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '사용자명',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      '00분 전',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '댓글을 남겨주세요',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index == 2) // 세 번째 댓글에만 답글 추가
                      Padding(
                        padding: const EdgeInsets.only(left: 56, right: 12, top: 8, bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 세로 점선
                            Container(
                              width: 1,
                              height: 50, // 점선 길이 설정
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  8, // 점선의 수
                                      (i) => Expanded(
                                    child: Container(
                                      width: 1,
                                      color: i % 2 == 0 ? Colors.grey[400] : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16), // 점선과 답글 간의 간격
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 20, // 답글 아바타의 크기를 댓글 아바타보다 작게 설정
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '사용자명',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        '00분 전',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '@사용자 👍',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    Divider(
                      color: index == 4 ? Colors.grey[400] : Colors.grey[300], // 마지막 구분선만 다른 색상 적용
                      thickness: 1,
                      height: 0, // 구분선과 댓글 간의 간격을 줄임
                    ),
                  ],
                );
              },
            ),
          ),

          // 댓글 입력 필드 섹션
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 32),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 16, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8), // 모서리를 둥글게 설정
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '댓글 남기기',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              contentPadding: EdgeInsets.symmetric(vertical: 9), // 텍스트 세로 가운데 정렬
                            ),
                          ),
                        ),
                        Icon(Icons.emoji_emotions, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Icon(Icons.send, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}