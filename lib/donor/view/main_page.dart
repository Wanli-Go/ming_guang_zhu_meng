import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mainShowBox.dart'; // 确保这里的路径是正确的

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 215, 227),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/heart.png',
                      width: 150, // 修改图片宽度
                      height: 150, // 修改图片高度
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, // 添加垂直居中对齐
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "明光筑梦",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 30, // 修改字体大小
                              color: Colors.yellow[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "积小善，成大德",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 25, // 修改字体大小
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: DonationRowWidget(
                    amount1: '1000万元',
                    amount2: '100位',
                  ),
                ),
              ),
              DonationCard(
                title: '爱心捐赠',
                content: '郭老师捐了爱心大蛋糕给云南小朋友,还帮助小朋友背诵将进酒。',
                image: 'assets/zuijinjuanzhu.png',
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: SsdButton(text: '捐助儿童', onTap: onTap)),
              SizedBox(
                height: 20,
              ),
              Center(child: SsdButton(text: '捐助项目', onTap: onTap)),
            ],
          ),
        ),
      ),
    );
  }

  //跳转页面
  void onTap() {}
}
