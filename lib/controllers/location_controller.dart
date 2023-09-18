import 'package:ecommerce/data/repositories/location_repo.dart';
import 'package:ecommerce/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({
    required this.locationRepo,
  });

  bool _loading = false;

  late Position _position;

  late Position _pickPosition;

  Placemark _placeMark = Placemark();

  Placemark _pickPlaceMark = Placemark();

  List<Address> _addressList = [];

  late List<Address> _allAddressList = [];

  List<String> _addressTypeList = ["home", "office", "others"];

  int _addressTypeIndex = 0;

  List<Address> get addressList => _addressList;

  late Map<String, dynamic> _getAddress;

  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;

  bool _updateAddressData = true;

  bool _changeAddress = true;

  bool get loading => _loading;

  Position get position => _position;

  Position get pickPosition => _pickPosition;

  Placemark get placeMark => _placeMark;

  Placemark get pickPlaceMark => _pickPlaceMark;

  void setMapController(GoogleMapController mapController)  {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition cameraPosition, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
        if (_changeAddress) {
          String _address = await getAddressfromGeocode(
            LatLng(cameraPosition.target.latitude,
                cameraPosition.target.longitude),
          );
          fromAddress
              ? _placeMark = Placemark(name: _address)
              : _pickPlaceMark = Placemark(name: _address);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressfromGeocode(LatLng latLng) async {
    String _address = "UnKnown Location Found";
    Response response = await locationRepo.getAddressfromGeocode(latLng);
    if (response.body['status'] == 'OK') {
      _address = response.body['results'][0]['formatted_address'].toString();
    } else {
      print("Error in getting the google api");
    }
    return _address;
  }
}
