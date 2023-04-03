import 'dart:convert';

Dog postFromJson(String str) => Dog.fromJson(json.decode(str));
class Dog {
    Dog({
        required this.url,
    });

    String url;
    late String name;

    factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        url: json["message"],
    );

}