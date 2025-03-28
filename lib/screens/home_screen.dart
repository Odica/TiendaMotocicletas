import 'package:flutter/material.dart';
import 'package:tienda_online/screens/custom_scaffold.dart';
import 'package:tienda_online/screens/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];

  @override
  void initState() {
    super.initState();
    cardItems = [
      CardItem(
        title: 'accesorio 1',
        pricing: '\$300.000',
        images: 'images/1.jpg',
      ),
      CardItem(
        title: 'accesorio 2',
        pricing: '\$400.000',
        images: 'images/2.jpg',
      ),
      CardItem(
        title: 'accesorio 3',
        pricing: '\$500.000',
        images: 'images/3.jpg',
      ),
      CardItem(
        title: 'accesorio 4',
        pricing: '\$600.000',
        images: 'images/4.jpg',
      ),
      // CardItem(
      //   title: 'accesorio 5',
      //   pricing: '\$100.000',
      //   images: 'images/5.jpg',
      // ),CardItem(
      //   title: 'accesorio 6',
      //   pricing: '\$800.000',
      //   images: 'images/6.jpg',
      // )
      // ,CardItem(
      //   title: 'accesorio 7',
      //   pricing: '\$600.000',
      //   images: 'images/7.jpg',
      // ),CardItem(
      //   title: 'accesorio 8',
      //   pricing: '\$60.000',
      //   images: 'images/8.jpg',
      // ),CardItem(
      //   title: 'accesorio 9',
      //   pricing: '\$500.000',
      //   images: 'images/9.jpg',
      // ),CardItem(
      //   title: 'accesorio 10',
      //   pricing: '\$300.000',
      //   images: 'images/10.jpg',
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.purple[700]),
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: cardItems.map((cardItem){
                  return buildCard(cardItem);
                  }). toList(),
            ),
          ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 0,
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async{
        await Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Image.asset(cardItem.images, 
                  fit: BoxFit.cover);
                },
              ),
            ),
            ListTile(
              title: Text(
                cardItem.title, 
                style: TextStyle(color: Colors.black)
                ),
                subtitle: Text(cardItem.pricing),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text('Premium'),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final String pricing;
  final String images;

  CardItem({required this.title, required this.pricing, required this.images});
}
  
  // // Lista de productos simulados
  // final List<Product> products = [
  //   Product(
  //     id: '1',
  //     title: 'Casco de Moto',
  //     description: 'Casco para motociclistas de alta calidad.',
  //     price: 120.00,
  //     imageUrl:
  //         'https://http2.mlstatic.com/D_NQ_NP_726973-MCO74423431126_022024-O.webp',
  //   ),
  //   Product(
  //     id: '2',
  //     title: 'Guantes para moto',
  //     description: 'Guantes resistentes al agua y al frío.',
  //     price: 35.00,
  //     imageUrl:
  //         'https://http2.mlstatic.com/D_NQ_NP_958195-MCO46079244250_052021-O.webp',
  //   ),
  //   Product(
  //     id: '3',
  //     title: 'Chaqueta para moto',
  //     description: 'Chaqueta protectora para motociclistas.',
  //     price: 85.00,
  //     imageUrl:
  //         'https://http2.mlstatic.com/D_NQ_NP_869554-MCO70088068745_062023-O.webp',
  //   ),
  // ];

  // Future<void> _logout(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();

  //   Navigator.of(
  //     context,
  //   ).pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Tienda de Motocicletas'),
  //       actions: [
  //         IconButton(
  //           onPressed: () => _logout(context),
  //           icon: const Icon(Icons.exit_to_app),
  //         ),
  //       ],
  //     ),
  //     body: GridView.builder(
  //       padding: const EdgeInsets.all(10),
  //       itemCount: products.length,
  //       itemBuilder: (ctx, index) => ProductCard(product: products[index]),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2, // Dos columnas
  //         childAspectRatio: 3 / 2,
  //         crossAxisSpacing: 10,
  //         mainAxisSpacing: 10,
  //       ),
  //     ),
  //   );
  // }
