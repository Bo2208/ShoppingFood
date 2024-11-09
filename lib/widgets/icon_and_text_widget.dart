import 'package:flutter/cupertino.dart';
import 'package:shop_ban_hang/utils/dimensions.dart';
import 'package:shop_ban_hang/widgets/small_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
