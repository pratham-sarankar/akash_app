import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteDisplay extends StatefulWidget {
  const QuoteDisplay(
      {Key? key,
      this.quote = 'This is a example quote in case nothing is provided.',
      this.speaker = 'App developer'})
      : super(key: key);
  final String quote;
  final String speaker;

  @override
  QuoteDisplayState createState() => QuoteDisplayState();
}

class QuoteDisplayState extends State<QuoteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Divider(
            height: 25,
            thickness: 2,
            color: Colors.black.withOpacity(0.5),
            indent: MediaQuery.of(context).size.width * 0.36,
            endIndent: MediaQuery.of(context).size.width * 0.36,
          ),
          Text("\"${widget.quote}\"",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                letterSpacing: 0.01,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.8),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(widget.speaker,
              style: GoogleFonts.poppins(
                fontSize: 15,
                letterSpacing: 0.01,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.4),
              )),
        ],
      ),
    );
  }
}
