import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:update_her/app/assets/images.dart';
import 'package:update_her/app/enum/state_status_enum.dart';
import 'package:update_her/app/utils/my_image_picker.dart';
import 'package:update_her/app/widgets/bottom_shadow_container.dart';
import 'package:update_her/app/widgets/dialong/loading_dialog.dart';
import 'package:update_her/app/widgets/my_button.dart';
import 'package:update_her/app_bloc/cubit/send_message_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _onSendMessage(String filePath) async {
      context.read<SendMessageCubit>().sendImage(filePath: filePath);
    }

    return Scaffold(
      body: Center(
        child: BlocListener<SendMessageCubit, SendMessageState>(
          listener: (context, state) {
            if (state.status.isLoading) {
              context.showLoadingDialog();
            }
            if (state.status.isSuccess) {
              context.dismissLoadingDialog();
            }
          },
          child: BlocBuilder<SendMessageCubit, SendMessageState>(
              builder: (ctx, state) {
            if (state.filePath != null) {
              return Image.file(
                File(state.filePath!),
              );
            }

            return ImageAsset.of(1, 200, 200).takePicture;
          }),
        ),
      ),
      bottomNavigationBar: BottomShadowContainer(
        hideShadow: true,
        children: [
          MyButton.blue(
            'Take a Photo',
            onPressed: () async {
              final image = await onAddImageTap(context);

              if (!context.mounted) return;
              context.read<SendMessageCubit>().pickImage(filePath: image!);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SendMessageCubit, SendMessageState>(
            builder: (context, state) {
              if (state.filePath != null) {
                return MyButton.light(
                  'Send Image',
                  onPressed: () {
                    if (state.filePath == null) {
                      return;
                    }
                    _onSendMessage(state.filePath!);
                  },
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

Future<String?> onAddImageTap(BuildContext context) async {
  final image = await MyImagePicker().pickImage(
    source: ImageSource.camera,
  );

  log('image: $image');

  return image;
}
