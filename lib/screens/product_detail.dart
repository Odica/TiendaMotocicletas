import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentSlide = 0;
  int selectedButton = 2;

  void selectButton(int buttonIndex){
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = ['images/1.jpg', 'images/2.jpg', 'images/3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              onPageChanged: (index, _) {
                setState(() {
                  _currentSlide = index;
                });
              },
            ),
            items:
                _image.map((image) {
                  return Builder(
                    builder: (context) {
                      return Image.asset(image, fit: BoxFit.cover);
                    },
                  );
                }).toList(),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Accesorios',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text('Price: \$600.000', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Descripción de producto',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '◾ Esto es una caracteristica del accesorio 1',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '◾ Esto es una caracteristica del accesorio 2',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '◾ Esto es una caracteristica del accesorio 3',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(1);
                    }, 
                    style: ElevatedButton.styleFrom(backgroundColor:
                      selectedButton == 1 ? Colors.purple : Colors.white),
                    child: Text(
                      'RESELL',
                      style: TextStyle(color: selectedButton == 1 ? Colors.white : Colors.black, fontSize: 18),
                    ),
                    ),
                ),
              ),     Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(2);
                    }, 
                    style: ElevatedButton.styleFrom(backgroundColor: selectedButton == 2 ? Colors.purple : Colors.white),
                    child: Text(
                      'AL CARRITO',
                      style: TextStyle(color:selectedButton == 2 ? Colors.white : Colors.black, fontSize: 18),
                    ),
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
