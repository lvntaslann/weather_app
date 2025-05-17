import 'package:block_app/model/sayac_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<SayacCubit, int>(builder: (context, sayacDegeri) {
              return Text(
                "$sayacDegeri",
                style: TextStyle(fontSize: 36),
              );
            }),
            ElevatedButton(
              onPressed: () {
                context.read<SayacCubit>().sayaciAzalt(1);
              },
              child: Text("Sayacı azalt"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<SayacCubit>().sayaciArttir();
              },
              child: Text("Sayaci arttir"),
            )
          ],
        ),
      ),
    );
  }
}
