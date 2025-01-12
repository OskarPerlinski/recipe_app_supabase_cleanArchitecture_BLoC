import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_api/bloc/button/button_cubit.dart';
import 'package:recipe_api/bloc/category/category_cubit.dart';
import 'package:recipe_api/bloc/logout/logout_cubit.dart';
import 'package:recipe_api/bloc/recipe/recipe_cubit.dart';
import 'package:recipe_api/bloc/splash/splash_cubit.dart';
import 'package:recipe_api/domain/recipe/usecases/get_breakfast.dart';
import 'package:recipe_api/domain/recipe/usecases/get_by_category_id.dart';
import 'package:recipe_api/domain/recipe/usecases/get_high_protein.dart';
import 'package:recipe_api/domain/recipe/usecases/get_meal.dart';
import 'package:recipe_api/presentation/splash/splash.dart';
import 'package:recipe_api/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

   await Supabase.initialize(
    url: dotenv.env['SUPABASE_API_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  );

  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => CategoryCubit()..displayCategory()),
        BlocProvider(create: (context) => RecipeCubit(useCase: sl<GetBreakfastUseCase>())),
        BlocProvider(create: (context) => RecipeCubit(useCase: sl<GetHighProteinUseCase>())),
        BlocProvider(create: (context) => RecipeCubit(useCase: sl<GetMealUseCase>())),
        BlocProvider(create: (context) => RecipeCubit(useCase: sl<GetByCategoryIdUseCase>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}

