import 'package:flutter/material.dart';

// class Product{
//   const Product({name, category, rating, desc, price})
//     : this.name = name, this.category = category, this.rating = rating, this.desc = desc, this.price = price;

//   final String name;
//   final String category;
//   final int rating;
//   final String desc; 
//   final int price;
// }




class ShoppingListItem extends StatelessWidget {
    @override
    Widget build(BuildContext context){
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Text("no image")
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Text("Catégorie du produit",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Text(
                "Titre du produit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < 4 ? Icons.star : Icons.star_outline,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Text(
                "La description du produit est simple et objective. Celle-ci mentionne toutes les fonctionnalités du produit.",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '99.99 €',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    tooltip: 'Add to cart',
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

class AccountScreenState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon compte'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Mon compte',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Prénom',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "Jean",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Nom',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "Dupont",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Pseudo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "jean.dupont",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Téléphone',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "0606060606",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "exemple@exemple.fr",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Adresse',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Code postal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              initialValue: "",
                              decoration: InputDecoration(
                                hintText: "56470",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ville',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              initialValue: "",
                              decoration: InputDecoration(
                                hintText: "DupontVille",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = ShoppingListItem();
        break;
      case 1:
        page = AccountScreenState();
        break;
      case 2:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 1200,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle),
                      label: Text('Compte'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Accueil'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_basket),
                      label: Text('Panier'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      } 
    );
  }
}

