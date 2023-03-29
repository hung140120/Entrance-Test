// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class UserLocation {
  @Id() 
  int id;
  final double latitude;
  final double longitude;

  UserLocation({
    this.id = 0,
    required this.latitude,
    required this.longitude,
  });

  UserLocation copyWith({
    double? latitude,
    double? longitude,
  }) {
    return UserLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() => 'UserLocation(id: $id, latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant UserLocation other) {
    if (identical(this, other)) return true;
  
    return 
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
