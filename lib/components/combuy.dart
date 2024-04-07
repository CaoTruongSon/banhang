import 'package:flutter/material.dart';

class TextStartCom extends StatefulWidget {
  const TextStartCom({required this.name, required this.location, super.key});
  final String name;
  final String location;
  @override
  State<TextStartCom> createState() => _TextStartCom();
}

class _TextStartCom extends State<TextStartCom> {
  bool isStar = false;
  void _starClick() {
    setState(() {
      isStar = !isStar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Text(
                  widget.location,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _starClick,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: isStar ? Colors.yellow[500] : Colors.grey[500],
                ),
                const Text('41'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Image7 extends StatelessWidget {
  const Image7({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit
          .cover, //Đảm bảo rằng hình ảnh sẽ phủ đầy toàn bộ kích thước của widget, không quan trọng là việc kéo dãn hình ảnh có thể bị méo
    );
  }
}

class Button7 extends StatelessWidget {
  const Button7(
      {required this.color,
      required this.icon,
      required this.label,
      required this.ontap,
      super.key});

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // để dùng onTap
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize
            .min, //Widget sẽ có kích thước chính nhỏ nhất có thể để vừa với nội dung bên trong
        mainAxisAlignment: MainAxisAlignment
            .center, // căn giữa theo row: ngang, và column: dọc
        children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                    FontWeight.w400, // độ đậm nhạt của chữ, 400 là bình thường
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Text7 extends StatelessWidget {
  const Text7({required this.text7, super.key});

  final String text7;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32), //(khoảng trống) xung quanh một widget
      child: Text(
        text7,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        // softWrap:
        //     true, // cho phép văn bản tự động xuống dòng (soft wrap) khi nó vượt quá chiều rộng của container chứa nó
      ),
    );
  }
}

class CounterClick extends StatelessWidget{
  const CounterClick({required this.onPressed,required this.nameText,Key?key}):super(key:key);


final VoidCallback onPressed;
final String nameText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(nameText),
      );
  }

}

class CounterNumber extends StatelessWidget{
  const CounterNumber({required this.count,Key?key}):super(key:key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '$count',
        style: const TextStyle(
                color: Colors.black,
              ),
        ),
    );
  }

}
