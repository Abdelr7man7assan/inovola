class Currency {
  String? result;
  Rates? rates;

  Currency(
      {this.result,

        this.rates});

  Currency.fromJson(Map<String, dynamic> json) {
    result = json['result'];

    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}

class Rates {
  int? uSD;
  double? eGP;
  double? kWD;
  double? sRD;
  double? aED;



  Rates(
      {this.uSD,
        this.aED,
       this.eGP,
      this.kWD,
      this.sRD});

  Rates.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'];
    aED = json['AED'];
    eGP = json['EGP'];
    kWD = json['KWD'];
    sRD = json['SRD'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USD'] = this.uSD;
    data['AED'] = this.aED;
    data['EGP'] = eGP ;
    data['KWD'] = kWD;
    data['SRD'] = sRD;
    return data;
  }

}
