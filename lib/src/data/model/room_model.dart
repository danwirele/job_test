import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'room_model.g.dart';

ListRooms listRoomsFromJson(String str) => ListRooms.fromJson(json.decode(str));

String listRoomsToJson(ListRooms data) => json.encode(data.toJson());

@JsonSerializable()
class ListRooms {
  @JsonKey(name: "rooms")
  List<Room> rooms;

  ListRooms({
    required this.rooms,
  });

  factory ListRooms.fromJson(Map<String, dynamic> json) => _$ListRoomsFromJson(json);

  Map<String, dynamic> toJson() => _$ListRoomsToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "price_per")
  String pricePer;
  @JsonKey(name: "peculiarities")
  List<String> peculiarities;
  @JsonKey(name: "image_urls")
  List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
