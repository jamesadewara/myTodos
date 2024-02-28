import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mytodo/control/route_generator.dart';
import 'package:mytodo/view/components/dropdown_modal.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                          'CHOOSE A PROFILE',
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
                          'Click to Add Profile Picture',
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
                      Navigator.of(context)
                          .pushNamed(AuthRoutes.updateProfileAccount);
                      if (_uploadProfileKey.currentState!.validate()) {
                        // Perform any necessary actions upon successful validation
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text('Verify'),
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
