class DeliveredOfferState {
  final String name;
  final String phone;
  final String price;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  DeliveredOfferState({
    this.name = '',
    this.phone = '',
    this.price = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  DeliveredOfferState copyWith({
    String? name,
    String? price,
    String? phone,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return DeliveredOfferState(
      name: name ?? this.name,
      price: price ?? this.price,
      phone: phone ?? this.phone,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}