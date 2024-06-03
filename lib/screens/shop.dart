import 'package:banhang/screens/loginRegister.dart';
import 'package:flutter/material.dart';
import 'package:banhang/components/comshop.dart';

class Shop extends StatelessWidget {
  final String? userName;
  final String? phone;

  const Shop({
    Key? key,
    required this.userName,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: userName != null
            ? Center(
                child: ExamplePara(
                  userName: userName,
                  phone: phone,
                ),
              )
            : Center(
                child: AlertDialog(
                  title: Text('Yêu cầu đăng nhập'),
                  content: Text('Bạn cần đăng nhập để tiếp tục.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login())); // Chuyển đến màn hình đăng nhập
                      },
                      child: Text('Đăng nhập'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ExamplePara extends StatelessWidget {
  final String? userName;
  final String? phone;
  const ExamplePara({
    Key? key,
    this.userName,
    this.phone,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              image: location.image,
              name: location.name,
              country: location.place,
              loggy: location.loggy,
              price: location.price,
              userName: userName,
              phone: phone,
            ),
        ],
      ),
    );
  }
}

const locations = [
  Location(
    name: 'Hamberger',
    place: 'Việt Nam',
    image: 'assets/mon1.jpg',
    price: '20000',
    loggy:
        'Làm hamburger không khó, nhất là nếu bạn đã có kinh nghiệm làm bánh  mì rồi. Có nhiều cách làm vỏ bánh hamburger nhưng mình chọn bánh mì sữa Hokkaido vì đây là một trong những công thức bánh mì ngọt mà mình ưng ý nhất từ trước đến giờ.',
  ),
  Location(
    name: 'Bánh Xếp',
    place: 'Việt Nam',
    image: 'assets/mon2.jpeg',
    price: '20000',
    loggy:
        'Phần nhân bánh mình dùng rau xà lách, củ cải đỏ, salad guacamole (salad quả bơ kiểu Mexico), phô-mai mềm và thịt bò viên rán. Thịt bò mình chỉ trộn với ít muối, tiêu, bột hành, bột tỏi và oregano khô thôi.',
  ),
  Location(
    name: 'Mỳ Ý',
    place: 'Việt Nam',
    image: 'assets/mon3.jpg',
    price: '20000',
    loggy:
        'Mỳ Ý có xuất xứ từ Italia vào khoảng thế kỷ Ban đầu, chỉ có các thành phần cơ bản như trứng và bột mì được sử dụng để sản xuất loại mỳ này. Tuy nhiên, hiện nay có rất nhiều loại mỳ khác nhau với hình dáng và kích thước khác nhau.',
  ),
  Location(
    name: 'Bánh Đa Tôm',
    place: 'Việt Nam',
    image: 'assets/mon4.jpg',
    price: '20000',
    loggy:
        'Việc chọn loại bánh đa phù hợp với từng món ăn là rất quan trọng để giúp cho món ăn được thơm ngon và ngon miệng hơn. Các loại bánh đa có thể khác nhau về kích cỡ, độ dày hay độ dai của sợVì vậy, bạn nên tìm hiểu kỹ và chọn loại bánh đa phù hợp với món ăn của mình.',
  ),
  Location(
    name: 'Bánh Hoa Quả',
    place: 'Việt Nam',
    image: 'assets/mon5.jpg',
    price: '20000',
    loggy:
        'trong lại chứa đựng những bí quyết gia truyền độc đáo về chất lượng đặc biệt của món đặc sản miền quê Bắc Bộ. Những nguyên liệu để làm bánh đậu xanh như đường, mỡ hoặc dầu ăn phải được lựa chọn kỹ càng. Ông Lương Xuân Hát, Quản đốc phân xưởng.',
  ),
  Location(
    name: 'Salad',
    place: 'Việt Nam',
    image: 'assets/mon6.jpg',
    price: '20000',
    loggy:
        'Món salad được xuất hiện từ lâu, dưới nhiều hình thức chế biến khác nhau. Chẳng hạn, người La Mã, người Hy Lạp cổ đại và người Ba Tư đã trộn hỗn hợp rau củ với một loại nước sốt để ăn. Những món ăn rau trộn như vậy đã trở nên phổ biến ở châu Âu sau cuộc xâm lấn của đế chế La Mã và Hy Lạp.',
  ),
  Location(
    name: 'Salad đặc biệt',
    place: 'Egypt',
    image: 'assets/mon7.jpg',
    price: '20000',
    loggy:
        'Trong cuốn sách tựa Acetaria: A Discourse on Sallets (tạm dịch là) của nhà văn John Evelyn (đồng thời là chuyên gia nông nghiệp) đã đề cập đến vấn đề người Anh cần phải có thời gian để dùng quen món rau trộn. Lúc bấy giờ, nữ hoàng Scotland là Mary đã dùng món rau trộn gồm có quả anh đào, nấm, củ cần tây và trứng luộc được rưới với mùi tạt kem. ',
  ),
];
