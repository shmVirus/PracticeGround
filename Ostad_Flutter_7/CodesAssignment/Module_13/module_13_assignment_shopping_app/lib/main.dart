import 'package:flutter/material.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ShoppingCartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<Product> products = [
    Product(
      name: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      imageUrl: 'https://www.pngarts.com/files/9/Black-Hoodie-Pullover-PNG-HD-Quality.png',
    ),
    Product(
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      price: 30,
      imageUrl: 'https://cdn.inksoft.com/images/products/2614/products/06000/Black/front/500.png',
    ),
    Product(
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      imageUrl: 'https://www.sefiles.net/images/library/zoom/fox-racing-flexair-pro-long-sleeve-jersey-404365-1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'My Bag',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  product: products[index],
                  onQuantityChanged: _updateTotalAmount,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Text(
                      '${_getTotalAmount(products)}\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Congratulations! Your order has been placed.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: Text('CHECK OUT'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _getTotalAmount(List<Product> products) {
    return products.fold(
      0,
          (total, product) => total + (product.price * product.quantity),
    );
  }

  void _updateTotalAmount() {
    setState(() {});
  }
}

class ShoppingCartItem extends StatefulWidget {
  final Product product;
  final VoidCallback onQuantityChanged;

  ShoppingCartItem({required this.product, required this.onQuantityChanged});

  @override
  _ShoppingCartItemState createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 50,
                  ),
                );
              },
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Color: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: '${widget.product.color}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ', Size: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: '${widget.product.size}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildRoundButton(
                        icon: Icons.remove,
                        onPressed: () {
                          setState(() {
                            if (widget.product.quantity > 1) {
                              widget.product.quantity--;
                              widget.onQuantityChanged();
                            }
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Text('${widget.product.quantity}'),
                      SizedBox(width: 8),
                      _buildRoundButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            widget.product.quantity++;
                            widget.onQuantityChanged();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.more_vert),
                SizedBox(height: 24),
                Text(
                  '${widget.product.price}\$',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundButton({required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(8),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

class Product {
  final String name;
  final String color;
  final String size;
  final int price;
  final String imageUrl;
  int quantity;

  Product({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}