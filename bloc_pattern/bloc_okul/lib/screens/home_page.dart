import 'package:block_app/model/sayac_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SayacCubit, int>(
              builder: (context, sayacDegeri) {
                return Text(
                  "$sayacDegeri",
                  style: TextStyle(fontSize: 36),
                );
              },
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/secondpage"),
                child: Text("Geçiş Yap"))
          ],
        ),
      ),
    );
  }
}
