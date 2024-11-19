import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import '../../data/data.dart';

part 'rate_experience_state.dart';

class OrderedFoodCubit extends Cubit<RateExperienceState> {
  OrderedFoodCubit() : super(RateExperienceInitial());

  Future<void> loadOrderedFood() async {
    try {
      emit(RateExperienceLoading());
      final String response =
          await rootBundle.loadString('lib/api/ordered_food.json');
      final data = json.decode(response);
      final orderedFood = OrderedFood.fromJson(data);
      emit(RateExperienceLoaded(orderedFood));
    } catch (e) {
      emit(RateExperienceError('Failed to load ordered food: $e'));
    }
  }
}

class UserRatingCubit extends Cubit<UserRatingState> {
  UserRatingCubit() : super(UserRatingInitial());

  Future<void> loadUserRating() async {
    try {
      emit(UserRatingLoading());
      final String response =
          await rootBundle.loadString('lib/api/user_rating.json');
      final data = json.decode(response);
      final userRating = UserRating.fromJson(data);
      emit(UserRatingLoaded(userRating));
    } catch (e) {
      emit(UserRatingError('Failed to load user rating: $e'));
    }
  }

  Future<void> sendFeedback(UserRating userRating) async {
    try {
      emit(UserRatingLoading());
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/user_rating.json');
      final data = userRating.toJson();
      await file.writeAsString(json.encode(data));
      emit(UserRatingLoaded(userRating));
    } catch (e) {
      emit(UserRatingError('Failed to send feedback: $e'));
    }
  }

  // getApplicationDocumentsDirectory() {}
}
