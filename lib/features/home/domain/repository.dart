import 'package:thalj/features/home/domain/models/drivers_model.dart';

import '../data/remote_data_source.dart';

class SendOfferRepository {
  final SendOfferRemoteDataSource sendOfferRemoteDataSource;
  SendOfferRepository(
    this.sendOfferRemoteDataSource,
  );

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    bool isSendOffer = false;

    isSendOffer = await sendOfferRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
    );
    return isSendOffer;
  }

  Future<List<DriversModel>> getDrivers() async {
    List<DriversModel> data = await sendOfferRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    bool isAccepted = await sendOfferRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }
}
