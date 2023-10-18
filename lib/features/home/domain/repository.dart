import 'package:thalj/features/home/domain/models/drivers_model.dart';

import '../data/remote_data_source.dart';

class DriverRepository {
  final DriverRemoteDataSource driverRemoteDataSource;
  DriverRepository(
    this.driverRemoteDataSource,
  );

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    bool isSendOffer = false;

    isSendOffer = await driverRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
    );
    return isSendOffer;
  }

  Future<List<DriversModel>> getDrivers() async {
    List<DriversModel> data = await driverRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    bool isAccepted = await driverRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }
}
