import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/buyer_data.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/hotel_group.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/price.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/reservation_data.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/tourist_data.dart';
import 'package:job_test/src/presentation/widgets/common/standard_filled_button.dart';
import 'package:job_test/src/presentation/widgets/common/standard_scaffold.dart';

class ReservationPage extends StatelessWidget {
  static const name = 'reservation';

  static const BorderRadius textFieldBorderRadius = BorderRadius.all(Radius.circular(10.0));
  static final controller = ScrollController();
  static const rowSpacer = TableRow(children: [SizedBox(height: 16), SizedBox(height: 16), SizedBox(height: 16)]);

  final bool arrowBack;
  const ReservationPage({
    super.key,
    required this.arrowBack,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = services<ReservationBloc>();
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (_, __) {
        switch (bloc.state.runtimeType) {
          case MainReservationState:
            final curentState = (bloc.state as MainReservationState);
            final reservationModel = curentState.reservationModel;

            return StandardScaffold(
              title: 'Бронирование',
              arrowBack: arrowBack,
              child: ListView(
                controller: controller,
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 8),
                  HotelGroup(
                    rating: reservationModel.horating.toString(),
                    adress: reservationModel.hotelAdress,
                    name: reservationModel.hotelName,
                    ratingName: reservationModel.ratingName,
                  ),
                  const SizedBox(height: 8),
                  ReservationData(
                    departure: reservationModel.departure,
                    arrivalCountry: reservationModel.arrivalCountry,
                    tourDateStart: reservationModel.tourDateStart,
                    tourDateStop: reservationModel.tourDateStop,
                    numberOfNights: reservationModel.numberOfNights.toString(),
                    hotelName: reservationModel.hotelName,
                    room: reservationModel.room,
                    nutrition: reservationModel.nutrition,
                  ),
                  const SizedBox(height: 8),
                  BuyerData(formKey: curentState.headerKey),
                  const SizedBox(height: 8),
                  TouristData(
                    controller: controller,
                    textController: TextEditingController(),
                  ),
                  const SizedBox(height: 8),
                  Price(
                    fuelCharge: reservationModel.fuelCharge,
                    serviceCharge: reservationModel.serviceCharge,
                    tourPrice: reservationModel.tourPrice,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Color(0xFFE8E9EC)),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 15),
                    child: StandardFilledButton(
                      onTap: () async {
                        bloc.add(CheckTextFieldsReservationEvent(context: context));

                        if ((bloc.state as MainReservationState).isTextFieldsFilled) {}
                      },
                      text: 'К выбору номера',
                    ),
                  ),
                ],
              ),
            );
          default:
            return StandardScaffold(
              title: 'Бронирование',
              arrowBack: arrowBack,
              standartBackgroundColor: false,
              child: Center(
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                ),
              ),
            );
        }
      },
    );
  }
}
