import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_tour_guide/core/utils/backend_endpoints.dart';

class FirebaseSearchService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Define your collections

  Future<List<Map<String, dynamic>>> searchAcrossAllCollections({
    required String query,
  }) async {
    if (query.trim().isEmpty) return [];

    List<Future<List<Map<String, dynamic>>>> searchFutures = [];

    // Search each collection for both name and name_arabic
    for (String collection in BackEndEndPoints.searchableCollections) {
      searchFutures.add(_searchInCollection(
        query: query.trim(),
        collection: collection,
      ));
    }

    // Execute all searches in parallel
    List<List<Map<String, dynamic>>> results = await Future.wait(searchFutures);

    // Flatten and combine all results
    List<Map<String, dynamic>> allResults = [];
    for (var result in results) {
      allResults.addAll(result);
    }

    // Remove duplicates if any (optional)
    allResults = _removeDuplicates(allResults);

    // Sort results by relevance (optional)
    allResults = _sortByRelevance(allResults, query);

    return allResults;
  }

//-----------------------------------------------------------------
  Future<List<Map<String, dynamic>>> _searchInCollection({
    required String query,
    required String collection,
  }) async {
    try {
      List<Map<String, dynamic>> results = [];

      // Search by name field
      final nameResults = await _searchByField(
        query: query,
        collection: collection,
        field: 'name',
      );
      results.addAll(nameResults);

      // Search by nameArabic field
      final nameArabicResults = await _searchByField(
        query: query,
        collection: collection,
        field: 'nameArabic',
      );
      results.addAll(nameArabicResults);

      return results;
    } catch (e) {
      print('Error searching in collection $collection: $e');
      return [];
    }
  }
//-----------------------------------------------------------------

  Future<List<Map<String, dynamic>>> _searchByField({
    required String query,
    required String collection,
    required String field,
  }) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection(collection)
          .where(field, isGreaterThanOrEqualTo: query)
          .where(field, isLessThanOrEqualTo: '$query\uf8ff')
          .limit(20) // Limit results per field to prevent too many results
          .get();

      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['_collection'] = collection;
        data['_docId'] = doc.id;
        data['_matchedField'] = field;
        data['_matchedValue'] = data[field];
        return data;
      }).toList();
    } catch (e) {
      print('Error searching field $field in collection $collection: $e');
      return [];
    }
  }
//-----------------------------------------------------------------

  // Remove duplicate results (same document from different field searches)
  List<Map<String, dynamic>> _removeDuplicates(
      List<Map<String, dynamic>> results) {
    Map<String, Map<String, dynamic>> uniqueResults = {};

    for (var result in results) {
      String key = '${result['_collection']}_${result['_docId']}';
      if (!uniqueResults.containsKey(key)) {
        uniqueResults[key] = result;
      }
    }

    return uniqueResults.values.toList();
  }
//-----------------------------------------------------------------

  // Sort results by relevance (exact matches first, then partial matches)
  List<Map<String, dynamic>> _sortByRelevance(
      List<Map<String, dynamic>> results, String query) {
    results.sort((a, b) {
      String aName = (a['name'] ?? '').toString().toLowerCase();
      String aNameArabic = (a['nameArabic'] ?? '').toString().toLowerCase();
      String bName = (b['name'] ?? '').toString().toLowerCase();
      String bNameArabic = (b['nameArabic'] ?? '').toString().toLowerCase();
      String lowerQuery = query.toLowerCase();

      // Exact matches first
      bool aExactMatch = aName == lowerQuery || aNameArabic == lowerQuery;
      bool bExactMatch = bName == lowerQuery || bNameArabic == lowerQuery;

      if (aExactMatch && !bExactMatch) return -1;
      if (!aExactMatch && bExactMatch) return 1;

      // Starts with matches second
      bool aStartsWith =
          aName.startsWith(lowerQuery) || aNameArabic.startsWith(lowerQuery);
      bool bStartsWith =
          bName.startsWith(lowerQuery) || bNameArabic.startsWith(lowerQuery);

      if (aStartsWith && !bStartsWith) return -1;
      if (!aStartsWith && bStartsWith) return 1;

      // Alphabetical order for the rest
      return aName.compareTo(bName);
    });

    return results;
  }

  // Advanced search with filters
  Future<List<Map<String, dynamic>>> searchWithFilters({
    required String query,
    List<String>? specificCollections,
    int? limit,
    bool sortByRelevance = true,
  }) async {
    if (query.trim().isEmpty) return [];

    List<String> collectionsToSearch =
        specificCollections ?? BackEndEndPoints.searchableCollections;
    List<Future<List<Map<String, dynamic>>>> searchFutures = [];

    for (String collection in collectionsToSearch) {
      searchFutures.add(_searchInCollectionWithLimit(
        query: query.trim(),
        collection: collection,
        limit: limit,
      ));
    }

    List<List<Map<String, dynamic>>> results = await Future.wait(searchFutures);

    List<Map<String, dynamic>> allResults = [];
    for (var result in results) {
      allResults.addAll(result);
    }

    allResults = _removeDuplicates(allResults);

    if (sortByRelevance) {
      allResults = _sortByRelevance(allResults, query);
    }

    if (limit != null && allResults.length > limit) {
      allResults = allResults.take(limit).toList();
    }

    return allResults;
  }
//-----------------------------------------------------------------

  Future<List<Map<String, dynamic>>> _searchInCollectionWithLimit({
    required String query,
    required String collection,
    int? limit,
  }) async {
    try {
      List<Map<String, dynamic>> results = [];
      int fieldLimit = limit != null ? (limit / 2).ceil() : 10;

      // Search by name field
      final nameResults = await _searchByFieldWithLimit(
        query: query,
        collection: collection,
        field: 'name',
        limit: fieldLimit,
      );
      results.addAll(nameResults);

      // Search by name_arabic field
      final nameArabicResults = await _searchByFieldWithLimit(
        query: query,
        collection: collection,
        field: 'name_arabic',
        limit: fieldLimit,
      );
      results.addAll(nameArabicResults);

      return results;
    } catch (e) {
      print('Error searching in collection $collection: $e');
      return [];
    }
  }
//-----------------------------------------------------------------

  Future<List<Map<String, dynamic>>> _searchByFieldWithLimit({
    required String query,
    required String collection,
    required String field,
    required int limit,
  }) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection(collection)
          .where(field, isGreaterThanOrEqualTo: query)
          .where(field, isLessThanOrEqualTo: '$query\uf8ff')
          .limit(limit)
          .get();

      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['_collection'] = collection;
        data['_docId'] = doc.id;
        data['_matchedField'] = field;
        data['_matchedValue'] = data[field];
        return data;
      }).toList();
    } catch (e) {
      print('Error searching field $field in collection $collection: $e');
      return [];
    }
  }
//-----------------------------------------------------------------

  // Get search suggestions (for autocomplete)
  Future<List<String>> getSearchSuggestions({
    required String query,
    int limit = 10,
  }) async {
    if (query.trim().isEmpty) return [];

    List<Map<String, dynamic>> results = await searchWithFilters(
      query: query,
      limit: limit * 2, // Get more results to have better suggestions
    );

    Set<String> suggestions = {};

    for (var result in results) {
      String name = result['name'] ?? '';
      String nameArabic = result['name_arabic'] ?? '';

      if (name.toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(name);
      }
      if (nameArabic.toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(nameArabic);
      }
    }

    return suggestions.take(limit).toList();
  }
}
