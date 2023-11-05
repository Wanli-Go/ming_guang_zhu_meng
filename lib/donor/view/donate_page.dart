import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  String _donationType = 'money'; // 默认捐助类型为善款
  TextEditingController _moneyController = TextEditingController();
  TextEditingController _goodsController = TextEditingController();

  void _performDonation() {
    if (_donationType == 'money') {
      // 处理金钱捐赠逻辑
      print('捐赠金额: ${_moneyController.text}');
    } else {
      // 处理物品捐赠逻辑
      print('捐赠物品详情: ${_goodsController.text}');
    }
    // 在这里加入捐赠后的操作，例如跳转页面或弹窗感谢
  }

  @override
  void dispose() {
    _moneyController.dispose();
    _goodsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text('儿童详情', style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 儿童图片
            Expanded(
              child: Image.asset(
                'assets/boy.png', // 请替换为儿童图片的实际路径
                fit: BoxFit.cover,
              ),
            ),
            // 儿童详情
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('姓名：王小花'),
                  Text('年龄：10岁'),
                  Text('学校：北京市第一小学'),
                  Text('详细信息：这里是儿童的其他详细信息...'),
                ],
              ),
            ),
            // 捐助板块
            Expanded(
              child: ListView(children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('捐助方式：',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ListTile(
                        title: const Text('捐助善款'),
                        leading: Radio<String>(
                          value: 'money',
                          groupValue: _donationType,
                          onChanged: (value) {
                            setState(() {
                              _donationType = value!;
                            });
                          },
                        ),
                      ),
                      if (_donationType == 'money')
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '捐赠金额',
                              prefixIcon: Icon(Icons.attach_money),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ListTile(
                        title: const Text('捐助物品'),
                        leading: Radio<String>(
                          value: 'goods',
                          groupValue: _donationType,
                          onChanged: (value) {
                            setState(() {
                              _donationType = value!;
                            });
                          },
                        ),
                      ),
                      if (_donationType == 'goods')
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '物品详情',
                              prefixIcon: Icon(Icons.card_giftcard),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _performDonation,
              child: Text('进行捐助', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // button's fill color
                onPrimary: Colors.white, // button's text color
                minimumSize: Size(double.infinity, 50), // button's size
              ),
            )));
  }
}
