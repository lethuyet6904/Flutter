import 'package:flutter/material.dart';
import 'package:flutter_portfolio/projects/day9/model/product.dart';
import 'api.dart';
import 'cart.dart';
import 'cart_screen.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  final TextEditingController _searchController = TextEditingController();
  final CartStore _cartStore = CartStore(); 
  
  List<Product> allProducts = [];
  List<Product> displayProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      var data = await test_api.getAllProduct();
      setState(() {
        allProducts = data;
        displayProducts = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() { _isLoading = false; });
    }
  }

  void _runFilter() {
    FocusScope.of(context).unfocus();
    String keyword = _searchController.text;
    setState(() {
      if (keyword.isEmpty) {
        displayProducts = allProducts;
      } else {
        displayProducts = allProducts
            .where((p) => p.title.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA), 

      appBar: AppBar(
        backgroundColor: Colors.green, 
        elevation: 0,
        titleSpacing: 0, 

        leading: IconButton(
          icon: const Icon(Icons.storefront, color: Colors.white, size: 28),
          onPressed: () {
            _searchController.clear();
            _runFilter();
          },
        ),

        title: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 10), 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => _runFilter(),
            decoration: InputDecoration(
              hintText: "Bạn tìm gì hôm nay?",
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 22),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                      onPressed: () {
                         _searchController.clear();
                         _runFilter();
                      },
                    )
                  : null,
            ),
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const CartScreen())
                ).then((_) => setState((){}));
              },
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 28, color: Colors.white),
                  if (_cartStore.items.isNotEmpty)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 1.5)
                        ),
                        child: Text(
                          '${_cartStore.items.length}',
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: _isLoading 
            ? const Center(child: CircularProgressIndicator(color: Colors.green))
            : displayProducts.isEmpty
                ? const Center(child: Text("Không tìm thấy sản phẩm!"))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7, // Tỷ lệ thẻ
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: displayProducts.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(displayProducts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Image.network(p.image, fit: BoxFit.contain),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, height: 1.3),
                ),
                const SizedBox(height: 8),
                
                // Giá + Nút Mua
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${p.price}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold, 
                        fontSize: 16
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         _cartStore.addToCart(p);
                         setState(() {});
                         ScaffoldMessenger.of(context).hideCurrentSnackBar();
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text("Đã thêm: ${p.title}"),
                             duration: const Duration(seconds: 1),
                             behavior: SnackBarBehavior.floating,
                             backgroundColor: Colors.black87,
                           )
                         );
                      },
                      child: const Icon(Icons.add_circle, color: Colors.green, size: 28),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                // Rating nhỏ
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                    Text(" ${p.rating.rate}", style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    const Spacer(),
                    Text("Đã bán ${p.rating.count}", style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}