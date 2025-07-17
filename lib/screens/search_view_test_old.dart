import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';

import '../../../../core/services/firebase_search.dart';
import '../../../../generated/l10n.dart';

class SearchTest extends StatefulWidget {
  @override
  _SearchTestState createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  final FirebaseSearchService _searchService = FirebaseSearchService();
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_searchController.text != _searchQuery) {
      _searchQuery = _searchController.text;
      _performSearch();
    }
  }

  Future<void> _performSearch() async {
    if (_searchQuery.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Basic search across all collections
      List<Map<String, dynamic>> results =
          await _searchService.searchAcrossAllCollections(
        query: _searchQuery,
      );

      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      print('Search error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Places & Hotels',
      ),
      body: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(kHorizontalPadding),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: S.of(context).search,
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchResults = [];
                          });
                        },
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
          // Loading indicator
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          // Search Results
          Expanded(
            child: _searchResults.isEmpty && !_isLoading
                ? Center(
                    child: Text(
                      _searchQuery.isEmpty
                          ? 'Start typing to search...'
                          : 'No results found',
                      style: TextStyles.bold16,
                    ),
                  )
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final result = _searchResults[index];
                      return _buildSearchResultItem(result);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResultItem(Map<String, dynamic> result) {
    String name = result['name'] ?? '';
    String nameArabic = result['nameArabic'] ?? '';
    String collection = result['_collection'] ?? '';
    String matchedField = result['_matchedField'] ?? '';

    // Get appropriate icon based on collection
    IconData icon = _getIconForCollection(collection);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: _getColorForCollection(collection)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (name.isNotEmpty)
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: matchedField == 'name' ? Colors.blue : Colors.black,
                ),
              ),
            if (nameArabic.isNotEmpty)
              Text(
                nameArabic,
                style: TextStyle(
                  color: matchedField == 'name_arabic'
                      ? Colors.blue
                      : Colors.grey[600],
                  fontSize: 14,
                ),
              ),
          ],
        ),
        subtitle: Text(
          _getCollectionDisplayName(collection),
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle item selection
          _handleItemTap(result);
        },
      ),
    );
  }

  IconData _getIconForCollection(String collection) {
    switch (collection) {
      case 'places':
        return Icons.place;
      case 'hotels':
        return Icons.hotel;
      case 'restaurants':
      case 'rests':
        return Icons.restaurant;
      default:
        return Icons.location_on;
    }
  }

  Color _getColorForCollection(String collection) {
    switch (collection) {
      case 'places':
        return Colors.green;
      case 'hotels':
        return Colors.blue;
      case 'restaurants':
      case 'rests':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getCollectionDisplayName(String collection) {
    switch (collection) {
      case 'places':
        return 'Place';
      case 'hotels':
        return 'Hotel';
      case 'restaurants':
      case 'rests':
        return 'Restaurant';
      default:
        return collection.toUpperCase();
    }
  }

  void _handleItemTap(Map<String, dynamic> result) {
    // Navigate to detail page or perform action
    print('Selected: ${result['name']} from ${result['_collection']}');

    // Example navigation:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(
    //       collection: result['_collection'],
    //       docId: result['_docId'],
    //       data: result,
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
