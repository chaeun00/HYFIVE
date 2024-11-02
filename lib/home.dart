import 'package:flutter/material.dart';
import 'datePostsPage.dart';
import 'friendPostPage.dart';
import 'topicPostsPage.dart';
import 'postDetailPage.dart';
import 'commentPage.dart';

class Home extends StatefulWidget {
  @override
  _HyFiveHomePageState createState() => _HyFiveHomePageState();
}

class _HyFiveHomePageState extends State<Home> {
  int _baseWidth = 412;
  int _baseHeight = 893;

  int _selectedIndex = 0; // 현재 선택된 정렬 옵션의 인덱스
  bool _isDetailPage = false; // 상세 페이지 여부
  bool _isCommentPage = false; // 댓글 페이지 여부
  Map<String, dynamic>? _selectedPost; // 선택된 게시물 데이터

  // 페이지 리스트
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      FriendPostsPage(), // 친구별 게시물 페이지
      DatePostsPage(onPostTap: _onPostTapped), // 날짜별 게시물 페이지
      TopicPostsPage(), // 주제별 게시물 페이지
    ];
  }

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
      _isDetailPage = false; // 정렬 버튼을 클릭하면 상세 페이지가 아닌 상태로 변경
      _isCommentPage = false; // 댓글 페이지가 아닌 상태로 설정
    });
  }

  void _onPostTapped(Map<String, dynamic> post) {
    setState(() {
      _isDetailPage = true; // 상세 페이지로 전환
      _selectedPost = post; // 선택된 게시물 데이터 저장
      _isCommentPage = false; // 댓글 페이지 초기화
    });
  }

  void _goBackToMainPage() {
    setState(() {
      _isDetailPage = false; // 메인 페이지로 돌아가기
      _isCommentPage = false; // 댓글 페이지 초기화
    });
  }

  void _goToCommentPage() {
    setState(() {
      _isCommentPage = true; // 댓글 페이지로 전환
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
              'HYFIVE', // 항상 동일한 앱바 제목 유지
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: null,
            centerTitle: false,
            backgroundColor: Colors.white, // AppBar의 배경색 설정
            elevation: 0.0, // 기본 elevation을 제거
          ),
        ),
      ),
      body: Column(
        children: [
          // 정렬 버튼 섹션 (메인 페이지에서만 보임)
          if (!_isDetailPage && !_isCommentPage) ...[
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '정렬',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
          ],
          if (_isDetailPage && !_isCommentPage) ...[
            // 상세 페이지에서 '홈으로 이동' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  onPressed: _goBackToMainPage, // 버튼 클릭 시 메인 페이지로 이동
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // 버튼 패딩을 0으로 설정하여 왼쪽에 딱 붙도록 함
                    alignment: Alignment.centerLeft, // 텍스트 버튼 내부의 정렬 왼쪽으로 설정
                    splashFactory: NoSplash.splashFactory, // 클릭 시 스플래시 효과 제거
                    overlayColor: Colors.transparent, // 클릭 시 오버레이 컬러를 투명으로 설정
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black54,
                        size: 30, // 아이콘 크기 설정
                      ),
                      Text(
                        '홈으로 이동',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16, // 폰트 크기 설정
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          if (_isCommentPage) ...[
            // 댓글 페이지에서 '뒤로 가기' 버튼
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isCommentPage = false; // 댓글 페이지에서 상세 페이지로 돌아가기
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // 버튼 패딩을 0으로 설정하여 왼쪽에 딱 붙도록 함
                    alignment: Alignment.centerLeft, // 텍스트 버튼 내부의 정렬 왼쪽으로 설정
                    splashFactory: NoSplash.splashFactory, // 클릭 시 스플래시 효과 제거
                    overlayColor: Colors.transparent, // 클릭 시 오버레이 컬러를 투명으로 설정
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black54,
                        size: 30, // 아이콘 크기 설정
                      ),
                      Text(
                        '뒤로 가기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16, // 폰트 크기 설정
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          // 콘텐츠 섹션
          Expanded(
            child: _isDetailPage
                ? (_isCommentPage
                ? CommentPage(
              post: _selectedPost!,
              onGoBack: () {
                setState(() {
                  _isCommentPage = false; // 댓글 페이지에서 상세 페이지로 돌아가기
                });
              },
            ) // 댓글 페이지를 표시
                : PostDetailPage(
              post: _selectedPost!,
              onGoBack: _goBackToMainPage,
              goToCommentPage: _goToCommentPage, // 댓글 페이지 이동 콜백 추가
            ))
                : _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: _isCommentPage
          ? null // 댓글 페이지에서는 bottomNavigationBar 숨기기
          : SizedBox(
        height: MediaQuery.of(context).size.height * (110 / _baseHeight),
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