import 'package:flutter/material.dart';

class CreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // '홈으로 이동' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                    // 모든 라우트를 제거하고 '/home'으로 이동
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home',
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black54,
                        size: 35,
                      ),
                      Text(
                        '홈으로 이동',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // '게시물 생성' 제목
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                '게시물 생성',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 이미지 슬라이더 (좌우 스크롤 가능)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: SizedBox(
                width: 380,
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == 2 ? 0.0 : 16.0, // 마지막 이미지에는 오른쪽 여백을 주지 않음
                      ),
                      child: Container(
                        width: 340, // 이미지를 살짝 잘리도록 설정
                        height: 314,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목 입력 필드
                  Text(
                    '제목',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: 380,
                    height: 36,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10), // 텍스트 세로 가운데 정렬
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // 옅은 회색 경계선
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // 포커스 시에도 옅은 회색 경계선 유지
                            width: 1.0,
                          ),
                        ),
                        hintText: '게시물 제목을 적어주세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14,),

                  // 게시물 주제 선택 필드
                  Text(
                    '게시물 주제 선택',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: 380,
                    height: 36,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10), // 텍스트 세로 가운데 정렬
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // 옅은 회색 경계선
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // 포커스 시에도 옅은 회색 경계선 유지
                            width: 1.0,
                          ),
                        ),
                        hintText: '주제를 검색해보세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  // 주제 선택 버튼들
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: ['가족', '친구', '여행', '가을'].map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), // 태그 내부 여백을 줄여서 크기 축소
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // 태그 배경색 설정
                            borderRadius: BorderRadius.circular(5), // 태그의 모서리를 둥글게 설정
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              tag, // 태그 텍스트
                              style: TextStyle(
                                fontSize: 17, // 텍스트 크기를 줄임
                                color: Colors.black87, // 텍스트 색상 설정
                              ),
                            ),
                          ),
                        );
                      }).toList(), // 태그 리스트를 위젯 리스트로 변환
                    ),
                  ),
                  SizedBox(height: 6,),

                  // 공개 범위 필드
                  Text(
                    '공개 범위',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  //SizedBox(height: 8,),
                  Text(
                    '당신의 게시물을 볼 수 있는 사람을 선택해 주세요',
                    style: TextStyle(
                      fontSize: 14, // 텍스트 크기를 줄임
                      color: Colors.grey,
                    ),
                  ),
                  // 공개 범위 선택 버튼들
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: ['누구나', '친구만', '나만'].map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2), // 태그 내부 여백을 줄여서 크기 축소
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // 태그 배경색 설정
                            borderRadius: BorderRadius.circular(5), // 태그의 모서리를 둥글게 설정
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              tag, // 태그 텍스트
                              style: TextStyle(
                                fontSize: 17, // 텍스트 크기를 줄임
                                color: Colors.black87, // 텍스트 색상 설정
                              ),
                            ),
                          ),
                        );
                      }).toList(), // 태그 리스트를 위젯 리스트로 변환
                    ),
                  ),
                  SizedBox(height: 15,),

                  // '올리기' 버튼
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 74,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFBB2F30), // 짙은 빨강 색상
                          textStyle: TextStyle(
                            fontSize: 17, // 텍스트 크기를 버튼 크기에 맞게 설정
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.only(bottom: 3), // 내부 여백을 제거하여 텍스트가 버튼에 맞도록 설정
                        ),
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: Text(
                            '올리기',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}