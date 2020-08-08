import 'package:mozka_2_app/modules/gender.dart';

class Swimmers {
  String voornaam;
  String achernaam;
  int geboortejaar;
  String email;
  Gender geslacht;

  Swimmers({
    this.voornaam,
    this.achernaam,
    this.geboortejaar,
    this.email,
    this.geslacht = Gender.man,
  });

  void ToggleGender() {
    if (geslacht == Gender.man) {
      geslacht = Gender.vrouw;
    } else if (geslacht == Gender.vrouw) {
      geslacht = Gender.man;
    }
  }

  void PrintData() {
    print(voornaam);
    print(achernaam);
    print(geboortejaar);
    print(email);
    print(geslacht);
  }
}
