import 'package:annar_app/ui/features/home/bloc/home_bloc.dart';
import 'package:annar_app/ui/features/home/view/widgets/custom_card.dart';
import 'package:annar_app/ui/features/login/bloc/login_bloc.dart';
import 'package:annar_app/utils/alerts/error_alert_dialog.dart';
import 'package:annar_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is FetchDataSuccess) {}
            if (state is FetchDataFailure) {
              const Center(
                  child:
                      Text(' no se obtuvieron resultados para ese usuario.'));
            }
          },
          builder: (context, state) {
            if (state is FetchDataSuccess) {
              return Padding(
                padding: const EdgeInsets.all(Const.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(child: Text('Historial Presion arterial',style: TextStyle(color: Colors.blue[500],fontSize: 25,fontWeight: FontWeight.bold),)),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return (state is LoginSuccess)
                            ? Text('Usuario: ${state.userName}')
                            : Container();
                      },
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.healthData.data!.length,
                      itemBuilder: (context, index) {
                        return CustomCard(data: state.healthData.data![index]!);
                      },
                    ))
                  ],
                ),
              );
            } else if (state is FetchDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchDataFailure) {
              return Center(child: Text(state.error));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
