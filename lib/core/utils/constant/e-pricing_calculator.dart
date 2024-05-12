class EPricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);

    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;

    return totalPrice;
  }

  static double getShippingCost(String location) {
    double shippingCost;

    shippingCost = 10.00;

    return shippingCost;
  }

  // Calculate tax
  static double getTaxRateForLocation(String location) {
    double taxRate;

    taxRate = 0.07; // Adjust based on your own logic

    // Return the tax rate
    return taxRate;
  }

  static double calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);

    double taxAmount = productPrice * taxRate;

    return taxAmount;
  }

  static String calculateShippingCoast(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxForLication(String location) {
    return 0.10;
  }
}
