import 'package:banhang/screens/buy.dart';
import 'package:banhang/screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:banhang/components/comshop.dart'; // Import file chứa dữ liệu sản phẩm

class SearchBar1 extends StatefulWidget {
  const SearchBar1({Key? key}) : super(key: key);

  @override
  _SearchBar1State createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  TextEditingController _controller = TextEditingController();
  List<Location> filteredLocations =
      []; // Danh sách sản phẩm được lọc dựa trên từ khóa tìm kiếm

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              // Khi giá trị của ô tìm kiếm thay đổi, lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
              setState(() {
                filteredLocations = locations
                    .where((location) =>
                        location.name.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
            onSubmitted: (value) {
              // Khi người dùng ấn Enter sau khi nhập từ khóa, lọc danh sách sản phẩm và hiển thị kết quả
              setState(() {
                filteredLocations = locations
                    .where((location) =>
                        location.name.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
          SizedBox(height: 10), // Khoảng cách giữa ô tìm kiếm và danh sách kết quả
          // Hiển thị danh sách sản phẩm đã lọc
          ListView.builder(
            shrinkWrap: true, // Giảm kích thước của ListView để nó chỉ chiếm không gian cần thiết
            itemCount: filteredLocations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredLocations[index].name), // Hiển thị tên sản phẩm
                onTap: () {
                  // Xử lý khi người dùng chọn một sản phẩm trong danh sách kết quả
                  // Chuyển sang màn hình mua hàng và truyền thông tin sản phẩm
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Buy(
                        loggy: filteredLocations[index].loggy,
                        name: filteredLocations[index].name,
                        image: filteredLocations[index].image,
                        place: filteredLocations[index].place,
                        price: filteredLocations[index].price,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

