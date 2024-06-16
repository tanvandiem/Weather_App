import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemIndex,  
    required this.product, required Null Function() onPressed,
  }) : super(key: key);

final int itemIndex;
final ProductCard product;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20,
        right: 20,
        
      ),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 0,
              ),
              height: 160,
              width: 200,
              child: Image(
                image: NetworkImage(
                    'https://cdn.shopify.com/s/files/1/1461/0984/products/aarnio_originals_ballchair_hallingdal_red_05_1200x.png?v=1619786895'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                  style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                  ),
                  onPressed: () {

                   },
                  child: Text(' Ball Chair Originals Blue',
                  style: TextStyle(fontSize:20),
                  ),
)
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        bottomLeft: Radius.circular(22),),
                      ),
                      child: Text('\$58',
                      // style: Theme.of(context).textTheme.button,
                      ),
                ),
              ]),
            ),)
        ],
      ),
    );
  }
}

class ProductCard1 extends StatelessWidget {
  const ProductCard1({
    Key? key, required Null Function() onPressed,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute(),),),
      child: Container(
        margin: EdgeInsets.only(
          top: 25.0,
          left: 20,
          right: 20,
        ),
        height: 160,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 0,
                ),
                height: 160,
                width: 200,
                child: Image(
                  image: NetworkImage(
                      'https://cdn.shopify.com/s/files/1/1461/0984/products/aarnio_originals_ballchair_dark_blue_09_1200x.png?v=1619787003'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" Ball Chair Blue",style: TextStyle(fontSize: 20),),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          bottomLeft: Radius.circular(22),),
                        ),
                        child: Text('\$58',
                        // style: Theme.of(context).textTheme.button,
                        ),
                  ),
                ]),
              ),)
          ],
        ),
      ),
    );
  }
}

class ProductCard2 extends StatelessWidget {
  const ProductCard2({
    Key? key, required this.img,
  }) : super(key: key);
 final Image img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20,
        right: 20,
      ),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 0,
              ),
              height: 160,
              width: 200,
              child: Image(
                image: NetworkImage(
                    'https://cdn.shopify.com/s/files/1/1461/0984/products/aarnio_originals_ballchair_yellow_02_1200x.png?v=1619786895'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('   Ball Chair Originals Yellow',
                  style: TextStyle(fontSize:20),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        bottomLeft: Radius.circular(22),),
                      ),
                      child: Text('\$58',
                     
                      ),
                ),
              ]),
            ),)
        ],
      ),
    );
  }
}


