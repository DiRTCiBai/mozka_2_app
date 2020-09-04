import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/widgets/custom_opmerking.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/functions/stream.dart';

class GetComments extends StatelessWidget {
  SwimmerData2 swimmerData;

  GetComments({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Comments(swimmerData),
      builder:
          (BuildContext context, AsyncSnapshot<List<CommentData>> snapshot) {
        if (snapshot.hasData) {
          final opmerkingen = snapshot.data.reversed;
          List<CustomOpmerking> listOpmerkingen = [];

          for (var opmerking in opmerkingen) {
            final title = opmerking.titel;
            final trainer = opmerking.trainer;
            final datum = opmerking.date;
            final comment = opmerking.comment;
            final detail = opmerking.detail;

            final tempOpmerkingwidget = CustomOpmerking(
              title: title,
              trainer: trainer,
              datum: datum,
              opmerking: comment,
              detail: detail,
            );

            listOpmerkingen.add(tempOpmerkingwidget);
          }

          return Expanded(
            child: ListView(
              reverse: false,
              children: listOpmerkingen,
            ),
          );
        } else {
          return Text('loading');
        }
      },
    );
  }
}
