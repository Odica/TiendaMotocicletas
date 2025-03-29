import 'package:flutter/material.dart';
import 'package:tienda_online/screens/custom_scaffold.dart';

class Carrito extends StatefulWidget {
  const Carrito({super.key});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {

  List<String> productNames = [
    'accesorio 1',
    'accesorio 2',
    'accesorio 3',
    'accesorio 4',
    'accesorio 5',
  ]; 

  List<int> quantities = [1,1,1,1,1];
  List<double> prices = [600.000, 320.000, 420.000, 500.000, 60.000];
  List<String> images = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
     ];

  void incrementQuantity(int index){
    setState(() {
      quantities[index]++;
    });
  }

    void decrementQuantity(int index){
    setState(() {
      quantities[index]--;
    });
  }

  double getCartToal(){
    double total = 0.0;
    for (int i= 0; i<productNames.length; i++){
      total += quantities[i] * prices[i];
    }
    return total;
  }

  void showCheckoutDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Pago Procesado'),
        content: Text("¡Pago procesado con éxito!"),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text('Ok')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CARRITO',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productNames.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: Key(productNames[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction){
                        setState(() {
                          productNames.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.cancel, color: Colors.white),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16.0),

                      ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(children: [
                          Image.asset(
                            images[index], 
                            height: 50, 
                            width: 50,),
                        SizedBox(width: 15.0),
                        Column(
                          children: [
                            Text(
                              productNames[index], 
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            ),
                            Text('\$${prices[index]}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                decrementQuantity(index);
                              }, 
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              quantities[index].toString(), 
                              style: TextStyle(fontSize: 18.0),
                            ),
                            IconButton(
                              onPressed: (){
                                incrementQuantity(index);
                              }, 
                              icon: Icon(Icons.add),)
                          ],
                        )
                        ]),
                      ),
                    );
                  }),
                ),
              ),
              Divider(),
              Padding(padding: EdgeInsets.all(16.0),
              child: Row(children: [
                Text('Total a pagar', style: TextStyle(fontSize: 18.0)
                ),
                  SizedBox(width: 50.0),
                  Text('\$${getCartToal().toStringAsFixed(2)}',  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),)
              ],),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
               child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                    onPressed: (){showCheckoutDialog();}, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Procediendo pago'),
                    ),
                  ),
                ],
               ), 
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 3,
    );
  }
}
