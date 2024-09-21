import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: _inProgress
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItem(product: productList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScreenAddProduct()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    setState(() {
      _inProgress = true;
    });

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ProductList');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      setState(() {
        productList = data.map((item) => Product.fromJson(item)).toList();
        _inProgress = false;
      });
    } else {
      setState(() {
        _inProgress = false;
      });
    }
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          const Divider(),
          OverflowBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ScreenEditProduct(product: product);
                    }),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  // Call a delete function (not implemented)
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ScreenAddProduct extends StatefulWidget {
  const ScreenAddProduct({Key? key}) : super(key: key);

  @override
  ScreenAddProductState createState() => ScreenAddProductState();
}

class ScreenAddProductState extends State<ScreenAddProduct> {
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _imageUrlController.dispose();
    _unitPriceController.dispose();
    _quantityController.dispose();
    _totalPriceController.dispose();
    super.dispose();
  }

  Future<void> _submitNewProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    final Uri productApi = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    final response = await http.post(
      productApi,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "ProductName": _nameController.text,
        "ProductCode": _codeController.text,
        "Img": _imageUrlController.text,
        "UnitPrice": _unitPriceController.text,
        "Qty": _quantityController.text,
        "TotalPrice": _totalPriceController.text,
      }),
    );

    setState(() {
      _isSaving = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product successfully added!')),
      );
      Navigator.pop(context); // Close the form and go back
    }
  }

  Widget _buildInputField(
      {required TextEditingController controller, required String label, bool isNumeric = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildInputField(controller: _nameController, label: 'Product Name'),
              _buildInputField(controller: _codeController, label: 'Product Code'),
              _buildInputField(controller: _imageUrlController, label: 'Image URL'),
              _buildInputField(controller: _unitPriceController, label: 'Unit Price', isNumeric: true),
              _buildInputField(controller: _quantityController, label: 'Quantity', isNumeric: true),
              _buildInputField(controller: _totalPriceController, label: 'Total Price', isNumeric: true),
              const SizedBox(height: 20),
              _isSaving
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _submitNewProduct,
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenEditProduct extends StatefulWidget {
  final Product product;
  const ScreenEditProduct({Key? key, required this.product}) : super(key: key);

  @override
  ScreenEditProductState createState() => ScreenEditProductState();
}

class ScreenEditProductState extends State<ScreenEditProduct> {
  final _editFormKey = GlobalKey<FormState>();
  bool _isUpdating = false;

  late TextEditingController _productNameController;
  late TextEditingController _productCodeController;
  late TextEditingController _productImageUrlController;
  late TextEditingController _unitPriceController;
  late TextEditingController _quantityController;
  late TextEditingController _totalPriceController;

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController(text: widget.product.productName);
    _productCodeController = TextEditingController(text: widget.product.productCode);
    _productImageUrlController = TextEditingController(text: widget.product.productImage);
    _unitPriceController = TextEditingController(text: widget.product.unitPrice);
    _quantityController = TextEditingController(text: widget.product.quantity);
    _totalPriceController = TextEditingController(text: widget.product.totalPrice);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isNumeric = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _editFormKey,
          child: ListView(
            children: [
              _buildTextField(controller: _productNameController, label: 'Product Name'),
              _buildTextField(controller: _productCodeController, label: 'Product Code'),
              _buildTextField(controller: _productImageUrlController, label: 'Image URL'),
              _buildTextField(controller: _unitPriceController, label: 'Unit Price', isNumeric: true),
              _buildTextField(controller: _quantityController, label: 'Quantity', isNumeric: true),
              _buildTextField(controller: _totalPriceController, label: 'Total Price', isNumeric: true),
              const SizedBox(height: 20),
              _isUpdating
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _updateProductDetails,
                child: const Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateProductDetails() async {
    if (!_editFormKey.currentState!.validate()) return;

    setState(() {
      _isUpdating = true;
    });

    final Uri updateApi = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');
    final response = await http.post(
      updateApi,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "ProductName": _productNameController.text,
        "ProductCode": _productCodeController.text,
        "Img": _productImageUrlController.text,
        "UnitPrice": _unitPriceController.text,
        "Qty": _quantityController.text,
        "TotalPrice": _totalPriceController.text,
      }),
    );

    setState(() {
      _isUpdating = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product updated successfully!')),
      );
      Navigator.pop(context); // Go back after update
    }
  }
}
