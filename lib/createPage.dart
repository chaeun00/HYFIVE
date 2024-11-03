import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // '홈으로 이동' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                      SizedBox(width: 4,),
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
            // 게시물 작성 TextField
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 420, // 원하는 높이 지정
                child: TextField(
                  textAlign: TextAlign.center, // 텍스트를 가로 중앙에 정렬
                  textAlignVertical: TextAlignVertical.center, // 텍스트를 세로 중앙에 정렬
                  expands: true, // TextField가 부모 컨테이너의 크기를 채우도록 설정
                  maxLines: null, // expands와 함께 사용하기 위해 null로 설정
                  decoration: InputDecoration(
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
                    hintText: '화면을 눌러 오늘 있었던 일을 작성해보세요!',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.zero, // 내부 여백 제거
                  ),
                ),
              ),
            ),
            // '만들기' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 74,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      // 만들기 버튼 클릭 시 처리할 내용
                    },
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
                        '만들기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // '글로 입력', '음성으로 입력' 버튼 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildInputButton(
                    icon: Icons.keyboard,
                    label: '글로 입력',
                    onPressed: () {
                      // 글로 입력 버튼 클릭 시 처리할 내용
                    },
                  ),
                  buildInputButton(
                    icon: Icons.mic,
                    label: '음성으로 입력',
                    onPressed: () {
                      // 음성으로 입력 버튼 클릭 시 처리할 내용
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildInputButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: 185,
    height: 88,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero, // 내부 여백 최소화
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 아이콘과 텍스트를 세로 중앙에 정렬
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200], // 원형 배경색 설정
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30), // 아이콘을 원형 배경 위에 배치
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    ),
  );
}