import 'package:flutter/material.dart';
import 'package:medusa_demo/main.dart';
import 'package:medusa_demo/product_detail_screen.dart';
import 'package:medusa_flutter/medusa_flutter.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<StoreProductsListRes?>(
          future: medusa.products.list(),
          builder: (BuildContext context,
              AsyncSnapshot<StoreProductsListRes?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) return const Text("No Products found");
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data?.products?.length,
                  itemBuilder: (context, index) =>
                      _ProductItem(product: snapshot.data!.products![index]));
            } else if (snapshot.hasError) {
              return const Text("Something went wrong!");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final Product product;

  const _ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.thumbnail != null)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        product.thumbnail!,
                        width: 150,
                        height: 100,
                        errorBuilder: (context, error, stack) =>
                            const Icon(Icons.warning_amber_outlined),
                      ),
                    ],
                  ),
                ),
              Text(
                product.title!,
                style: Theme.of(context).textTheme.headline6,
              ),
              if (product.subtitle != null)
                Text(
                  product.subtitle!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.variants != null
                    ? (product.variants![0].prices != null
                        ? "${product.variants![0].prices![0].currency?.symbol ?? "\$"} ${product.variants![0].prices![0].amount.toString()}"
                        : "-")
                    : "-",
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
