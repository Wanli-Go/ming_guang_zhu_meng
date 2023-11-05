import 'dart:ffi';

import 'package:flutter/material.dart';

// 假设从后端获取的任务列表

List<Task> task_list = [
  Task(name: '背诵将进酒', submit_count: 10, to_be_corrected: 5,Type: '语文',massege: '背诵将进酒全文，要求上传视频'),
  Task(name: '完成几何题', submit_count: 8, to_be_corrected: 3,Type: '数学',massege: '完成人教版数学三年级上第五章课后几何题，要求上传图片'),
  Task(name: '背诵英文单词50个', submit_count: 12, to_be_corrected: 7,Type: '英语',massege: '背诵第第三单元的50个单词'),
];

// 定义一个任务类
class Task {
  String name; // 任务名称
  int submit_count; // 提交总数
  int to_be_corrected; // 待批改数
  String Type;
  String massege;

  Task({required this.name, required this.submit_count, required this.to_be_corrected,required this.Type,required this.massege});
}

class child_Task{
  String child_name;
  String child_id;
  String obtime;
  int state;

  child_Task({required this.child_name,required this.child_id,required this.obtime,required this.state
  });
}

List<child_Task> child_Task_list=[
  child_Task(child_name: '王一',child_id:'1' ,obtime: '2023/11/3' ,state: 0),
  child_Task(child_name: '王二',child_id:'2' ,obtime: '2023/11/4' ,state: 0),
  child_Task(child_name: '王三',child_id:'3' ,obtime: '2023/11/5' ,state: 0),
];


