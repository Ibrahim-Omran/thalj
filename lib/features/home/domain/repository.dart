
import '../data/remote_data_source.dart';

class SendOfferRepository {
  final SendOfferRemoteDataSource sendOfferRemoteDataSource;
  SendOfferRepository(this.sendOfferRemoteDataSource,);

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    bool isSendOffer = false;

    isSendOffer =
        await sendOfferRemoteDataSource.sendOffer(name: name, phone: phone,price: price, );
    return isSendOffer;
  }



}
