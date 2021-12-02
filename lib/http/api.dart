import 'dart:convert';

import 'package:http/http.dart' as http;

class api {
  static Future<List<model>> API(String test) async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/$test');
    List<model> list = [];
    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);

    for (var x in responseBody) {
      list.add(model.fromJson(x));
    }
    print("=======================================");
    print(list[1].company!.name);
    print("=======================================");

    return list;
  }
}

class Address {
  late String? street, suite, city, zipcode;
  late Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(dynamic json) {
    street = json["street"];
    suite = json["suite"];
    city = json["city"];
    zipcode = json["zipcode"];
    geo = json["geo"] != null ? Geo.fromJson(json["geo"]) : null;
  }
}

class Geo {
  late String? lat, lang;

  Geo({this.lat, this.lang});

  Geo.fromJson(dynamic json) {
    lat = json["lat"];
    lang = json["lang"];
  }
}

class Company {
  late String? name, catchPhrase, bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(dynamic json) {
    name = json["name"];
    catchPhrase = json["catchPhrase"];
    bs = json["bs"];
  }
}

class model {
  late int? id;
  late String? name, username, email, phone, webSite;
  late Address? address;
  late Company? company;

  model(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.webSite,
      this.address,
      this.company});

  model.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    webSite = json["webSite"];
    address =
        json["address"] != null ? Address.fromJson(json["address"]) : null;
    company =
        json["company"] != null ? Company.fromJson(json["company"]) : null;
  }
}
