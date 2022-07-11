final String transactionTable = "TTable";

class TransactionField {
  static final String id = "_id";
  static final String value = "money";
  static final String name = "name";
  static final String url = "url";
}

class TransactionList {
  final int? id;
  final String name;
  final String url;
  final String value;
  TransactionList(
      {this.id, required this.name, required this.url, required this.value});
  static TransactionList fromJson(Map<String, Object?> json) => TransactionList(
      id: json[TransactionField.id] as int,
      name: json[TransactionField.name] as String,
      url: json[TransactionField.url] as String,
      value: json[TransactionField.value] as String);
  Map<String, Object?> toJson() => {
        TransactionField.id: id,
        TransactionField.name: name,
        TransactionField.url: url,
        TransactionField.value: value,
      };
}
