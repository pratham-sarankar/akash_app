enum TaxType {
  amount,
  percentage,
}

extension TaxTypeExtension on TaxType {
  TaxType decodeTaxType(String code) {
    if (code == "amount") {
      return TaxType.amount;
    }
    return TaxType.percentage;
  }

  static TaxType fromString(String code) {
    if (code == "amount") {
      return TaxType.amount;
    } else {
      return TaxType.percentage;
    }
  }

  String toStringCode() {
    if (this == TaxType.amount) {
      return "amount";
    } else {
      return "percentage";
    }
  }
}
