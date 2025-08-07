class DrinkEntity {
  final String id;
  final String name;
  final String nameArabic;
  final String imageUrl;
  final String type;
  final num price;

  DrinkEntity({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.imageUrl,
    required this.type,
    required this.price,
  });
}

List<DrinkEntity> getDummyDrinks() {
  return [
    DrinkEntity(
        id: 'coffee',
        name: 'Coffee',
        nameArabic: 'بيتزا',
        imageUrl:
            'https://t4.ftcdn.net/jpg/01/16/61/93/360_F_116619399_YA611bKNOW35ffK0OiyuaOcjAgXgKBui.jpg',
        type: 'Coffee',
        price: 120.00),
    DrinkEntity(
      id: 'juice',
      name: 'Orange Juice',
      nameArabic: 'بيض',
      imageUrl:
          'https://media.istockphoto.com/id/158268808/photo/fresh-citrus-juices.jpg?s=612x612&w=0&k=20&c=vflsrO3KXXtWfpOOzNZdBVgeIpLy21-OSUl-QPSgPmU=',
      type: 'Juice',
      price: 15.50,
    ),
    DrinkEntity(
      id: 'softDrink',
      name: 'Cola',
      nameArabic: 'كولا',
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/037/751/381/non_2x/coca-cola-plastic-bottle-isolated-on-transparent-background-free-png.png',
      type: 'Soft drink',
      price: 20.00,
    ),
  ];
}
