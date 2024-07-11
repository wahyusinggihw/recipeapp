import 'package:flutter/material.dart';
import 'package:recipe_app/gen/assets.gen.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class IdleItem extends StatefulWidget {
  final String title;
  final bool isNoItem;
  const IdleItem({super.key, required this.title, this.isNoItem = false});

  @override
  State<IdleItem> createState() => _IdleItemState();
}

class _IdleItemState extends State<IdleItem> {
  double opacityLogo = 0;

  void initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      opacityLogo = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setFontSize(50)),
      child: AnimatedOpacity(
        opacity: opacityLogo,
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.isNoItem
                  ? Image.asset(
                      Assets.icons.plate.path,
                      width: setWidth(400),
                    )
                  : Image.asset(
                      Assets.icons.search.path,
                      width: setWidth(400),
                    ),
              // verticalSpace(10),
              Text(
                widget.title,
                style: styleTitle.copyWith(fontSize: setFontSize(50), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
