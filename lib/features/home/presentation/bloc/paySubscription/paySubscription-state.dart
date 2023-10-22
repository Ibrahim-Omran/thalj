
abstract class PaySubscriptionState {}

 class PaySubscriptionInitial extends PaySubscriptionState {}

final class PaySubscriptionLoading extends PaySubscriptionState {


}

 class PaySubscriptionSuccess extends PaySubscriptionState {

}

 class PaySubscriptionUploading extends PaySubscriptionState {}

 class PaySubscriptionUploadFailed extends PaySubscriptionState {}
