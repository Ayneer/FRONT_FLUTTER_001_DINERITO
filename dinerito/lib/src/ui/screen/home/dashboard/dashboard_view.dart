import 'package:flutter/material.dart';

// import '../../../../infrastructure/helpers/session/secure_storage_session.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String? token = '';

  @override
  void initState() {
    super.initState();
    // token = SecureStorageSession().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text('Hello World ${token ?? ''}'),
        ],
      ),
    );
  }
}
