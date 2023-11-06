class Donor {
  String name;
  String donationCount;
  String donationMoney;
  String weekRating;
  String totalRating;
  String description;
  String imageUrl;

  Donor({
    required this.name,
    required this.donationCount,
    required this.donationMoney,
    required this.weekRating,
    required this.totalRating,
    required this.description,
    required this.imageUrl,
  });

  String get _name => name;
  String get _donateCount => donationCount;
  String get _donateMoney => donationMoney;
  String get _weekRating => weekRating;
  String get _totalRating => totalRating;
  String get _description => description;
}

Donor donor = Donor(
  name: '大好人',
  donationCount: '8',
  donationMoney: '600',
  weekRating: '20',
  totalRating: '2000',
  description: '好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好',
  imageUrl: 'assets/businesswoman.png',
);
