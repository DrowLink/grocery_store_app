import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/components/grocery_item_tile.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:grocery_store_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
          },
        )),
        backgroundColor: Color.fromARGB(31, 159, 159, 159),
        child: Icon(Icons.shopping_bag_outlined),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48.0,
            ),

            //good morning
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Good Morning!",
                style: GoogleFonts.abrilFatface(
                  fontSize: 24,
                ),
              ),
            ),

            const SizedBox(
              height: 4.0,
            ),

            //lets order fresh
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Lets order fresh items for you!",
                style: GoogleFonts.abrilFatface(
                  fontSize: 36,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            //fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
