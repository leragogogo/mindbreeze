import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mindbreeze/data/store/main_screen_store.dart';
import 'package:mindbreeze/ui/res/app_assets.dart';
import 'package:provider/provider.dart';

class MarkTodayButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MarkTodayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SizedBox(
          width: 34,
          height: 34,
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white, width: 3)),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              onPressed: () {
                onPressed();
              },
              child: Provider.of<MainScreenStore>(context, listen: false)
                      .isCalendarPushed
                  ? Image.asset(
                      AppAssets.plusAsset,
                      color: Colors.white,
                    )
                  : Container()),
        );
      },
    );
  }
}
