import 'package:flutter/material.dart';
import 'datePostsPage.dart';
import 'friendPostPage.dart';
import 'topicPostsPage.dart';

void main() => runApp(HyFiveApp());

class HyFiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 표식 제거
      home: HyFiveHomePage(), // 홈 페이지를 HyFiveHomePage로 설정
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white, // Scaffold 배경색을 흰색으로 설정
        appBarTheme: AppBarTheme(
          color: Colors.white, // AppBar 배경색을 흰색으로 설정
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.white, // BottomAppBar 배경색을 흰색으로 설정
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: TextStyle(
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
            ),
            side: BorderSide(color: Colors.grey[300]!), // 테두리 색상 설정
          ),
        ),
      ),
    );
  }
}

class HyFiveHomePage extends StatefulWidget {
  @override
  _HyFiveHomePageState createState() => _HyFiveHomePageState();
}

class _HyFiveHomePageState extends State<HyFiveHomePage> {
  int _baseWidth = 412;
  int _baseHeight = 893;

  int _selectedIndex = 0; // 현재 선택된 정렬 옵션의 인덱스
  final List<Widget> _pages = [
    FriendPostsPage(), // 친구별 게시물 페이지
    DatePostsPage(),   // 날짜별 게시물 페이지
    TopicPostsPage(),  // 주제별 게시물 페이지
  ];

  // 정렬 버튼 데이터
  final List<Map<String, dynamic>> sortButtonData = [
    {'icon': Icons.group, 'label': '친구별', 'onPressedIndex': 0},
    {'icon': Icons.calendar_today, 'label': '날짜별', 'onPressedIndex': 1},
    {'icon': Icons.topic, 'label': '주제별', 'onPressedIndex': 2},
  ];

  // bottomNavigationBar 버튼 데이터
  final List<Map<String, dynamic>> buttonData = [
    {'icon': Icons.home, 'label': '보기'},
    {'icon': Icons.note_add, 'label': '만들기'},
    {'icon': Icons.man, 'label': '친구'},
    {'icon': Icons.person, 'label': '프로필'},
  ];

  void _onSortButtonTapped(int index) {
    setState(() {
      _selectedIndex = index; // 정렬 버튼 클릭 시 현재 인덱스를 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * (48 / _baseHeight)), // AppBar의 높이를 설정
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // 그림자 색상 및 투명도 설정
                blurRadius: 6,
                offset: Offset(0, 3), // 그림자의 위치
              ),
            ],
          ),
          child: AppBar(
            title: Text(
                'HYFIVE',
            style: TextStyle(
              fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white, // AppBar의 배경색 설정
            elevation: 0.0, // 기본 elevation을 제거
          ),
        ),
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height * (1000 / _baseHeight),
        child: Column(
          children: [
            // '정렬' 제목 추가
            Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '정렬',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),

            // 정렬 버튼
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: sortButtonData.map((data) {
                  return OutlinedButton(
                    onPressed: () => _onSortButtonTapped(data['onPressedIndex']),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // 버튼의 상하 여백을 늘려 높이 증가
                    ),
                    child: Row(
                      children: [
                        Icon(data['icon']), // 아이콘 설정
                        SizedBox(width: 4),
                        Text(data['label']), // 텍스트 설정
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // 콘텐츠 영역
            Expanded(
              child: _pages[_selectedIndex], // 현재 선택된 페이지를 표시
            ),
          ],
        ),
      ),

      // 바텀 앱 바
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * (120 / _baseHeight),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buttonData.map((data) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * (91 / _baseWidth),
                height: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(data['icon'], size: 20), // 아이콘 크기 설정
                      SizedBox(height: 4),
                      Text(
                        data['label'],
                        style: TextStyle(fontSize: 14),
                      ), // 텍스트
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}