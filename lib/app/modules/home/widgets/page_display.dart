import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDisplay extends StatefulWidget {
  const PageDisplay(
      {Key? key,
      this.photoList = const [],
      this.verticalMargin = 15,
      this.title = '',
      this.capitalizeTitle = false,
      this.height = 250,
      this.duration = const Duration(
        seconds: 5,
      ),
      this.animate = false})
      : super(key: key);
  final List<String> photoList;
  final bool capitalizeTitle;
  final String title;
  final double height;
  final double verticalMargin;
  final Duration duration;
  final bool animate;

  @override
  PageDisplayState createState() => PageDisplayState();
}

class PageDisplayState extends State<PageDisplay> {
  late int selectedIndex;
  late PageController controller;
  late Timer animationTimer;

  @override
  void initState() {
    selectedIndex = 0;
    controller = PageController();
    if (widget.animate) {
      Timer.periodic(
        widget.duration,
        (timer) {
          if (!mounted) {
            timer.cancel();
          }
          if (mounted && widget.photoList.isNotEmpty) {
            int index = (timer.tick + 1) % widget.photoList.length;
            if (index == 0) {
              controller.jumpToPage(0);
            } else {
              controller.animateToPage(
                timer.tick % widget.photoList.length,
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
              );
            }
          }
        },
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: widget.verticalMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title.isNotEmpty)
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.capitalizeTitle
                      ? widget.title.toUpperCase()
                      : widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.70),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (widget.photoList.isNotEmpty)
            Container(
              height: widget.height,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     child: MyntraPhotoView(
                      //       index: index,
                      //       photos: widget.photoList,
                      //     ),
                      //     type: PageTransitionType.fade,
                      //     duration: Duration(
                      //       seconds: 1,
                      //     ),
                      //     reverseDuration: Duration(
                      //       milliseconds: 500,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Hero(
                      tag: widget.photoList[index].hashCode,
                      child: PageDisplayBanner(
                        imageURl: widget.photoList[
                            (index % widget.photoList.length).toInt()],
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index % widget.photoList.length;
                  });
                },
              ),
            ),
          if (widget.photoList.length > 1)
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.photoList.length,
                      (index) => Pointer(isActive: index == selectedIndex)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PageDisplayBanner extends StatelessWidget {
  const PageDisplayBanner({Key? key, this.height = 270, required this.imageURl})
      : super(key: key);
  final double height;
  final String imageURl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(
        //       imageURl,
        //     ),
        //     fit: BoxFit.fitWidth,
        //   ),
        // ),
        child: Image.network(
          imageURl,
          fit: BoxFit.fill,
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class Pointer extends StatelessWidget {
  const Pointer({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      margin: const EdgeInsets.only(right: 5),
      width: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
