import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'constants.dart';

class CustomPercentageBar extends StatelessWidget {
  final double percent;
  final String dag;

  CustomPercentageBar({this.percent, this.dag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kpadding),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width * kwidth,
        animation: kanimation,
        lineHeight: klineHeight,
        animationDuration: kanimationDuration,
        percent: percent,
        center: Text("${(percent * 100).roundToDouble()}%", style: klineStyle),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: kprogressColor,
      ),
    );
  }
}

class CustomTableText extends StatelessWidget {
  final String text;

  CustomTableText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kpadding),
      child: Text(
        text,
        style: ktabletext,
      ),
    );
  }
}
