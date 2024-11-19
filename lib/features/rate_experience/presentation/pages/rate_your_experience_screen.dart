import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lieferking_ui_task/features/rate_experience/data/models/user_rating.dart';
import '../widgets/widgets.dart';
import '../cubit/rate_experience_cubit.dart';

class RateExperiencePage extends StatefulWidget {
  @override
  _RateExperiencePageState createState() => _RateExperiencePageState();
}

class _RateExperiencePageState extends State<RateExperiencePage> {
  int deliverySpeed = 0;
  int foodQuality = 0;
  int friendliness = 0;
  String feedback = 'The food was good, but the delivery was a bit slow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Rate Your Experience',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              padding: const EdgeInsets.only(left: 16.0),
              icon: SvgPicture.asset('assets/icons/back_arrow_button.svg'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: BlocBuilder<OrderedFoodCubit, RateExperienceState>(
        builder: (context, state) {
          if (state is RateExperienceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RateExperienceLoaded) {
            final orderedFood = state.orderedFood;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetails(
                      orderedFoodID: orderedFood.orderId,
                      totalPrice: orderedFood.totalPrice,
                      paymentMethod: orderedFood.paymentMethod,
                      foodType: orderedFood.foodType,
                      foods: orderedFood.foods,
                      orderDateAndTime: orderedFood.dateAndTime,
                    ),
                    const SizedBox(height: 32),
                    RatingSection(
                      deliverySpeed: deliverySpeed,
                      foodQuality: foodQuality,
                      friendliness: friendliness,
                      onDeliverySpeedChanged: (value) {
                        setState(() {
                          deliverySpeed = value;
                        });
                      },
                      onFoodQualityChanged: (value) {
                        setState(() {
                          foodQuality = value;
                        });
                      },
                      onFriendlinessChanged: (value) {
                        setState(() {
                          friendliness = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Your comments (optional)',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      maxLines: 3,
                      onChanged: (value) {
                        setState(() {
                          feedback = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    SubmitButton(
                      onPressed: () {
                        final userRating = UserRating(
                          deliverySpeed: deliverySpeed,
                          foodQuality: foodQuality,
                          friendliness: friendliness,
                          feedback: feedback,
                        );
                        context
                            .read<UserRatingCubit>()
                            .sendFeedback(userRating);

                        // Navigate to thank you page or show success message
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is RateExperienceError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Please wait...'));
        },
      ),
    );
  }
}
