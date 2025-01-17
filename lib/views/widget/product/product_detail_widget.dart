import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/product_model.dart';

class ProductDetailWidget extends StatefulWidget {
  final Product product;

  List<String> getImages() {
    return product.images ?? [];
  }

  const ProductDetailWidget({super.key, required this.product});

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  void clickNextImage(String type) {
    int active = activeIndex;
    int length = widget.getImages().length;
    if (type == 'left') {
      if (active == 0) {
        _controller.animateToPage(length - 1);
      } else {
        _controller.animateToPage(active -= 1);
      }
    } else {
      if (active == length - 1) {
        _controller.animateToPage(0);
      } else {
        // print(active += 1);
        _controller.animateToPage(active += 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = (widget.getImages().length > 0)
        ? widget
            .getImages()
            .map((item) => Container(
                  margin: EdgeInsets.all(5.0),
                  child: Image.network(
                    item,
                    fit: BoxFit.fill,
                  ),
                ))
            .toList()
        : [Text('No Image')];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 500,
            // color: Colors.deepOrange,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () => {clickNextImage('left')},
                          icon: Icon(Icons.arrow_back)),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () => {
                                // print('left')
                                clickNextImage('right')
                              },
                          icon: Icon(Icons.arrow_forward)),
                    ),
                  ),
                ),
                Center(
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        // aspectRatio: 1.0,
                        // enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, res) {
                          setState(() {
                            activeIndex = index;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.getImages().length,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.deepOrange),
              onDotClicked: (index) {
                _controller.animateToPage(index);
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.product.title}' ,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.product.price} VNĐ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(widget.product.availabilityStatus.toString(), style: TextStyle(fontSize: 15),),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  widget.product.description ?? '',
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
