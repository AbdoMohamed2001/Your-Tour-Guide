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

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `WELCOME`
  String get WELCOME {
    return Intl.message('WELCOME', name: 'WELCOME', desc: '', args: []);
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

  /// `Login now to discover Egypt`
  String get LoginNowToDiscoverEgypt {
    return Intl.message(
      'Login now to discover Egypt',
      name: 'LoginNowToDiscoverEgypt',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get LOGIN {
    return Intl.message('LOGIN', name: 'LOGIN', desc: '', args: []);
  }

  /// `SIGNUP`
  String get SIGNUP {
    return Intl.message('SIGNUP', name: 'SIGNUP', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message('Sign Up', name: 'SignUp', desc: '', args: []);
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message('Sign In', name: 'SignIn', desc: '', args: []);
  }

  /// `Sign out`
  String get SignOut {
    return Intl.message('Sign out', name: 'SignOut', desc: '', args: []);
  }

  /// `Logged in successfully`
  String get loggedInSuccessfully {
    return Intl.message(
      'Logged in successfully',
      name: 'loggedInSuccessfully',
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

  /// `Already have account`
  String get AlreadyHaveAccount {
    return Intl.message(
      'Already have account',
      name: 'AlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
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

  /// `Forget password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'ForgetPassword',
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

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
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

  /// `Confirm new password`
  String get confirmPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password confirmation does not match `
  String get passwordNotMatched {
    return Intl.message(
      'The password confirmation does not match ',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Current password is incorrect`
  String get incorrectCurrentPassword {
    return Intl.message(
      'Current password is incorrect',
      name: 'incorrectCurrentPassword',
      desc: '',
      args: [],
    );
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

  // skipped getter for the 'StartSearchNow !' key

  /// `Start Search Now!`
  String get startSearch {
    return Intl.message(
      'Start Search Now!',
      name: 'startSearch',
      desc: '',
      args: [],
    );
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

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Founded`
  String get founded {
    return Intl.message('Founded', name: 'founded', desc: '', args: []);
  }

  /// `search results about`
  String get searchResultsAbout {
    return Intl.message(
      'search results about',
      name: 'searchResultsAbout',
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

  /// `View All`
  String get ViewAll {
    return Intl.message('View All', name: 'ViewAll', desc: '', args: []);
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

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `How to go`
  String get HowToGo {
    return Intl.message('How to go', name: 'HowToGo', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Places`
  String get Places {
    return Intl.message('Places', name: 'Places', desc: '', args: []);
  }

  /// `Hotels`
  String get Hotels {
    return Intl.message('Hotels', name: 'Hotels', desc: '', args: []);
  }

  /// `Restaurants`
  String get Restaurants {
    return Intl.message('Restaurants', name: 'Restaurants', desc: '', args: []);
  }

  /// `Malls`
  String get Malls {
    return Intl.message('Malls', name: 'Malls', desc: '', args: []);
  }

  /// `Cafes`
  String get Cafes {
    return Intl.message('Cafes', name: 'Cafes', desc: '', args: []);
  }

  /// `Mosques`
  String get Mosques {
    return Intl.message('Mosques', name: 'Mosques', desc: '', args: []);
  }

  /// `Churches`
  String get Churches {
    return Intl.message('Churches', name: 'Churches', desc: '', args: []);
  }

  /// `Cinemas`
  String get Cinemas {
    return Intl.message('Cinemas', name: 'Cinemas', desc: '', args: []);
  }

  /// `Cities`
  String get cities {
    return Intl.message('Cities', name: 'cities', desc: '', args: []);
  }

  /// `Tours`
  String get tours {
    return Intl.message('Tours', name: 'tours', desc: '', args: []);
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

  /// `Best Places`
  String get AllBestPlaces {
    return Intl.message(
      'Best Places',
      name: 'AllBestPlaces',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message('From', name: 'From', desc: '', args: []);
  }

  /// `To`
  String get To {
    return Intl.message('To', name: 'To', desc: '', args: []);
  }

  /// `Show more`
  String get showMore {
    return Intl.message('Show more', name: 'showMore', desc: '', args: []);
  }

  /// `Show less`
  String get showLess {
    return Intl.message('Show less', name: 'showLess', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `FOREIGNERS`
  String get FOREIGNERS {
    return Intl.message('FOREIGNERS', name: 'FOREIGNERS', desc: '', args: []);
  }

  /// `EGYPTIANS`
  String get EGYPTIANS {
    return Intl.message('EGYPTIANS', name: 'EGYPTIANS', desc: '', args: []);
  }

  /// `Adult`
  String get Adult {
    return Intl.message('Adult', name: 'Adult', desc: '', args: []);
  }

  /// `Student`
  String get Student {
    return Intl.message('Student', name: 'Student', desc: '', args: []);
  }

  /// `Tickets`
  String get Tickets {
    return Intl.message('Tickets', name: 'Tickets', desc: '', args: []);
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

  /// `Nearest Metro station`
  String get metro {
    return Intl.message(
      'Nearest Metro station',
      name: 'metro',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get transport {
    return Intl.message('Transport', name: 'transport', desc: '', args: []);
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

  /// `Duration`
  String get Duration {
    return Intl.message('Duration', name: 'Duration', desc: '', args: []);
  }

  /// `Price`
  String get Price {
    return Intl.message('Price', name: 'Price', desc: '', args: []);
  }

  /// `Pick from`
  String get PickFrom {
    return Intl.message('Pick from', name: 'PickFrom', desc: '', args: []);
  }

  /// `Tour Type`
  String get TourType {
    return Intl.message('Tour Type', name: 'TourType', desc: '', args: []);
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

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `End Date`
  String get endDate {
    return Intl.message('End Date', name: 'endDate', desc: '', args: []);
  }

  /// `More information`
  String get moreInformation {
    return Intl.message(
      'More information',
      name: 'moreInformation',
      desc: '',
      args: [],
    );
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

  /// `Tour Organizer`
  String get tourOrganizer {
    return Intl.message(
      'Tour Organizer',
      name: 'tourOrganizer',
      desc: '',
      args: [],
    );
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

  /// `Tour Location`
  String get tourLocation {
    return Intl.message(
      'Tour Location',
      name: 'tourLocation',
      desc: '',
      args: [],
    );
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

  /// `Removed From Favourite`
  String get RemovedFromFavourite {
    return Intl.message(
      'Removed From Favourite',
      name: 'RemovedFromFavourite',
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

  /// `There is no favourites yet`
  String get noFavouritesYet {
    return Intl.message(
      'There is no favourites yet',
      name: 'noFavouritesYet',
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

  /// `Average Price`
  String get avgPrice {
    return Intl.message('Average Price', name: 'avgPrice', desc: '', args: []);
  }

  /// `Contains`
  String get contains {
    return Intl.message('Contains', name: 'contains', desc: '', args: []);
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Stars`
  String get stars {
    return Intl.message('Stars', name: 'stars', desc: '', args: []);
  }

  /// `Rate`
  String get rate {
    return Intl.message('Rate', name: 'rate', desc: '', args: []);
  }

  /// `Bed`
  String get bed {
    return Intl.message('Bed', name: 'bed', desc: '', args: []);
  }

  /// `Films`
  String get films {
    return Intl.message('Films', name: 'films', desc: '', args: []);
  }

  /// `Movie Genre`
  String get genre {
    return Intl.message('Movie Genre', name: 'genre', desc: '', args: []);
  }

  /// `Length`
  String get length {
    return Intl.message('Length', name: 'length', desc: '', args: []);
  }

  /// `Movie Cast`
  String get cast {
    return Intl.message('Movie Cast', name: 'cast', desc: '', args: []);
  }

  /// `Overview`
  String get about {
    return Intl.message('Overview', name: 'about', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Mode`
  String get mode {
    return Intl.message('Mode', name: 'mode', desc: '', args: []);
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

  /// `Profile information`
  String get personalProfile {
    return Intl.message(
      'Profile information',
      name: 'personalProfile',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personalInfo {
    return Intl.message(
      'Personal information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Something went wrong`
  String get someThingWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWrong',
      desc: '',
      args: [],
    );
  }

  /// `No data has been modified`
  String get noDataEdited {
    return Intl.message(
      'No data has been modified',
      name: 'noDataEdited',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get changesSaved {
    return Intl.message(
      'Changes saved successfully',
      name: 'changesSaved',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Your Device is offline. Your Tour Guide App requires internet connection to start`
  String get noInternet {
    return Intl.message(
      'Your Device is offline. Your Tour Guide App requires internet connection to start',
      name: 'noInternet',
      desc: '',
      args: [],
    );
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
