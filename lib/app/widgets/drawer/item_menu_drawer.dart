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
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: ShapeDecoration(
            color: cor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            shadows: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: Offset(1, 2),
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const Gap(20),
            Container(
              width: 18,
              height: 18,
              child: Icon(
                icone,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
