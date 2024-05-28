import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:update_her/app/enum/state_status_enum.dart';
import 'package:update_her/app/services/telegram_init.dart';
import 'package:update_her/app/utils/my_image_picker.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<SendMessageCubit, SendMessageState>(
                builder: (ctx, state) {
              if (state.status.isSuccess) {
                return Column(
                  children: [
                    Image.file(File(state.filePath!), width: 400, height: 400),
                    ElevatedButton(
                      onPressed: () {
                        BaseTelegramService.instance.sendPhoto(
                            chatId: '-4279231714',
                            photo: File(state.filePath!));
                      },
                      child: const Text('Send Image'),
                    ),
                  ],
                );
              }

              return const Text('te');
            }),
            ElevatedButton(
              onPressed: () async {
                final image = await onAddImageTap(context);
                if (!context.mounted) return;
                context.read<SendMessageCubit>().pickImage(filePath: image!);
              },
              child: const Text('Open Cam'),
            ),
          ],
        ),
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
