import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeadLineWidget extends StatefulWidget {
  const DeadLineWidget(
      {Key? key, this.title = 'SALE ENDS IN', this.capitalizeTitle = true})
      : super(key: key);
  final String title;
  final bool capitalizeTitle;

  @override
  DeadLineWidgetState createState() => DeadLineWidgetState();
}

class DeadLineWidgetState extends State<DeadLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * (0.35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _SaleTimeColumn(
                  top: '20',
                  bottom: 'hrs',
                ),
                _SaleTimeColumn(
                  top: '14',
                  bottom: 'mins',
                ),
                _SaleTimeColumn(
                  top: '55',
                  bottom: 'sec',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SaleTimeColumn extends StatelessWidget {
  const _SaleTimeColumn({Key? key, required this.top, required this.bottom})
      : super(key: key);
  final String top;
  final String bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          top,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
        Text(
          bottom,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
