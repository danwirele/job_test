import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  static final pageController = PageController();

  final List<String> imageList;

  const CarouselSlider({
    super.key,
    required this.imageList,
  });

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final length = widget.imageList.length;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 257),
      child: Stack(
        children: [
          PageView.builder(
            controller: CarouselSlider.pageController,
            itemCount: length,
            onPageChanged: (newIndex) {
              setState(() {
                currentImageIndex = newIndex;
              });
            },
            itemBuilder: (context, i) => Image.network(
              widget.imageList[i],
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Text('Ошибка сети'),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                return Stack(
                  children: [
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: child,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: List<Widget>.generate(
                    length,
                    (index) => CircleAvatar(
                      radius: 3.5,
                      backgroundColor: currentImageIndex == index ? Colors.black : Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
