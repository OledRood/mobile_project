import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_colors.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

final _maskFormatter = MaskTextInputFormatter(mask: '##/##/####');

class SignUpThirdScreen extends ConsumerWidget {
  const SignUpThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.signUpViewModelStep3.notifier);
    final state = ref.watch(AuthDi.signUpViewModelStep3);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: GestureDetector(
            onTap: () {
              viewModel.goBack();
            },
            child: SvgPicture.asset(
              AppImages.leftChevron,
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: Text(
          "Создать аккаунт",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: _AddPhotoWidget(
                          child: _AddAccountPhotoIcons(onTap: () {}),
                          imagePicked: viewModel.addAccountPhoto,
                        ),
                      ),

                      SizedBox(height: 32),
                      Text(
                        'Добавление фотографии поможет владельцам и арендаторам узнать друг друга, когда они будут забирать машину',
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: "Номер водительского удостоверения",
                        hint: "0000000000",
                        controller: viewModel.driverLicenseController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) => viewModel.onDriverLicenseSubmit(),
                        isLoading: state.isLoading,
                        onChanged: (_) => viewModel.resetDriverLicense(),
                        errorText: state.driverLicenseError,
                        focusNode: viewModel.driverLicenseFocusNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: 'Дата выдачи',
                        hint: "DD/MM/YYYY",
                        // prefIcon: Icons.calendar_month_outlined,
                        prefIcon: AppImages.calendar,
                        controller: viewModel.dateOfIssueController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) => viewModel.onDateOfIssueSubmit(),
                        onChanged: (_) => viewModel.resetDateOfIssue(),
                        isLoading: state.isLoading,
                        errorText: state.dateOfIssueError,
                        focusNode: viewModel.dateOfIssueFocusNode,
                        inputFormatters: [_maskFormatter],
                      ),
                      SizedBox(height: 16),

                      Text("Загрузите фото водительского удостоверения"),
                      SizedBox(height: 4),
                      _AddPhotoRow(
                        imagePicked: viewModel.addDriverLicensePhoto,
                        isPicked: state.driverLicenseFile != null,
                        isError: state.driverLicenseFileeEror != null,
                      ),
                      SizedBox(height: 16),
                      Text('Загрузите фото паспорта'),
                      SizedBox(height: 4),
                      _AddPhotoRow(
                        imagePicked: viewModel.addPassportPhoto,
                        isPicked: state.passportFile != null,
                        isError: state.passportFileError != null,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 342,
                            child: FilledButton(
                              onPressed: () {
                                viewModel.goFromStep3();
                              },
                              child: const Text("Далее"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddPhotoRow extends StatelessWidget {
  final void Function(File) imagePicked;
  final bool isPicked;
  final bool isError;

  const _AddPhotoRow({
    required this.imagePicked,
    super.key,
    required this.isPicked,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _AddPhotoWidget(
          imagePicked: imagePicked,

          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isError
                      ? AppColors.textFieldError
                      : Theme.of(context).primaryColor,
                ),
              ),
              child: isPicked
                  ? SvgPicture.asset(
                      AppImages.doneAll,
                      width: 18,
                      height: 18,
                      color: Theme.of(context).primaryColor,
                    )
                  : SvgPicture.asset(
                      AppImages.upload,
                      width: 18,
                      height: 18,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Text("Загрузить фото"),
      ],
    );
  }
}

class _AddPhotoWidget extends ConsumerStatefulWidget {
  final Widget child;
  final void Function(File) imagePicked;

  const _AddPhotoWidget({
    required this.child,
    required this.imagePicked,
    super.key,
  });

  @override
  ConsumerState<_AddPhotoWidget> createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends ConsumerState<_AddPhotoWidget> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      widget.imagePicked(File(pickedFile.path));
      setState(() {
        _image = File(pickedFile.path);
      });

      // context.read<AddFlowerBloc>().add(PhotoAdding(_image!));
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: SvgPicture.asset(
                  AppImages.gallery,
                  width: 24,
                  height: 24,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text('Галерея'),
                onTap: () {
                  _pickImage(ImageSource.gallery, context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  AppImages.camera,
                  width: 24,
                  height: 24,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text('Камера'),
                onTap: () {
                  _pickImage(ImageSource.camera, context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        _showPicker(context);
      },
      child: widget.child,
    );
  }
}

class _AddAccountPhotoIcons extends ConsumerWidget {
  final VoidCallback onTap;

  const _AddAccountPhotoIcons({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AuthDi.signUpViewModelStep3);
    return Stack(
      children: [
        state.accountPhotoFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 128,
                  width: 128,
                  child: Image.file(state.accountPhotoFile!, fit: BoxFit.cover),
                ),
              )
            : SvgPicture.asset(AppImages.accountAdd, width: 128, height: 128),
        Positioned(
          bottom: 7,
          right: 7,
          child: SvgPicture.asset(
            AppImages.addCircle,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
