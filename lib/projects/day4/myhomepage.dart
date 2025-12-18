import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody(){
    final imageList = [
      'assets/images/PictureDay4_1.png',
      'assets/images/PictureDay4_2.png',
      'assets/images/PictureDay4_3.png',
      'assets/images/PictureDay4_4.png'
    ];
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.extension))
            ],
          ),
          const SizedBox(height: 15),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 70, color: Colors.black),
              children: [
                TextSpan(
                  text: 'Welcome, ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'Charlie')
              ]
            )
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Search'
            ),
          ),
          const SizedBox(height: 50),
          const Text('Save Places', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: imageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}