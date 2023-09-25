import 'package:flutter/material.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: (){},
              child: Text('입차시 안내교육'),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('마감시 해야할 목록'),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('오전출근시 해야할 일들'),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('신사 주차시 지켜야할 사항'),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('지하주차시 지킬목록'),
          ),
        ],
      ),
    );
  }
}
