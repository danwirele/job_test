// ignore_for_file: must_be_immutable, empty_catches

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';

class ReservationTextFormField extends StatefulWidget {
  ReservationTextFormField({
    super.key,
    this.onTap,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    required this.labelText,
    required this.controller,
    required this.formRegExp,
    required this.formKey,
  });

  static const BorderRadius textFieldBorderRadius = BorderRadius.all(Radius.circular(10.0));
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final GlobalKey<FormState> formKey;
  final String formRegExp;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String? hintText;
  final TextEditingController controller;

  bool state = false;
  @override
  State<ReservationTextFormField> createState() => _ReservationTextFormFieldState();
}

class _ReservationTextFormFieldState extends State<ReservationTextFormField> {
  final border = const UnderlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: ReservationTextFormField.textFieldBorderRadius,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final res = widget.formKey.currentState?.validate();
      if (res == false && widget.controller.text.isNotEmpty) {
        if (widget.controller.text.isNotEmpty) {
          RegExp nameRegex = RegExp(widget.formRegExp);
          if (!nameRegex.hasMatch(widget.controller.text)) {
            widget.state = true;

            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bloc = services<ReservationBloc>();
    if (bloc.state is MainReservationState && (bloc.state as MainReservationState).repaintAll && widget.controller.text.isEmpty) {
      widget.state = true;
      setState(() {});
    }
    return TapRegion(
      onTapOutside: (event) {
        bool? res;
        try {
          res = widget.formKey.currentState?.validate();
        } catch (e) {}
        if (res == false && !RegExp(widget.formRegExp).hasMatch(widget.controller.text) && widget.controller.text.isNotEmpty) {
          widget.state = true;
          setState(() {});
          FocusScope.of(context).unfocus();
        }

        if (RegExp(widget.formRegExp).hasMatch(widget.controller.text)) {
          widget.state = false;
          setState(() {});
        }
      },
      child: TextFormField(
        controller: widget.controller,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: (String? value) {
          if (value != '' && value != null) {
            RegExp nameRegex = RegExp(widget.formRegExp);
            if (!nameRegex.hasMatch(value)) {
              return '';
            }
          }
          if (value == null || value == '') return '';

          return null;
        },
        style: textTheme.bodyMedium,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintStyle: textTheme.bodyMedium,
          labelText: widget.labelText,
          hintText: widget.hintText,
          isDense: true,
          labelStyle: textTheme.bodyMedium?.copyWith(color: const Color(0xFFA9ABB7)),
          contentPadding: const EdgeInsets.only(left: 16, top: 4, bottom: 10),
          filled: true,
          fillColor: widget.state ? const Color(0xFFEB5757).withOpacity(0.15) : const Color(0xFFF6F6F9),
          disabledBorder: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
          border: border,
        ),
      ),
    );
  }
}
