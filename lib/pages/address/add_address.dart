import 'dart:async';

import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/location_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();

  final TextEditingController _contactPersonName = TextEditingController();

  final TextEditingController _contactPersonNumber = TextEditingController();

  late bool _isLoggedIn;

  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(45.51563, -122.677433),
    zoom: 17,
  );

  late LatLng _initialPosition = LatLng(
    45.51563,
    -122.677433,
  );

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();

    // if (_isLoggedIn && Get.find<UserController>().user == null) {
    //   Get.find<UserController>().getUserInfo();
    // }

    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(
            Get.find<LocationController>().getAddress['latitude'],
          ),
          double.parse(
            Get.find<LocationController>().getAddress['longitude'],
          ),
        ),
      );
      _initialPosition = LatLng(
        double.parse(
          Get.find<LocationController>().getAddress['latitude'],
        ),
        double.parse(
          Get.find<LocationController>().getAddress['longitude'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Address Page",
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          _addressController.text = '${locationController.placeMark.name ?? ""}'
              '${locationController.placeMark.locality ?? ""}'
              '${locationController.pickPlaceMark.postalCode ?? ""}'
              '${locationController.pickPlaceMark.country ?? ""}';
          return Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 17,
                      ),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: true,
                      onCameraIdle: () {
                        locationController.updatePosition(
                          _cameraPosition,
                          true,
                        );
                      },
                      onCameraMove: ((position) => _cameraPosition = position),
                      onMapCreated: (GoogleMapController controller) {
                        locationController.setMapController(controller);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
