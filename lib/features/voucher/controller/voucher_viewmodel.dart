// lib/features/voucher/controller/voucher_viewmodel.dart
class VoucherViewModel {
  // This is where you'd add logic to fetch or manage vouchers
  // For example, you could have a function to retrieve vouchers from a backend

  List<Map<String, String>> getAvailableVouchers() {
    // This could eventually be replaced by real data from an API or database
    return [
      {'title': '50% OFF on Fashion', 'validity': 'Valid until 31 Dec 2024'},
      {
        'title': '20% Cashback on Electronics',
        'validity': 'Valid until 31 Jan 2025'
      },
      {
        'title': 'Buy 1 Get 1 Free on Groceries',
        'validity': 'Valid until 15 Nov 2024'
      },
      {
        'title': '30% OFF on Home Appliances',
        'validity': 'Valid until 20 Dec 2024'
      },
    ];
  }
}
