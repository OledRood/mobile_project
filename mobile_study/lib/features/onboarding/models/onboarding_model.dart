import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

part 'onboarding_model.freezed.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState.first({
    @Default(AppImages.onboarding1) String image,
    @Default("Аренда автомобилей") String title,
    @Default("Открой для себя удобный и доступный способ передвижения")
    String description,
    @Default(0) int buttonIndex,
    @Default("Далее") String buttonText,
  }) = FirstState;
  const factory OnboardingState.second({
    @Default(AppImages.onboarding2) String image,
    @Default('Безопасно и удобно') String title,
    @Default("Арендуй автомобиль и наслаждайся его удобством")
    String description,
    @Default(1) int buttonIndex,
    @Default("Далее") String buttonText,
  }) = SecondState;

  const factory OnboardingState.third({
    @Default(AppImages.onboarding3) String image,
    @Default('Лучшие предложения') String title,
    @Default("Выбирай понравившееся среди сотен доступных автомобилей")
    String description,
    @Default(2) int buttonIndex,
    @Default("Поехали") String buttonText,
  }) = ThirdState;
}
