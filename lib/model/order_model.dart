class OrderInfo {
  final int orderID;
  final String customerID;
  final DateTime orderDate;
  final double freight;

  OrderInfo(this.orderID, this.customerID, this.orderDate, this.freight);

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'customerID': customerID,
      'orderDate': orderDate,
      'freight': freight,
    };
  }
}
