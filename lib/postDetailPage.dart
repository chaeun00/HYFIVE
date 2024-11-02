import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;
  final VoidCallback onGoBack;
  final VoidCallback goToCommentPage;

  PostDetailPage({required this.post, required this.onGoBack, required this.goToCommentPage});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  int _currentPage = 0; // 현재 이미지 페이지 인덱스
  int _imageCount = 4; // 총 이미지 개수

  final List<String> tags = ['가족', '여행']; // 태그 데이터

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 게시물 내용 표시
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 게시물 정보 박스
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // 모서리를 둥글게 설정
                    border: Border.all(
                      color: Colors.black12, // 테두리 색상 설정
                      width: 1.5, // 테두리 두께 설정
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 맨 위 썸네일, 사용자 이름, 게시 시간, 더 보기 버튼
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8), // 가로 패딩 최소화
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // 같은 높이로 정렬
                          children: [
                            // 썸네일과 사용자 정보
                            Padding(
                              padding: EdgeInsets.zero, // 썸네일 여백 제거
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[200],
                                backgroundImage: AssetImage(widget.post['thumbnail'] ?? ''),
                              ),
                            ),
                            SizedBox(width: 4), // 썸네일과 텍스트 간의 간격 최소화
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min, // 높이를 최소로 유지
                              children: [
                                Text(
                                  widget.post['userName'] ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    height: 1.0, // 텍스트 높이 간격 최소화
                                  ),
                                ),
                                Text(
                                  '2 hours ago, City A', // 게시 시간과 위치 (더미 데이터)
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    height: 1.0, // 텍스트 높이 간격 최소화
                                  ),
                                ),
                              ],
                            ),
                            Spacer(), // 아이콘을 오른쪽으로 밀기 위한 Spacer
                            GestureDetector(
                              onTap: () {
                                // 더보기 버튼 클릭 시 동작 추가
                              },
                              child: Icon(
                                Icons.more_horiz,
                                size: 18, // 아이콘 크기를 줄여서 간격 최소화
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 게시물 이미지
                      Container(
                        height: 330,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView.builder(
                              itemCount: _imageCount,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    image: widget.post['thumbnail'] != null
                                        ? DecorationImage(
                                      image: AssetImage(widget.post['thumbnail']),
                                      fit: BoxFit.cover,
                                    )
                                        : null,
                                  ),
                                  alignment: Alignment.center,
                                  child: widget.post['thumbnail'] == null
                                      ? Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16,
                                    ),
                                  )
                                      : null,
                                );
                              },
                            ),
                            // 페이지 인디케이터
                            Positioned(
                              bottom: 8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(_imageCount, (index) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(horizontal: 2), // 인디케이터 간격을 좁히기 위해 변경
                                    height: 4,
                                    width: _currentPage == index ? 24 : 4, // 현재 인덱스인 경우 둥근 사각형 형태
                                    decoration: BoxDecoration(
                                      color: _currentPage == index ? Colors.white : Colors.grey,
                                      borderRadius: _currentPage == index
                                          ? BorderRadius.circular(16) // 둥근 사각형 모양
                                          : BorderRadius.circular(50), // 원 모양
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),

                      // 게시물 제목 및 내용
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.post['title'] ?? '',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),

                      // 태그 섹션
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // 좌우 여백 설정
                        child: Wrap(
                          spacing: 4.0, // 태그들 사이의 간격을 더 좁게 설정
                          children: tags.map((tag) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), // 태그 내부 여백을 줄여서 크기 축소
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // 태그 배경색 설정
                                borderRadius: BorderRadius.circular(3), // 태그의 모서리를 둥글게 설정
                              ),
                              child: Text(
                                tag, // 태그 텍스트
                                style: TextStyle(
                                  fontSize: 10, // 텍스트 크기를 줄임
                                  color: Colors.black87, // 텍스트 색상 설정
                                ),
                              ),
                            );
                          }).toList(), // 태그 리스트를 위젯 리스트로 변환
                        ),
                      ),
                      SizedBox(height: 35),
                    ],
                  ),
                ),
                SizedBox(height: 14),

                // 감정 표현 버튼 섹션
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _emotionButton('satisfied', Icons.sentiment_satisfied_alt),
                    _emotionButton('favorite', Icons.favorite),
                    _emotionButton('cool', Icons.sentiment_very_satisfied),
                    _emotionButton('sad', Icons.sentiment_dissatisfied),
                  ],
                ),
                SizedBox(height: 20),

                // 댓글 입력 버튼
                Center(
                  child: SizedBox(
                    width: double.infinity, // 버튼을 가로로 화면 전체 길이로 설정
                    height: 42,
                    child: OutlinedButton(
                      onPressed: widget.goToCommentPage, // 댓글 페이지로 전환하는 콜백 호출
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white, // 버튼 배경색을 흰색으로 설정
                        side: BorderSide(color: Colors.black, width: 1.0), // 테두리 색상과 두께 설정
                        padding: EdgeInsets.symmetric(horizontal: 10), // 버튼 패딩 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 모서리를 둥글게 설정
                        ),
                      ),
                      child: Text(
                        '댓글 남기기',
                        style: TextStyle(
                          color: Colors.black, // 글자 색상 설정
                          fontSize: 14, // 글자 크기 설정
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _emotionButton(String emotionKey, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.post[emotionKey]++;
        });
      },
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200], // 원형 배경색 설정
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8), // 아이콘과 숫자 사이의 간격
          Text(
            widget.post[emotionKey].toString().padLeft(2, '0'), // 두 자리로 표시
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
