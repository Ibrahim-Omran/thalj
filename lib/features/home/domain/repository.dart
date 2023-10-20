import 'package:http/http.dart';

import '../data/remote_data_source.dart';
import 'models/AcceptedOrders.dart';

class   OffersRepository {
  final OffersRemoteDataSource offersRemoteDataSource;

  OffersRepository(
    this.offersRemoteDataSource,
  );

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    bool isSendOffer = false;

    isSendOffer = await offersRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
    );
    return isSendOffer;
  }

   Future<List<AcceptedOrdersModel>> getOffer() async {
     List<AcceptedOrdersModel> data = await offersRemoteDataSource.getOffers();
    return data;

  }
}
