# ming_guang："明光筑梦"

**恭喜你已经渡过了难关**，来到了项目开发的阶段。

下面，请大家按照原型进行UI开发，任务分工已经下达到群中。

请注意下面几点：

- 请注意代码、Widget的可复用性。祝哥分工时明确考虑到了这一点，比如**孩子任务**和**志愿社区文章**的显示，可以重复使用许多代码或者Widget。

- 现在我们仅仅处于原型开发阶段。打开`\lib`文件夹，可以发现有如下组织结构：

  - donor文件夹
  - child文件夹
  - volunteer文件夹
  - example文件夹
  - `main.dart`

  `main.dart`是我们程序的切入点。在你想要测试自己开发的某个界面时，请把其中的`home`属性指向你的Widget。

  另外四个文件夹里，每个分别包含view文件夹和model文件夹，以及一个`my_app.dart`。这个文件是一个placeholder，可以删除。

  view文件夹是存储UI组件的代码的地方，一般来讲，一个原型涉及到的组件可以放入一个.dart文件（注意重构，保持代码简洁），而如果一个界面的代码太多也可以单独分出来一个文件。

  model文件夹是存储数据结构的地方。这里，我们**鼓励你自己设计数据结构**，比如如果你需要显示这样一个组件时：

  ```dart
  ListTile(
    onTap: () => notifier.change(),
    title: Text(/*title*/), // Display title
    subtitle: Text(/*description*/), // Display description
    tileColor: Colors.lime.withOpacity(0.3),
  );
  ```

  就需要定义这样的一个数据结构，存储在一个.dart文件中，放入model文件夹中：

  ```dart
  class DataModel {
    final String title;
    final String description;
  
    DataModel({required this.title, required this.description})
  }
  ```

  目前，我们没有考虑UI的逻辑和与后端的交互，我们只需要**按照结构画出一个原型，根据原型所需的数据定义一个数据结构，然后在这个数据结构的基础上定义一些能显示的假数据**即可。example文件夹中给出了一个案例，请大家自行查看。

  
