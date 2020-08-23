class SwimmerData {
  String voornaam;
  String achternaam;
  String geboortejaar;
  String email;
  String geslacht;
  String id;
  String groep;

  SwimmerData(
      {this.groep,
      this.email,
      this.geboortejaar,
      this.achternaam,
      this.voornaam,
      this.id,
      this.geslacht});

  void PrintSwimmerData() {
    print(voornaam);
    print(achternaam);
    print(geboortejaar);
    print(geslacht);
    print(email);
    print(id);
    print(groep);
  }
}
