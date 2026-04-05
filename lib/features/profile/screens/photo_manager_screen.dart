import 'package:flutter/material.dart';

class PhotoManagerScreen extends StatelessWidget {
  const PhotoManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('照片墙管理'),
      ),
      body: const Center(
        child: Text('照片管理页面'),
      ),
    );
  }
}
