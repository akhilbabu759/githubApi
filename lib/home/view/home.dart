import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:github_api/home/controller/controller.dart';
import 'package:github_api/home/view/widget/home_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    log('hi');
    context.watch<CounterProvider1>().getData(true);
    //  counter1.getData(true);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 221, 221, 221),
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'GitOS',
            style: TextStyle(fontSize: 25, letterSpacing: 1, shadows: [
              Shadow(
                color: Color.fromARGB(255, 121, 121, 121),
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
              ),
            ]),
          ),
          ),
      backgroundColor: Colors.white,
      body: Consumer<CounterProvider1>(
        builder: (context, value, child) {
          log('hi2');
          return value.listData.isEmpty
              ? Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Check your internet connection'),IconButton(onPressed: () {

                        context.watch<CounterProvider1>().getData(true);
                      }, icon: const Icon(Icons.refresh))
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18,top: 18),
                  child: Column(children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text('to change :',style: TextStyle(color:Colors.black ),),Consumer<CounterProvider1>(
                    //         builder: (context, value, child) {return Card(
                    //           child: TextButton(onPressed: () {
                    //             value.changeDay(!value.dayChange);
                                
                    //           }, child: Text("${value.dayChange? 30: 60} day's",style: TextStyle(color:Colors.black ))),
                    //         );})
                    //     ],
                    //   ),
                    // ),
            //          Consumer<CounterProvider1>(
            //   builder: (context, values, child) => Row(
            //     children: [
            //       RadioListTile<String>(
            //         title: Text('30 day'),
            //         value: '30',
            //         groupValue: values.selectedOption,
            //         onChanged: (value) {
            //           values.selectedOption = value!;
            //         },
            //       ),
            //       RadioListTile<String>(
            //         title: Text('60 day'),
            //         value: '60',
            //         groupValue: values.selectedOption,
            //         onChanged: (value) {
            //           values.selectedOption = value!;
            //         },
            //       )
            //     ],
            //   ),
            // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.1,
                    // ),
                    Expanded(
                        child: Consumer<CounterProvider1>(builder: (context, value, child) => 
                           ListView.builder(
                              itemCount: value.listData.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: HomeListTile(
                                      tex: value.listData[index]!.name,
                                      desc: value.listData[index]!.description,
                                      img: value.listData[index]!.ownerAvatarUrl,
                                      owner: value.listData[index]!.ownerUsername,
                                      star: value.listData[index]!.stars,
                                    ),
                                  )),
                        ))
                  ]),
                );
        },
      ),
    );
  }
}
