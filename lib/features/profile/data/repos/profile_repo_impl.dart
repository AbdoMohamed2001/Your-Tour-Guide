//  @override
//   Future<void> updateUserName(
//       {required String userId, required String name}) async {
//     //1 Update Firebase Authentication
//     try {
//       await firebaseAuthService.updateUserName(
//           userId: userId, displayName: name);
//       //2 Update Firestore "users" Collection
//       await databaseServices.updateData(
//         path: 'users',
//         recordId: userId,
//         fieldName: 'name',
//         fieldData: name,
//       );
//       // 3. Update Cached User Data
//       await updateCachedData(
//           key: kUserData, fieldName: 'name', fieldValue: name);
//     } catch (e) {
//       log('error in update user name auth repo $e');
//       return left(ServerFailure(message: 'error while trying to update data'));
//     }
//     return right(null);
//   }
//TODO: Implement ProfileRepo
//  @override
//   Future<Either<Failure, void>> updateEmail(
//       {required String userId, required String email}) async {
//     //1 Update Firebase Authentication
//     try {
//       await firebaseAuthService.updateUserEmail(userId: userId, email: email);
//       //2 Update Firestore "users" Collection
//       await databaseServices.updateData(
//         path: 'users',
//         recordId: userId,
//         fieldName: 'email',
//         fieldData: email,
//       );
//       // 3. Update Cached User Data
//       // await updateCachedData(
//       //     key: kUserData, fieldName: 'email', fieldValue: email);
//     } catch (e) {
//       log('error in update user name auth repo $e');
//       return left(ServerFailure(message: 'error while trying to update data'));
//     }
//     return right(null);
//   }

//TODO

//  Future<Either<Failure, void>> updateUserName({
//     required String userId,
//     required String name,
//   });
//   Future<Either<Failure, void>> updateEmail(
//       {required String userId, required String email});
