import 'package:flutter/material.dart';
import 'package:flutter_portfolio/projects/day9/model/product.dart';
import 'api.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {

  @override
  void initState() {
    super.initState();
  }

  List<Product> allProducts = [];
  List<Product> displayProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('List Product', style: TextStyle(fontWeight: FontWeight.bold),)), 
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        ),
      body: FutureBuilder(
        future: test_api.getAllProduct(),
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
          allProducts = snap.data!;
          displayProducts = allProducts; // hiển thị mặc định
          return buildBody();
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildSearchBar(),
        Expanded(child: myListProduct(displayProducts)),
      ],
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) {
          setState(() {
            displayProducts = allProducts.where((p) =>
                p.title.toLowerCase().contains(value.toLowerCase())
            ).toList();
          });
        },
        decoration: InputDecoration(
          hintText: "Tìm kiếm sản phẩm...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }


  Widget myListProduct(List<Product> ls){
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8
      ),
      itemCount: ls.length,
      itemBuilder: (context, index){
        return myProduct(ls[index]);
      }
    );
  }

  Widget myProduct(Product p){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              p.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    p.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${p.price} \$",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      const SizedBox(width: 2),
                      Text(
                        '${p.rating.rate} | ',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Đã bán: ${p.rating.count}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
//JwT