class VAT {
  double rate = 20;
  double vat = 0;
  double amountWithoutVat = 0;
  double amountWithVat = 0;

  VAT.withoutVat(this.amountWithoutVat, this.rate) {
    add();
  }

  VAT.withVat(this.amountWithVat, this.rate) {
    remove();
  }

  void add() {
    vat = amountWithoutVat * (0.01 * rate);
    amountWithVat = amountWithoutVat + vat;
  }

  void remove() {
    amountWithoutVat = (amountWithVat) / (1 + 0.01 * rate);
    vat = amountWithVat - amountWithoutVat;
  }
}
