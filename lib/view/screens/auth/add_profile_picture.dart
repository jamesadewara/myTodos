import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/view/custom_widgets/dropdown_modal.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddProfilePictureScreen extends StatefulWidget {
  const AddProfilePictureScreen({super.key});

  @override
  State<AddProfilePictureScreen> createState() =>
      _AddProfilePictureScreenState();
}

class _AddProfilePictureScreenState extends State<AddProfilePictureScreen> {
  final GlobalKey<FormState> _uploadProfileKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  String uploadingImage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 48,
                        )),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? 12
                        : 240,
                  ),
                  child: Form(
                    key: _uploadProfileKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          AppLocalizations.of(context)!.chooseProfileText,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 32),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ImageUploadDialog(
                                    onImageSelected: (XFile? image) {
                                      // Handle the selected image here
                                      if (image != null) {
                                        setState(() {
                                          uploadingImage = image.path;
                                        });
                                        // Do something with the selected image
                                        print(
                                            'Selected image path: ${image.path}');
                                      }
                                    },
                                  );
                                });
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: uploadingImage.isNotEmpty
                                ? ClipOval(
                                    child: Image.file(
                                      File(uploadingImage),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          AppLocalizations.of(context)!.addProfileText,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                Center(
                  child: FilledButton(
                    onPressed: () async {
                      if (_uploadProfileKey.currentState!.validate()) {
                        GoRouter.of(context)
                            .pushNamed(AuthRoutes.updateProfileAccount);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        AppLocalizations.of(context)!.verifyText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
