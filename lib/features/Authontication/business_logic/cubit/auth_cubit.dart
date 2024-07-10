import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nibras_group_jor/features/Authontication/data/repo/authRepo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthRepo authRepo) : super(AuthInitial());
}
