class SwimmerData {
  String voornaam;
  String achernaam;
  int geboortejaar;
  String email;
  String geslacht;
  String ID;
  bool aanwezig;

  SwimmerData({
    this.voornaam,
    this.achernaam,
    this.geboortejaar,
    this.email,
    this.geslacht = 'man',
    this.ID,
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
    print(achernaam);
    print(geboortejaar);
    print(email);
    print(geslacht);
    print(ID);
  }
}
