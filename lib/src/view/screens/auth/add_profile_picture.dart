import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mytodo/src/control/constants/store/store.dart';
import 'package:mytodo/src/control/routers/props.dart';
import 'package:mytodo/src/control/routers/route_generator.dart';
import 'package:mytodo/src/view/custom_widgets/dropdown_modal.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AddProfilePictureScreen extends StatefulWidget {
  final RouteParams param;
  final GoRouterState state;
  final AppState appState;
  const AddProfilePictureScreen({
    super.key,
    required this.param,
    required this.state,
    required this.appState,
  });

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
    return Scaffold(
        body: SafeArea(
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
                          context.tr("chooseProfileText"),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          softWrap: true,
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
                          context.tr("addProfileText"),
                          style: Theme.of(context).textTheme.labelLarge,
                          softWrap: true,
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
                        context.tr("verifyText"),
                        softWrap: true,
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
    ));
  }
}
