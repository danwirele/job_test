import 'package:flutter/material.dart';
import 'package:job_test/core/constants/reg_exp.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/core/validators/phone_number_formatter.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/reservation_text_form_field.dart';
import 'package:job_test/src/presentation/widgets/common/standard_card.dart';

class BuyerData extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const BuyerData({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final state = services<ReservationBloc>().state as MainReservationState;
    final emailTextEditingController = state.emailTextEditingController;
    final phoneNumberTextEditingController = state.phoneNumberTextEditingController;
    final textTheme = Theme.of(context).textTheme;

    return StandardCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Информация о покупателе',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              ReservationTextFormField(
                formKey: formKey,
                formRegExp: RegExpConsts.phone,
                controller: phoneNumberTextEditingController,
                keyboardType: TextInputType.phone,
                inputFormatters: [PhoneNumberFormatter()],
                onTap: () {
                  if (phoneNumberTextEditingController.text.isEmpty) phoneNumberTextEditingController.text = '+7(***)***-**-**';
                  phoneNumberTextEditingController.selection = const TextSelection.collapsed(offset: 3);
                },
                labelText: 'Номер телефона',
                hintText: '+7(***)***-**-**',
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: formKey,
                formRegExp: RegExpConsts.email,
                controller: emailTextEditingController,
                labelText: 'Почта',
                hintText: 'your_mail@mail.ru',
              ),
              const SizedBox(height: 4),
              Text(
                'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF828796)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
