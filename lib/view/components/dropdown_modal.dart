import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:mytodo/control/validators.dart';
import 'package:mytodo/view/components/file_field.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:image_picker/image_picker.dart';

class DropdownModalController {
  final Key? key;
  final String? image;
  final String title;
  final String? subtitle;

  const DropdownModalController(
      {this.key, this.image, required this.title, required this.subtitle});
}

class DropdownModal extends StatefulWidget {
  final List<DropdownModalController> options;
  final VoidCallback onSelected;

  final bool isSearchable;
  final String? hintText;
  final TextEditingController? controller;

  const DropdownModal(
      {super.key,
      required this.options,
      this.isSearchable = true,
      this.controller,
      this.hintText,
      required this.onSelected});

  @override
  State<DropdownModal> createState() => _DropdownModalState();
}

class _DropdownModalState extends State<DropdownModal> {
  int initialIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        child: Container(
          width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
              ? null
              : 360,
          height: 360,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(children: [
            Center(
              child: SearchBar(
                  controller: widget.controller,
                  elevation: MaterialStateProperty.all(0),
                  hintText: widget.hintText,
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  leading: const Icon(Icons.search),
                  onChanged: (String value) {},
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Divider(),
            ),
            Expanded(
                child: FlutterListView.separated(
              itemCount: widget.options.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    onTap: () {
                      setState(() {
                        initialIndex = index;
                      });
                      Navigator.of(context).pop(true);
                    },
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.network(
                          widget.options.elementAt(index).image ?? ""),
                    ),
                    title: Text(widget.options.elementAt(index).title),
                    subtitle:
                        Text(widget.options.elementAt(index).subtitle ?? ""),
                    key: widget.options.elementAt(index).key);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CreateGroupDropdownModal();
                          });
                    },
                    child: const Text("Add custom group"))
              ],
            ),
            const SizedBox(
              height: 8,
            )
          ]),
        ));
  }
}

class ImageUploadDialog extends StatefulWidget {
  final Function(XFile?) onImageSelected;

  const ImageUploadDialog({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  State<ImageUploadDialog> createState() => _ImageUploadDialogState();
}

class _ImageUploadDialogState extends State<ImageUploadDialog> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  // Function to select image from camera or gallery
  Future getImage(ImageSource source) async {
    var img = await picker.pickImage(source: source);

    setState(() {
      image = img;
    });

    // Call the callback function with the selected image
    widget.onImageSelected(img);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text('Please choose media to select'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            tileColor: Theme.of(context).colorScheme.surface,
            onTap: () {
              Navigator.pop(context);
              getImage(ImageSource.gallery);
            },
            leading: const Icon(Icons.image),
            title: const Text('From Gallery'),
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            tileColor: Theme.of(context).colorScheme.surface,
            onTap: () {
              Navigator.pop(context);
              getImage(ImageSource.camera);
            },
            leading: const Icon(Icons.camera),
            title: const Text('From Camera'),
          )
        ],
      ),
    );
  }
}

class CreateGroupDropdownModal extends StatefulWidget {
  const CreateGroupDropdownModal({
    super.key,
  });

  @override
  State<CreateGroupDropdownModal> createState() =>
      _CreateGroupDropdownModalState();
}

class _CreateGroupDropdownModalState extends State<CreateGroupDropdownModal> {
  final _createGroupFormKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        title: const Text("Create Custom Task Group"),
        content: Container(
            width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? null
                : 360,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      key: _createGroupFormKey,
                      child: Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            TextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Enter the group title',
                                ),
                                obscureText: false,
                                validator: validateField),
                            TextFormField(
                                controller: subtitleController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: 'Enter the group description',
                                ),
                                obscureText: false,
                                validator: validateField),
                            FileField(
                                title: "group image",
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color:
                                        Theme.of(context).colorScheme.surface),
                                hintText: "Choose an Image",
                                onTap: () {})
                          ]))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            if (_createGroupFormKey.currentState!.validate()) {}
                          },
                          child: const Text("Create"))
                    ],
                  ),
                ])));
  }
}

class TaskAdditionalDetail {
  final String title;
  final String subtitle;
  TaskAdditionalDetail({required this.title, required this.subtitle});
}

class InputModal extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType inputType;
  final int? maxLines;
  final int? maxLength;

  const InputModal({
    super.key,
    required this.title,
    required this.hintText,
    required this.inputType,
    this.maxLines,
    this.maxLength,
  });

  @override
  State<InputModal> createState() => _InputModalState();
}

class _InputModalState extends State<InputModal> {
  final _createInputFormKey = GlobalKey<FormState>();
  final valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        title: Text(widget.title),
        content: Container(
            width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? null
                : 360,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      key: _createInputFormKey,
                      child: Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            TextFormField(
                                controller: valueController,
                                keyboardType: widget.inputType,
                                decoration: InputDecoration(
                                  hintText: widget.hintText,
                                ),
                                maxLength: widget.maxLength,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLines: widget.maxLines,
                                obscureText: false,
                                validator: validateField),
                          ]))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            if (_createInputFormKey.currentState!.validate()) {}
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                ])));
  }
}

class TaskInputModal extends StatefulWidget {
  const TaskInputModal({
    super.key,
  });

  @override
  State<TaskInputModal> createState() => _TaskInputModalState();
}

class _TaskInputModalState extends State<TaskInputModal> {
  final _createAdditionalInputFormKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        content: Container(
            width: ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
                ? null
                : 360,
            height: 256,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      key: _createAdditionalInputFormKey,
                      child: Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            TextFormField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  hintText: "Enter title",
                                ),
                                maxLength: 150,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLines: 1,
                                obscureText: false,
                                validator: validateField),
                            TextFormField(
                                controller: subtitleController,
                                decoration: const InputDecoration(
                                  hintText: "Enter subtitle",
                                ),
                                maxLength: 250,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLines: 1,
                                obscureText: false,
                                validator: validateField),
                          ]))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              Colors.white,
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      FilledButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            if (_createAdditionalInputFormKey.currentState!
                                .validate()) {}
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                ])));
  }
}

class DropdownField extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final VoidCallback onTap;

  const DropdownField({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onTap,
  });

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: widget.onTap,
        leading: widget.leading,
        title: Text(widget.title),
        subtitle: widget.subtitle.isEmpty
            ? null
            : Text(
                widget.subtitle,
              ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_drop_down),
          onPressed: widget.onTap,
        ));
  }
}
