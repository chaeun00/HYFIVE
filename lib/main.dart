import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(HyFiveApp());

class HyFiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 표식 제거

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

      initialRoute: '/home', // 홈 페이지를 Home으로 설정
      routes: routes,
    );
  }
}

