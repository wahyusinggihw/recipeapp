import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget? trailling;
  final Widget? leading;
  final VoidCallback? onClick;
  const SettingItem({
    super.key,
    required this.title,
    required this.trailling,
    this.leading,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(10), horizontal: setWidth(30)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onTap: onClick,
          child: ListTile(
            leading: leading,
            title: Text(title,
                style: styleTitle.copyWith(
                  fontSize: setFontSize(40),
                  fontWeight: FontWeight.w400,
                )),
            // subtitle: Text(subtitle,
            //     style: styleTitle.copyWith(
            //       fontSize: setFontSize(35),
            //       fontWeight: FontWeight.w400,
            //     )),
            trailing: trailling,
          ),
        ),
      ),
    );
  }
}
