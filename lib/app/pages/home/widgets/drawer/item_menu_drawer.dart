import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemMenuDrawer extends StatelessWidget {
  const ItemMenuDrawer({
    super.key,
    required this.texto,
    required this.icone,
    required this.cor,
    required this.onTap,
  });
  final String texto;
  final IconData icone;
  final Color cor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 230,
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: ShapeDecoration(
            color: cor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            shadows: const [
              BoxShadow(
                color: Color.fromARGB(85, 0, 0, 0),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AutoSizeText(
                texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
                maxLines: 1,
              ),
            ),
            const Gap(20),
            Icon(
              icone,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
