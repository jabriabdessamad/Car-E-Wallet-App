import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: Color.fromARGB(255, 14, 158, 69),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Container(
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screen_height * 0.1,
            ),
            Container(
              height: screen_height * 0.08,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "RECEIPTS",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: screen_height * 0.15,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Chicken Burger',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1 x 120MAD ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          '120 MAD',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: screen_height * 0.15,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Cheese Burger',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1x 80MAD ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          '80 MAD',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: screen_height * 0.1,
              width: screen_width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL PRICE',
                            style: TextStyle(
                                color: Colors.green[600],
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          '200 MAD',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: screen_height * 0.05,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 172, 76),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15))),
              height: 60,
              width: screen_width * 0.9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TOTAL 200 MAD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Place Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            )
                          ]),
                    )
                  ]),
            )
          ]),
        ),
      )),
    );
  }
}
