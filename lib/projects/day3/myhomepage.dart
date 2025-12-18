import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          Block1(),
          SizedBox(height: 10),
          Block2(),
          SizedBox(height: 10),
          Block3(),
          SizedBox(height: 10),
          Block4(),
          SizedBox(height: 10),
          Block5(),
        ]
      ),
    );
  }

  Widget Block1() {
    const className = "XML và ứng dụng - Nhóm 1";
    const classCode = "2025-2026.1.TIN4583.001";
    const quantity = "58 học viên";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  className,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ],
          ),
          Text(classCode, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text(quantity, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget Block2() {
    const className = "Lập trình ứng dụng cho các thiết bị di động - Nhóm 6";
    const classCode = "2025-2026.1.TIN4403.006";
    const quantity = "55 học viên";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  className,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ],
          ),
          Text(classCode, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text(quantity, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget Block3() {
    const className = "Lập trình ứng dụng cho các thiết bị di động - Nhóm 5";
    const classCode = "2025-2026.1.TIN4403.005";
    const quantity = "52 học viên";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  className,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ],
          ),
          Text(classCode, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text(quantity, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget Block4() {
    const className = "Lập trình ứng dụng cho các thiết bị di động - Nhóm 4";
    const classCode = "2025-2026.1.TIN4403.004";
    const quantity = "50 học viên";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  className,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ],
          ),
          Text(classCode, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text(quantity, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget Block5() {
    const className = "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3";
    const classCode = "2025-2026.1.TIN4403.003";
    const quantity = "52 học viên";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  className,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ],
          ),
          Text(classCode, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text(quantity, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}