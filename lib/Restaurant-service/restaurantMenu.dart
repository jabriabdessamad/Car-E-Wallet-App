import 'package:car_e_wallet_app/Restaurant-service/Checkout.dart';
import 'package:flutter/material.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({Key? key}) : super(key: key);

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  bool fishVisible = false;
  bool burgerVisible = false;
  bool pastaVisible = false;
  bool pizzaVisible = false;

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
//        backgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.badge,
                  color: Colors.black,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              height: screen_height * 0.30,
              child: Stack(
                children: [
                  Container(
                    height: screen_height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/kfc_image.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: screen_height * 0.2,
                    left: 15,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: screen_height * 0.1,
                      width: screen_width * 0.18,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/kfc.png'),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'KFC Rabat',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Home cook . Fast Food . Burger',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      height: screen_height * 0.04,
                      width: screen_width * 0.3,
                      child: Text(
                        "Home Cook",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      height: screen_height * 0.04,
                      width: screen_width * 0.3,
                      child: Text(
                        "Free Delivery",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '15% OFF',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.03,
                ),
                Container(
                  height: 0.2,
                  width: screen_width,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: screen_width * 0.04,
                ),
                Container(
                  height: screen_height * 0.08,
                  width: screen_width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(children: [
                    SizedBox(
                      width: screen_width * 0.01,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: screen_height * 0.07,
                      width: screen_width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: screen_height * 0.08,
                      width: screen_width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        'About',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ]),
                ),
                Container(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Popular Items',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Most ordered items from this restaurant',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                )),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: screen_height * 0.3,
              width: screen_width,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RestauranPopulartItem(),
                  RestauranPopulartItem(),
                  RestauranPopulartItem(),
                  RestauranPopulartItem()
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              height: screen_height * 0.08,
              width: screen_width,
              child: Text(
                "Category",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              height: 0.2,
              width: screen_width,
              color: Colors.grey[600],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  fishVisible = !fishVisible;
                });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                height: screen_height * 0.1,
                width: screen_width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Fish",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: fishVisible
                          ? Icon(Icons.arrow_drop_down,
                              size: 30, color: Color.fromARGB(255, 16, 172, 76))
                          : Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: Color.fromARGB(255, 16, 172, 76),
                            ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 0.2,
              width: screen_width,
              color: Colors.grey,
            ),
            Visibility(
                visible: fishVisible,
                child: Column(
                  children: [
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                  ],
                )),
            InkWell(
              onTap: () {
                setState(() {
                  burgerVisible = !burgerVisible;
                });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                height: screen_height * 0.1,
                width: screen_width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Burger",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: burgerVisible
                          ? Icon(Icons.arrow_drop_down,
                              size: 30, color: Color.fromARGB(255, 16, 172, 76))
                          : Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: Color.fromARGB(255, 16, 172, 76),
                            ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 0.2,
              width: screen_width,
              color: Colors.grey,
            ),
            Visibility(
                visible: burgerVisible,
                child: Column(
                  children: [
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                  ],
                )),
            InkWell(
              onTap: () {
                setState(() {
                  pastaVisible = !pastaVisible;
                });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                height: screen_height * 0.1,
                width: screen_width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Pasta",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: pastaVisible
                          ? Icon(Icons.arrow_drop_down,
                              size: 30, color: Color.fromARGB(255, 16, 172, 76))
                          : Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: Color.fromARGB(255, 16, 172, 76),
                            ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 0.2,
              width: screen_width,
              color: Colors.grey,
            ),
            Visibility(
                visible: pastaVisible,
                child: Column(
                  children: [
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                  ],
                )),
            InkWell(
              onTap: () {
                setState(() {
                  pizzaVisible = !pizzaVisible;
                });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                height: screen_height * 0.1,
                width: screen_width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Pizza",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: pizzaVisible
                          ? Icon(Icons.arrow_drop_down,
                              size: 30, color: Color.fromARGB(255, 16, 172, 76))
                          : Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: Color.fromARGB(255, 16, 172, 76),
                            ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 0.2,
              width: screen_width,
              color: Colors.grey,
            ),
            Visibility(
                visible: pizzaVisible,
                child: Column(
                  children: [
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                    RestaurantItem(),
                  ],
                )),
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 172, 76),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              height: 80,
              width: screen_width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.shop,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('5 items',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          Text("200 MAD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800))
                        ],
                      )
                    ]),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Checkout()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 50,
                        width: 130,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("Order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800)),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 28,
                              )
                            ]),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 14, 158, 69),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    )
                  ]),
            )
          ]),
        ),
      ),
    ));
  }
}

class RestaurantItem extends StatefulWidget {
  const RestaurantItem({Key? key}) : super(key: key);

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      height: screen_width * 0.3,
      width: screen_width,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Burger',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Home cook . Fast Food ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: screen_height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: Text(
                          "75 MAD",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      width: screen_width * 0.08,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: screen_height * 0.04,
                      width: screen_width * 0.15,
                      child: Text(
                        "+ ADD",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
              height: screen_height * 0.15,
              width: screen_width * 0.25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/kfcburger.png'),
                  )),
            ),
          ]),
        ),
      ]),
    );
  }
}

class RestauranPopulartItem extends StatefulWidget {
  const RestauranPopulartItem({Key? key}) : super(key: key);

  @override
  State<RestauranPopulartItem> createState() => _RestauranPopulartItemState();
}

class _RestauranPopulartItemState extends State<RestauranPopulartItem> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: screen_height * 0.4,
        width: screen_width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white),
        child: Column(children: [
          Container(
            height: screen_height * 0.15,
            width: screen_width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.zero),
              image: DecorationImage(
                  image: AssetImage('assets/kfc_image.png'), fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Column(children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Cappuccino',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Home cook . Fast Food ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  )),
            ]),
          ),
          SizedBox(
            height: screen_height * 0.01,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: screen_height * 0.03,
            width: screen_width * 0.15,
            child: Text(
              "+ ADD",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ]));
  }
}
