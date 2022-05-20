import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagine_apps_prueba/Ui/components/card.dart';
import 'package:imagine_apps_prueba/bloc/imagines/imagines_cubit.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';
import 'package:imagine_apps_prueba/services/imagine_service.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imagine apps prueba',
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/ImagineApps.png'),
          Expanded(
            child: BlocBuilder<ImaginesCubit, bool>(
              builder: (context, hasImagines) {
                if (!hasImagines) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
                return StreamBuilder<List<ImagineModel>>(
                  stream: context.read<ImaginesCubit>().getImagines(),
                  builder: (context, snapshot) {
                    return Cards(
                      imagines: snapshot.data,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
