import 'package:flutter/cupertino.dart';
import 'package:shop_ban_hang/utils/dimensions.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? 20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
