import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_test/core/constants/reg_exp.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/reservation_text_form_field.dart';

class TouristCard extends StatefulWidget {
  static bool isExpanded = false;

  final ScrollController controller;
  final TouristCardInfo touristTextFields;
  final int index;
  final GlobalKey<State<TouristCard>> touristCardKey;
  final GlobalKey<FormState> formKey;
  final String touristNumber;

  const TouristCard({
    required this.index,
    required this.controller,
    required this.touristTextFields,
    required this.touristCardKey,
    required this.formKey,
    required this.touristNumber,
  }) : super(key: touristCardKey);

  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  void _scrollToSelectedContent(bool isExpanded, double previousOffset, int index, GlobalKey myKey) {
    final keyContext = myKey.currentContext;
    if (keyContext != null) {
      Future.delayed(const Duration(milliseconds: 250)).then((value) {
        Scrollable.ensureVisible(keyContext, duration: const Duration(milliseconds: 250));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    double previousOffset;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Form(
          key: widget.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            onExpansionChanged: (value) {
              setState(() {
                TouristCard.isExpanded = !TouristCard.isExpanded;
              });

              if (value) {
                previousOffset = widget.controller.offset;
                _scrollToSelectedContent(value, previousOffset, widget.index, widget.touristCardKey);
              }
            },
            trailing: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: colorScheme.primary.withOpacity(0.1), borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: (TouristCard.isExpanded) ? SvgPicture.asset('assets/icons/arrow_up.svg', height: 6, width: 12, fit: BoxFit.scaleDown) : SvgPicture.asset('assets/icons/arrow_down.svg', height: 6, width: 12, fit: BoxFit.scaleDown),
            ),
            iconColor: colorScheme.primary,
            title: Text(
              '${widget.touristNumber} турист',
              style: textTheme.titleLarge,
            ),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.name,
                labelText: 'Имя',
                hintText: 'Иван',
                controller: widget.touristTextFields.nameTextEditingController,
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.surname,
                labelText: 'Фамилия',
                hintText: 'Иванов',
                controller: widget.touristTextFields.surnameTextEditingController,
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.dateOfBirth,
                labelText: 'Дата рождения',
                hintText: '12.12.2000',
                controller: widget.touristTextFields.dateOfBirthTextEditingController,
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.citezenship,
                labelText: 'Гражданство',
                hintText: 'РФ',
                controller: widget.touristTextFields.citizenshipTextEditingController,
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.abroadPasport,
                labelText: 'Номер загранпаспорта',
                hintText: '123456789',
                controller: widget.touristTextFields.abroadPasportNumberTextEditingController,
              ),
              const SizedBox(height: 8),
              ReservationTextFormField(
                formKey: widget.formKey,
                formRegExp: RegExpConsts.validityAbroadPasport,
                hintText: '12.12.2000',
                labelText: 'Срок действия загранпаспорта',
                controller: widget.touristTextFields.abroadPasportValidityTextEditingController,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
