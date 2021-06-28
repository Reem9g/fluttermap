import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CardModel {
  String doctor;
  int cardBackground;
  var cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}


List<CardModel> cards = [
  new CardModel("قلبية", 0xFFec407a, FlutterIcons.heart_ant),
  new CardModel("أسنان", 0xFF5c6bc0, FlutterIcons.tooth_mco),
  new CardModel("عينية", 0xFFfbc02d, TablerIcons.eye),
  new CardModel("أطفال", 0xFF2E7D32, FlutterIcons.baby_faw5s),
  new CardModel("جلدية", 0xFFec407a, FlutterIcons.skip_next_mdi),
  new CardModel("نسائية", 0xFF5c6bc0, FlutterIcons.pregnant_woman_mdi),
  new CardModel("أذنية", 0xFFfbc02d, FlutterIcons.hearing_aid_fou),
];