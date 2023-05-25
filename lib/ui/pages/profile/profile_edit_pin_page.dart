import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit PIN',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: blackColor),
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: <Widget>[
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! NOTE: Old PIN INPUT
                    CustomForm(
                      title: 'Old PIN',
                      controller: oldPinController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    //! NOTE: New PIN INPUT
                    CustomForm(
                      title: 'New PIN',
                      controller: newPinController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilleButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                oldPinController.text,
                                newPinController.text,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
