import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              "Free Shipping For You Till Midnight.",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.black.withOpacity(0.60),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Image.network(
            'https://www.pngall.com/wp-content/uploads/2016/07/Special-offer-Download-PNG.png',
            height: 40,
          )
        ],
      ),
    );
  }
}
