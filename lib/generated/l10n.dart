// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WELCOME TO`
  String get WELCOMETO {
    return Intl.message('WELCOME TO', name: 'WELCOMETO', desc: '', args: []);
  }

  /// `Your Tour Guide`
  String get TOURGUIDE {
    return Intl.message(
      'Your Tour Guide',
      name: 'TOURGUIDE',
      desc: '',
      args: [],
    );
  }

  /// `APP`
  String get APP {
    return Intl.message('APP', name: 'APP', desc: '', args: []);
  }

  /// `LOGIN`
  String get LOGIN {
    return Intl.message('LOGIN', name: 'LOGIN', desc: '', args: []);
  }

  /// `SIGNUP`
  String get SIGNUP {
    return Intl.message('SIGNUP', name: 'SIGNUP', desc: '', args: []);
  }

  /// `logged in successfully`
  String get loggedInSuccessfully {
    return Intl.message(
      'logged in successfully',
      name: 'loggedInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get WELCOME {
    return Intl.message('WELCOME', name: 'WELCOME', desc: '', args: []);
  }

  /// `Login now to discover Egypt`
  String get LoginNowToDiscoverEgypt {
    return Intl.message(
      'Login now to discover Egypt',
      name: 'LoginNowToDiscoverEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Enter correct email`
  String get EnterCorrectEmail {
    return Intl.message(
      'Enter correct email',
      name: 'EnterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Enter correct password`
  String get EnterCorrectPassword {
    return Intl.message(
      'Enter correct password',
      name: 'EnterCorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Forget password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get UserName {
    return Intl.message('User name', name: 'UserName', desc: '', args: []);
  }

  /// `Enter correct user name`
  String get EnterCorrectUserName {
    return Intl.message(
      'Enter correct user name',
      name: 'EnterCorrectUserName',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get PasswordMustBeAtLeast8Characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'PasswordMustBeAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password not matched`
  String get passwordNotMatched {
    return Intl.message(
      'Password not matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message('Sign Up', name: 'SignUp', desc: '', args: []);
  }

  /// `Already have account`
  String get AlreadyHaveAccount {
    return Intl.message(
      'Already have account',
      name: 'AlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message('Sign In', name: 'SignIn', desc: '', args: []);
  }

  /// `Choose what to search for`
  String get ChooseWhatToSearchFor {
    return Intl.message(
      'Choose what to search for',
      name: 'ChooseWhatToSearchFor',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get Explore {
    return Intl.message('Explore', name: 'Explore', desc: '', args: []);
  }

  /// `More About Egypt`
  String get moreAboutEgypt {
    return Intl.message(
      'More About Egypt',
      name: 'moreAboutEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Travel Places`
  String get TravelPlaces {
    return Intl.message(
      'Travel Places',
      name: 'TravelPlaces',
      desc: '',
      args: [],
    );
  }

  /// `View All `
  String get ViewAll {
    return Intl.message('View All ', name: 'ViewAll', desc: '', args: []);
  }

  /// `Best \n Places`
  String get bestPlaces {
    return Intl.message(
      'Best \n Places',
      name: 'bestPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Cities`
  String get AllCities {
    return Intl.message('Cities', name: 'AllCities', desc: '', args: []);
  }

  /// `Tours \n And Trips`
  String get ToursAndTrips {
    return Intl.message(
      'Tours \n And Trips',
      name: 'ToursAndTrips',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming \n Events`
  String get UpcomingEvents {
    return Intl.message(
      'Upcoming \n Events',
      name: 'UpcomingEvents',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'StartSearchNow !' key

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `No Results Returned`
  String get NoResultsReturned {
    return Intl.message(
      'No Results Returned',
      name: 'NoResultsReturned',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get SignOut {
    return Intl.message('Sign out', name: 'SignOut', desc: '', args: []);
  }

  /// `How to go`
  String get HowToGo {
    return Intl.message('How to go', name: 'HowToGo', desc: '', args: []);
  }

  /// `Press Back Again To Exit`
  String get pressBackAgain {
    return Intl.message(
      'Press Back Again To Exit',
      name: 'pressBackAgain',
      desc: '',
      args: [],
    );
  }

  /// `bestPlaces`
  String get bestPlacesCollection {
    return Intl.message(
      'bestPlaces',
      name: 'bestPlacesCollection',
      desc: '',
      args: [],
    );
  }

  /// `places`
  String get placesCollection {
    return Intl.message('places', name: 'placesCollection', desc: '', args: []);
  }

  /// `cities`
  String get citiesCollection {
    return Intl.message('cities', name: 'citiesCollection', desc: '', args: []);
  }

  /// `Places`
  String get Places {
    return Intl.message('Places', name: 'Places', desc: '', args: []);
  }

  /// `Places`
  String get AllPlaces {
    return Intl.message('Places', name: 'AllPlaces', desc: '', args: []);
  }

  /// `cityName`
  String get cityName {
    return Intl.message('cityName', name: 'cityName', desc: '', args: []);
  }

  /// `Hotels`
  String get Hotels {
    return Intl.message('Hotels', name: 'Hotels', desc: '', args: []);
  }

  /// `Restaurants`
  String get Restaurants {
    return Intl.message('Restaurants', name: 'Restaurants', desc: '', args: []);
  }

  /// `restaurants`
  String get restaurantsCollection {
    return Intl.message(
      'restaurants',
      name: 'restaurantsCollection',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get AllRestaurants {
    return Intl.message(
      'Restaurants',
      name: 'AllRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `Malls`
  String get Malls {
    return Intl.message('Malls', name: 'Malls', desc: '', args: []);
  }

  /// `malls`
  String get mallsCollection {
    return Intl.message('malls', name: 'mallsCollection', desc: '', args: []);
  }

  /// `Malls`
  String get AllMalls {
    return Intl.message('Malls', name: 'AllMalls', desc: '', args: []);
  }

  /// `Hotels`
  String get AllHotels {
    return Intl.message('Hotels', name: 'AllHotels', desc: '', args: []);
  }

  /// `Cafes`
  String get Cafes {
    return Intl.message('Cafes', name: 'Cafes', desc: '', args: []);
  }

  /// `cafes`
  String get cafesCollection {
    return Intl.message('cafes', name: 'cafesCollection', desc: '', args: []);
  }

  /// `Malls`
  String get AllCafes {
    return Intl.message('Malls', name: 'AllCafes', desc: '', args: []);
  }

  /// `Mosques`
  String get Mosques {
    return Intl.message('Mosques', name: 'Mosques', desc: '', args: []);
  }

  /// `mosques`
  String get mosquesCollection {
    return Intl.message(
      'mosques',
      name: 'mosquesCollection',
      desc: '',
      args: [],
    );
  }

  /// `Mosques`
  String get AllMosques {
    return Intl.message('Mosques', name: 'AllMosques', desc: '', args: []);
  }

  /// `Churches`
  String get Churches {
    return Intl.message('Churches', name: 'Churches', desc: '', args: []);
  }

  /// `churches`
  String get churchesCollection {
    return Intl.message(
      'churches',
      name: 'churchesCollection',
      desc: '',
      args: [],
    );
  }

  /// `Churches`
  String get AllChurches {
    return Intl.message('Churches', name: 'AllChurches', desc: '', args: []);
  }

  /// `Cinemas`
  String get Cinemas {
    return Intl.message('Cinemas', name: 'Cinemas', desc: '', args: []);
  }

  /// `cinemas`
  String get cinemasCollection {
    return Intl.message(
      'cinemas',
      name: 'cinemasCollection',
      desc: '',
      args: [],
    );
  }

  /// `Cinemas`
  String get AllCinemas {
    return Intl.message('Cinemas', name: 'AllCinemas', desc: '', args: []);
  }

  /// `From`
  String get From {
    return Intl.message('From', name: 'From', desc: '', args: []);
  }

  /// `To`
  String get To {
    return Intl.message('To', name: 'To', desc: '', args: []);
  }

  /// `Tickets`
  String get Tickets {
    return Intl.message('Tickets', name: 'Tickets', desc: '', args: []);
  }

  /// `FOREIGNERS`
  String get FOREIGNERS {
    return Intl.message('FOREIGNERS', name: 'FOREIGNERS', desc: '', args: []);
  }

  /// `Adult`
  String get Adult {
    return Intl.message('Adult', name: 'Adult', desc: '', args: []);
  }

  /// `Student`
  String get Student {
    return Intl.message('Student', name: 'Student', desc: '', args: []);
  }

  /// `EGYPTIANS`
  String get EGYPTIANS {
    return Intl.message('EGYPTIANS', name: 'EGYPTIANS', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message('Gallery', name: 'Gallery', desc: '', args: []);
  }

  /// `Nearly in this governorate`
  String get nearly {
    return Intl.message(
      'Nearly in this governorate',
      name: 'nearly',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Metro station :`
  String get metro {
    return Intl.message(
      'Nearest Metro station :',
      name: 'metro',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get Features {
    return Intl.message('Features', name: 'Features', desc: '', args: []);
  }

  /// `Website`
  String get WebSite {
    return Intl.message('Website', name: 'WebSite', desc: '', args: []);
  }

  /// `Contact`
  String get Contact {
    return Intl.message('Contact', name: 'Contact', desc: '', args: []);
  }

  /// `Best Places`
  String get AllBestPlaces {
    return Intl.message(
      'Best Places',
      name: 'AllBestPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Tours`
  String get AllTours {
    return Intl.message('Tours', name: 'AllTours', desc: '', args: []);
  }

  /// `Duration`
  String get Duration {
    return Intl.message('Duration', name: 'Duration', desc: '', args: []);
  }

  /// `Price`
  String get Price {
    return Intl.message('Price', name: 'Price', desc: '', args: []);
  }

  /// `Tour Type`
  String get TourType {
    return Intl.message('Tour Type', name: 'TourType', desc: '', args: []);
  }

  /// `Pick from`
  String get PickFrom {
    return Intl.message('Pick from', name: 'PickFrom', desc: '', args: []);
  }

  /// `Tour Itinerary`
  String get tourItinerary {
    return Intl.message(
      'Tour Itinerary',
      name: 'tourItinerary',
      desc: '',
      args: [],
    );
  }

  /// `Inclusions`
  String get inclusions {
    return Intl.message('Inclusions', name: 'inclusions', desc: '', args: []);
  }

  /// `Exclusions`
  String get exclusions {
    return Intl.message('Exclusions', name: 'exclusions', desc: '', args: []);
  }

  /// `Tour Availability`
  String get tourAvailability {
    return Intl.message(
      'Tour Availability',
      name: 'tourAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Tour Organizer : `
  String get tourOrganizer {
    return Intl.message(
      'Tour Organizer : ',
      name: 'tourOrganizer',
      desc: '',
      args: [],
    );
  }

  /// `Show more `
  String get showMore {
    return Intl.message('Show more ', name: 'showMore', desc: '', args: []);
  }

  /// `  Show less `
  String get showLess {
    return Intl.message('  Show less ', name: 'showLess', desc: '', args: []);
  }

  /// `Tours`
  String get tours {
    return Intl.message('Tours', name: 'tours', desc: '', args: []);
  }

  /// `Day Tour`
  String get dayTour {
    return Intl.message('Day Tour', name: 'dayTour', desc: '', args: []);
  }

  /// `Tour Package`
  String get tourPackage {
    return Intl.message(
      'Tour Package',
      name: 'tourPackage',
      desc: '',
      args: [],
    );
  }

  /// `Egyptians Trip`
  String get egyptiansTrip {
    return Intl.message(
      'Egyptians Trip',
      name: 'egyptiansTrip',
      desc: '',
      args: [],
    );
  }

  /// `Nile Cruise`
  String get nileCruise {
    return Intl.message('Nile Cruise', name: 'nileCruise', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Cities`
  String get cities {
    return Intl.message('Cities', name: 'cities', desc: '', args: []);
  }

  /// `Choose what to search for`
  String get searchFor {
    return Intl.message(
      'Choose what to search for',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Start Search Now !`
  String get startSearch {
    return Intl.message(
      'Start Search Now !',
      name: 'startSearch',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get Favourite {
    return Intl.message('Favourite', name: 'Favourite', desc: '', args: []);
  }

  /// `Added To Favourite`
  String get AddedToFavourite {
    return Intl.message(
      'Added To Favourite',
      name: 'AddedToFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add to favourite`
  String get FailedToAddToFavourite {
    return Intl.message(
      'Failed to add to favourite',
      name: 'FailedToAddToFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Removed From Favourite`
  String get RemovedFromFavourite {
    return Intl.message(
      'Removed From Favourite',
      name: 'RemovedFromFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Events`
  String get UpcomingEventsAppbar {
    return Intl.message(
      'Upcoming Events',
      name: 'UpcomingEventsAppbar',
      desc: '',
      args: [],
    );
  }

  /// `Full Menu`
  String get FullMenu {
    return Intl.message('Full Menu', name: 'FullMenu', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Opening \n Hours`
  String get openingHours {
    return Intl.message(
      'Opening \n Hours',
      name: 'openingHours',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms {
    return Intl.message('Rooms', name: 'rooms', desc: '', args: []);
  }

  /// `Average Price :`
  String get avgPrice {
    return Intl.message(
      'Average Price :',
      name: 'avgPrice',
      desc: '',
      args: [],
    );
  }

  /// `Contains : `
  String get contains {
    return Intl.message('Contains : ', name: 'contains', desc: '', args: []);
  }

  /// `Sort by : `
  String get sortBy {
    return Intl.message('Sort by : ', name: 'sortBy', desc: '', args: []);
  }

  /// `Stars`
  String get stars {
    return Intl.message('Stars', name: 'stars', desc: '', args: []);
  }

  /// `Rate`
  String get rate {
    return Intl.message('Rate', name: 'rate', desc: '', args: []);
  }

  /// `Tours to this place`
  String get toursToPlace {
    return Intl.message(
      'Tours to this place',
      name: 'toursToPlace',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get transport {
    return Intl.message('Transport', name: 'transport', desc: '', args: []);
  }

  /// `Films`
  String get films {
    return Intl.message('Films', name: 'films', desc: '', args: []);
  }

  /// `Movie Genre : `
  String get genre {
    return Intl.message('Movie Genre : ', name: 'genre', desc: '', args: []);
  }

  /// `Length : `
  String get length {
    return Intl.message('Length : ', name: 'length', desc: '', args: []);
  }

  /// `Movie Cast `
  String get cast {
    return Intl.message('Movie Cast ', name: 'cast', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Bed :`
  String get bed {
    return Intl.message('Bed :', name: 'bed', desc: '', args: []);
  }

  /// `Overview`
  String get about {
    return Intl.message('Overview', name: 'about', desc: '', args: []);
  }

  /// `'Your Device is offline. Your Tour Guide App requires internet connection to start'`
  String get noInternet {
    return Intl.message(
      '\'Your Device is offline. Your Tour Guide App requires internet connection to start\'',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
