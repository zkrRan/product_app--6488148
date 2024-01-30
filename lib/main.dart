import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("Product Listing",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const <Widget>[
            ProductBox(
                name: "iPhone",
                description: "iPhone is the stylist phone ever",
                price: 1000,
                image: "iphone.webp"),
            ProductBox(
                name: "Pixel",
                description: "Pixel is the most featureful phone ever",
                price: 800,
                image: "https://www.mobileguruaustralia.com.au/wp-content/uploads/2021/07/Google-Pixel-4.jpg"),
            ProductBox(
                name: "Laptop",
                description: "Laptop is a portable PC",
                price: 2000,
                image: "https://www.powerbuy.co.th/_next/image?url=https%3A%2F%2Fpim.powerbuy.co.th%2FPWBPIM%2Fweb%2FThumbnail%2FImage%2F0909%2F263891.jpg&w=640&q=75"),
            ProductBox(
                name: "Tablet",
                description:
                    "Tablet is the most useful device ever",
                price: 1500,
                image: "https://www.powerbuy.co.th/_next/image?url=https%3A%2F%2Fpim.powerbuy.co.th%2FPWBPIM%2Fweb%2FThumbnail%2FImage%2F0909%2F276907.jpg&w=640&q=75"),
            ProductBox(
                name: "Pendrive",
                description: "iPhone is the stylist phone ever",
                price: 100,
                image: "https://pim-cdn0.ofm.co.th/products/large/4007982.jpg"),
            ProductBox(
                name: "Floppy Drive",
                description: "iPhone is the stylist phone ever",
                price: 20,
                image: "https://m.media-amazon.com/images/I/41HW5Bdz2bL.jpg"),
          ],
        ));
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
    // print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
                    Icons.star,
                    size: size,
                  )
                : Icon(
                    Icons.star_border,
                    size: size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (image.startsWith("http")) {
      imageWidget = Image.network(image);
    } else {
      imageWidget = Image.asset("assets/appimages/$image");
    }

    return Container(
        padding: const EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              imageWidget,
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(description),
                          Text("Price: $price"),
                          RatingBox(),
                        ],
                      )))
            ])));
  }
}
