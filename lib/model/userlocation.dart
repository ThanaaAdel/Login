import 'package:flutter/cupertino.dart';

class UserLocation {
  final String cite;
  final LocationStreet street;
  final String country;
  final String postcode;
  final LocationCoordinate coordinates;
  final LocationTimezoneCordinates timezone;
  UserLocation({
    required this.cite,
    required this.street,
    required this.country,
    required this.timezone,
    required this.coordinates,
    required this.postcode,
});

}

class LocationCoordinate {
  final String longitude;
  final String latitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
});
}

class LocationTimezoneCordinates {
  final String offset;
  final String description;
  LocationTimezoneCordinates({
    required this.offset,
    required this.description,
  });
}

class LocationStreet {
  final int nuber;
  final String name;
  LocationStreet({
    required this.name,
    required this.nuber,
  });
}
