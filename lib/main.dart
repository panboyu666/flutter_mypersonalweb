import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ChatWidget.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '軟體工程師展示網站',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();


  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  Future<void> _sendMessage(String message) async {
    if (message.isEmpty) return;

    setState(() {
      _messages.add({"user": message});
    });

    // final response = await _callAPI(message);
    //
    // if (response != null) {
    //   setState(() {
    //     _messages.add({"ai": response});
    //   });
    // }

  }


  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [

            Icon(Icons.code),
            SizedBox(width: 10),
            Text('Flutter Web Abel Portfolio',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () => _scrollToSection(homeKey), // 點 Skills 就跳到 Skills 區
              child: Text('Home', style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () => _scrollToSection(skillsKey), // 點 Skills 就跳到 Skills 區
              child: Text('Skills', style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () => _scrollToSection(projectsKey,), // 點 Skills 就跳到 Skills 區
              child: Text('Projects', style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () => _scrollToSection(contactKey), // 點 Skills 就跳到 Skills 區
              child: Text('Contact', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
               key: homeKey,
              padding: const EdgeInsets.all(20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              'Hi, I\'m Abel',
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'I\'m a software engineer ',
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'with a passion for coding and software development',
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            ClipPath(
                              clipper: IrregularShapeClipper(),
                              child: Container(
                                color: Colors.yellow, // 填充黃色
                                width: 1200, // 設置寬度
                                height: 500, // 設置高度
                                child: ClipPath(
                                  clipper: IrregularShapeClipper(),
                                  child: Image.asset(
                                    'assets/i07.jpg', // 替換為您的圖片路徑
                                    fit: BoxFit.fitHeight  // 確保圖片不會填滿整個區域
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  // 其他區域（Skills, Projects, Contact 等）
                  Text(
                    'Skills',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,),
                  ),
                  SizedBox(height: 10),
                  Row(
                    key: skillsKey, // 👈 加上 key
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/03.png', height: 150),
                      SizedBox(width: 30),

                      // 第二張圖片下移一點
                      Transform.translate(
                        offset: Offset(0, 10), // 往下移動 10 pixels
                        child: Image.asset('assets/images/01.png', height: 150),
                      ),
                      SizedBox(width: 30),

                      // 第三張圖片下移一點
                      Transform.translate(
                        offset: Offset(0, 10), // 往下移動 10 pixels
                        child: Image.asset('assets/images/02.png', height: 150),
                      ),
                      SizedBox(width: 30),

                      Image.asset('assets/images/04.png', height: 130),
                      SizedBox(width: 30),

                      Image.asset('assets/images/05.png', height: 180),
                      SizedBox(width: 30),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Projects Section

                  // Text(
                  //   'Projects',
                  //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,),
                  // ),
                  Divider(color: Colors.white), // 分隔線
                  // Center(
                  //   child: Text(
                  //     'Projects',
                  //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  //   ),
                  // ),
                  SizedBox(height: 40),

                  Text(
                    'Projects',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,),
                  ),
                  SizedBox(height: 30),

                  // Row(children: [
                  //   ProjectCard(
                  //     title: 'IoT Smart Home',
                  //     description: 'An IoT-based smart home control system.',
                  //   ),
                  //   ProjectCard(
                  //     title: 'Online Learning Platform',
                  //     description:
                  //     'A platform providing courses and practice exercises.',
                  //   ),
                  //   SizedBox(height: 30),
                  // ],),

                  SizedBox(height: 40),
                  Center( key: projectsKey,child:    ProjectThumbnail(
                    imagePath: 'assets/images/x06.png', // 替換為圖片路徑
                    title: 'AI 語音助手 Blueberry',
                    description: '透過語音辨識與ChatGPT API連接對話',
                    time: '語言:Python',
                    url:'https://hackmd.io/@hxZLKNaHQCOvx9imeDCSxA/Sk2RQ6xggx',
                  ),),

                  SizedBox(height: 70),

                  Center(child:  ProjectThumbnail(
                    imagePath: 'assets/ab01.png', // 替換為圖片路徑
                    title: '任務指派系統',
                    description: '公司無紙化、指派任務、推播、上下班打卡',
                    time: '語言:Flutter Mobile Web、Java',
                    url:'https://hackmd.io/@hxZLKNaHQCOvx9imeDCSxA/Syh85Inkxg',
                  ),),

                  SizedBox(height: 70),

                  Center(child:    ProjectThumbnail(
                    imagePath: 'assets/atr.png', // 替換為圖片路徑
                    title: 'EZ Translate 輕鬆翻譯',
                    description: '截圖翻譯 鍵盤快捷翻譯',
                    time: '語言: Flutter desktop',
                    url:'https://hackmd.io/@hxZLKNaHQCOvx9imeDCSxA/S1shXhdkxl',
                  ),),

                  SizedBox(height: 70),



                  Divider(color: Colors.white), // 分隔線




                  // Contact Section
                  Container(
                    key: contactKey, // 👉 加在這裡！
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        ContactCard(label: 'Email', contactInfo: 'lihaoming1215@gmail.com'),
                        ContactCard(label: 'LineID', contactInfo: 'humanity147'),
                      ],
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

class SkillCard extends StatelessWidget {
  final String skill;
  final String imagePath;

  SkillCard({required this.skill, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.1), // 半透明灰色背景
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用 Image.asset 加載本地圖片
            Image.asset(
              imagePath,
              height: 120, // 設定圖片高度
              width: 120,  // 設定圖片寬度
            ),
            SizedBox(height: 10),
            Text(skill, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}


class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(description, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String label;
  final String contactInfo;

  ContactCard({required this.label, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 20, color: Colors.white)),
          Text(contactInfo, style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class IrregularShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // 開始繪製不規則四邊形
    path.moveTo(0, size.height); // 左下角
    path.lineTo(size.width * 0.25, 0); // 左上角（斜邊）
    path.lineTo(size.width, 0); // 右上角（幾乎直線）
    path.lineTo(size.width, size.height); // 右下角
    path.close(); // 關閉路徑，形成四邊形

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class ProjectThumbnail extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String time;
  final String url; // 新增一個 URL 屬性

  ProjectThumbnail({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.time,
    required this.url,
  });

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw '無法開啟 $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1200,
              height: 600,
              color: Color(0xFFF1EDED),
              child: Image.asset(
                imagePath,
                width: 1200,
                height: 600,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                SizedBox(height: 10),
                Text(
                  time,
                  style: TextStyle(fontSize: 17, color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}

