import 'package:your_tour_guide/core/services/shared_prefs_services.dart';

class FavouriteLocalDataSource {
  static const _key = 'favourite_ids';

  Future<void> saveFavourite(String id) async {
    final favs = Prefs.getStringList(_key) ?? [];
    if (!favs.contains(id)) {
      favs.add(id);
      await Prefs.setStringList(_key, favs);
    }
  }

  Future<void> removeFavourite(String id) async {
    final favs = Prefs.getStringList(_key) ?? [];
    favs.remove(id);
    await Prefs.setStringList(_key, favs);
  }

  List<String> getFavourites() {
    return Prefs.getStringList(_key) ?? [];
  }

  bool isFavourite(String id) {
    return Prefs.getStringList(_key)?.contains(id) ?? false;
  }
}
