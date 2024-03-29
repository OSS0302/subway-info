import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subwayinfo_app/ui/main_veiw_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 조회 앱 '),
      ),
      body: Column(
        children: [
          Text('지하철 역을 입력하세요'),
          TextField(
            onChanged: (value) {
              viewModel.getSubwayStationInfoList(value);

            },
            controller: _textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '지하철 역 ',
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
              child: ListView(
                children: state.subwayStationInfoList
                    .map(
                      (e) => Text(e.toString()),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}