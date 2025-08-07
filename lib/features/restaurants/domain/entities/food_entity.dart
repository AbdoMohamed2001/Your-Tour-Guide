class FoodEntity {
  final String id;
  final String name;
  final String nameArabic;
  final String imageUrl;
  final String type;
  final num price;

  FoodEntity({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.imageUrl,
    required this.type,
    required this.price,
  });
}

List<FoodEntity> getDummyFoods() {
  return [
    //------------------------------------------
    //SOUP
    FoodEntity(
      id: 'soup',
      name: 'Knuckles Soup',
      nameArabic: 'شوربة كوارع',
      imageUrl:
          'https://s3.eu-central-1.amazonaws.com/qatar-delicious/ItemsImages/ItemImage_12360_(2).jpg',
      type: 'Soup',
      price: 150.00,
    ),
    FoodEntity(
      id: 'soup',
      name: 'Sauteed Vegetables Soup',
      nameArabic: 'شوربة خضار سوتيه',
      imageUrl:
          'https://www.howtocook.recipes/wp-content/uploads/2021/11/Vegetable-soup-recipe.jpg',
      type: 'Soup',
      price: 50.00,
    ),
    FoodEntity(
      id: 'soup',
      name: 'Chicken with Cream Soup',
      nameArabic: 'شوربة دجاج بالكريمة',
      imageUrl:
          'https://www.licious.in/blog/wp-content/uploads/2020/12/Cream-of-chicken-Soup.jpg',
      type: 'Soup',
      price: 100.00,
    ),
    //------------------------------------------
    //Poultry Grills
    FoodEntity(
      id: 'poultryGrills',
      name: 'Grilled Chicken',
      nameArabic: 'فرخة مشوية',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/15891ac3-4878-443a-949e-1303f607c54a.jpg',
      type: 'Poultry Grills',
      price: 300.00,
    ),
    FoodEntity(
      id: 'poultryGrills',
      name: 'Stuffed Chicken',
      nameArabic: 'فرخة محشية',
      imageUrl:
          'https://thebigmansworld.com/wp-content/uploads/2022/10/stuffed-chicken-breast-recipe.jpg',
      type: 'Poultry Grills',
      price: 315.00,
    ),
    FoodEntity(
      id: 'poultryGrills',
      name: 'Pigeons Stuffed With Rice',
      nameArabic: 'حمام محشى ارز',
      imageUrl:
          'https://www.yumlista.com/storage/recipes/NGCaDVpKac11z7PCMf9dTMeg8TQhQo96M9Nj9b3m.jpg',
      type: 'Poultry Grills',
      price: 315.00,
    ),
    FoodEntity(
      id: 'poultryGrills',
      name: 'Grilled pigeons',
      nameArabic: 'حمام مشوى',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/9e7e13bd-0447-49fc-88bd-44cb7ce40f64.jpg',
      type: 'Poultry Grills',
      price: 140.00,
    ),
    //------------------------------------------
    //Grills
    FoodEntity(
      id: 'grills',
      name: 'Lamb Kebab',
      nameArabic: 'كباب ضانى',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/1530193d-dcdb-4f97-91fd-fe1868222a0c.jpg',
      type: 'Grills',
      price: 1450.00,
    ),
    FoodEntity(
      id: 'grills',
      name: 'Lamb Chops',
      nameArabic: 'ريش ضانى',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/2f97c95e-2182-4119-bf75-892973d4df46.jpg',
      type: 'Grills',
      price: 1450.00,
    ),
    FoodEntity(
      id: 'grills',
      name: 'Tarb',
      nameArabic: 'طرب',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/f8b7cdbf-64df-4515-86ab-295371bd559c.jpg',
      type: 'Grills',
      price: 1200.00,
    ),
    FoodEntity(
      id: 'grills',
      name: 'Kofta',
      nameArabic: 'كفتة',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/0b1ad7b9-ecb7-4078-8f0f-aa48d150d740.jpg',
      type: 'Grills',
      price: 1000.00,
    ),
    //------------------------------------------
    //Mahashi
    FoodEntity(
      id: 'mahashi',
      name: 'Mombar',
      nameArabic: 'ممبار',
      imageUrl:
          'https://images.sbs.com.au/dims4/default/2abb319/2147483647/strip/true/crop/1600x900+0+150/resize/1280x720!/quality/90/?url=http%3A%2F%2Fsbs-au-brightspot.s3.amazonaws.com%2Fdrupal%2Ffood%2Fpublic%2Fmombar_33.jpg',
      type: 'Mahashi',
      price: 200.00,
    ),
    FoodEntity(
      id: 'mahashi',
      name: 'Eggplant',
      nameArabic: 'باذنجان',
      imageUrl:
          'https://kitchen.sayidaty.net/uploads/small/b3/b370dcb6a455f9e136588beaec699d2d_w750_h750.jpg',
      type: 'Mahashi',
      price: 200.00,
    ),
    FoodEntity(
      id: 'mahashi',
      name: 'Mombar',
      nameArabic: 'ممبار',
      imageUrl:
          'https://images.sbs.com.au/dims4/default/2abb319/2147483647/strip/true/crop/1600x900+0+150/resize/1280x720!/quality/90/?url=http%3A%2F%2Fsbs-au-brightspot.s3.amazonaws.com%2Fdrupal%2Ffood%2Fpublic%2Fmombar_33.jpg',
      type: 'Mahashi',
      price: 200.00,
    ),
    //------------------------------------------
    //Main Dishes
    FoodEntity(
      id: 'mainDishes',
      name: "Today's Dish",
      nameArabic: 'طبق اليوم',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/130cbb3a-9331-4b0c-b139-2db13e078ae1.jpg',
      type: 'Main Dishes',
      price: 650.00,
    ),
    FoodEntity(
      id: 'mainDishes',
      name: "Lamb Mouza Plate",
      nameArabic: 'طبق موزة ضاني',
      imageUrl:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/cd71cc4b-e6be-4cca-b16e-12595f8a794a.jpg',
      type: 'Main Dishes',
      price: 650.00,
    ),
    FoodEntity(
      id: 'mainDishes',
      name: "Veal Mouza Plate",
      nameArabic: 'طبق موزة بتلو',
      imageUrl:
          'https://www.eldahan.com/foods/%D9%85%D9%88%D8%B2%D8%A9_%D9%81%D8%B1%D9%86_%D8%B6%D8%A7%D9%86%D9%8A_%D8%A8%D8%A7%D9%84%D8%B4%D8%B9%D8%B1%D9%8A%D8%A9_%D8%A8%D8%A7%D9%84%D9%83%D8%A7%D8%AC%D9%88.jpg',
      type: 'Main Dishes',
      price: 650.00,
    ),
  ];
}
