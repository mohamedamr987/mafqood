import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../constants.dart';

class BlocTempWidget extends StatelessWidget {
  final Widget successWidget;
  final bool errorState;
  final bool loadingState;
  final Color? loadingColor;
  final Widget? loadingWidget;
  final bool? emptyState;
  final String? emptyTitle;
  const BlocTempWidget({Key? key, required this.successWidget, required this.errorState, required this.loadingState,  this.emptyState,  this.emptyTitle, this.loadingWidget, this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return loadingWidget!;
    if (loadingState) {
      return loadingWidget ??
           Center(
            child: CircularProgressIndicator(
              color: loadingColor??kPrimaryColor,
            ),
          );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(errorState)
             Center(
              child: GeneralText(
                text: kErrorText,
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            )
          else if (emptyState != null && emptyState!)
            Center(
              child: GeneralText(
                text: "Right now, there is no ${emptyTitle!}",
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            )
          else
            successWidget,
        ],
      );
    }
  }
}
