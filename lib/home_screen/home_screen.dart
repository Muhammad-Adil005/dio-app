/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dio App"),
      ),
      body: const MyContainer(),
    );
  }
}

final dio = Dio();
void getHTTP() async {
  try {
    var response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    print('Response : $response');
  } catch (e) {
    print("Error : $e");
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          getHTTP();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          height: 100,
          width: 200,
          child: const Center(
            child: Text(
              'Button',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio _dio = Dio();
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    //fetchData();
    getData();
  }

  // This is the function for Get Response
  // Future<void> fetchData() async {
  //   try {
  //     final response =
  //         await _dio.get('https://jsonplaceholder.typicode.com/posts');
  //     setState(() {
  //       _data = response.data;
  //     });
  //     //print("response : $response");
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

  // This is the function for POST Response and also Interceptors

  /*Future<void> fetchData() async {
    try {
      _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioException error, handler) {
          // Do something with the error
          print('Interceptor Error: $error');
          // Pass the error to the next interceptor in the chain
          handler.next(error);
        },
      ));
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'My post',
          'body': 'This is my post content',
          'userId': 1,
        },
      );
      print("response : $response");
    } catch (e) {
      print('Error fetching data: $e');
    }
  }*/

  var jsonList;

  void getData() async {
    try {
      var response = await _dio
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['superheros'] as List;
        });
        print('Response : $response');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       centerTitle: true,
    //       title: const Text('Dio Example'),
    //     ),
    //     body: GestureDetector(
    //       //onTap: () => fetchData(),
    //       onTap: () => getData(),
    //       child: Center(
    //         child: Container(
    //           height: 100,
    //           width: 200,
    //           color: Colors.blue,
    //           child: Center(
    //             child: Text(
    //               'POST Data',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ) /*
    //   // This is for Get Response
    //
    //   _data.isEmpty
    //       ? const Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : ListView.builder(
    //           itemCount: _data.length,
    //           itemBuilder: (context, index) {
    //             final item = _data[index];
    //             return ListTile(
    //               title: Text(
    //                 item['title'],
    //                 style: const TextStyle(
    //                   color: Colors.blue,
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //               subtitle: Text(
    //                 item['body'],
    //                 style: TextStyle(
    //                   color: Colors.red,
    //                 ),
    //               ),
    //             );
    //           },
    //         ),*/
    //     );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GeeksForGeeks Dio',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  jsonList[index]['url'],
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(jsonList[index]['name']),
              subtitle: Text(jsonList[index]['power']),
            ));
          }),
    );
  }
}
