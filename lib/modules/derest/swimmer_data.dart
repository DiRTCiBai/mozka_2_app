class SwimmerData {
  String voornaam;
  String achternaam;
  int geboortejaar;
  String email;
  String geslacht;
  String ID;
  String groep;
  bool aanwezig = false;

  SwimmerData({
    this.voornaam,
    this.achternaam,
    this.geboortejaar,
    this.email,
    this.geslacht = 'man',
    this.ID,
    this.groep,
  });

  void ToggleGender() {
    if (geslacht == 'man') {
      geslacht = 'vrouw';
    } else if (geslacht == 'vrouw') {
      geslacht = 'man';
    }
  }

  void PrintData() {
    print(voornaam);
    print(achternaam);
    print(geboortejaar);
    print(email);
    print(geslacht);
    print(ID);
  }
}
