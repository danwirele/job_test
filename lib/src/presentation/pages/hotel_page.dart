import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:job_test/src/presentation/widgets/hotel_page/carousel_slider.dart';
import 'package:job_test/src/presentation/widgets/hotel_page/detailed_hotel_info.dart';
import 'package:job_test/src/presentation/widgets/hotel_page/main_hotel_info.dart';
import 'package:job_test/src/presentation/pages/room_page.dart';
import 'package:job_test/src/presentation/widgets/common/standard_filled_button.dart';
import 'package:job_test/src/presentation/widgets/common/standard_scaffold.dart';

class HotelPage extends StatelessWidget {
  static const name = 'hotel';
  static final controller = ScrollController();

  final bool arrowBack;

  const HotelPage({
    super.key,
    required this.arrowBack,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = services<HotelBloc>();
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (_, __) {
        switch (bloc.state.runtimeType) {
          case LoadedHotelState:
            final currentState = bloc.state as LoadedHotelState;
            return StandardScaffold(
              arrowBack: arrowBack,
              title: 'Отель',
              child: ListView(
                controller: controller,
                shrinkWrap: true,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                    child: CarouselSlider(imageList: currentState.hotelModel.imageUrls),
                  ),
                  MainHotelInfo(
                    rating: currentState.hotelModel.rating.toString(),
                    ratingName: currentState.hotelModel.ratingName,
                    adress: currentState.hotelModel.adress,
                    minimalPrice: currentState.hotelModel.minimalPrice.toString(),
                    name: currentState.hotelModel.name,
                    priceForIt: currentState.hotelModel.priceForIt,
                  ),
                  const SizedBox(height: 8),
                  DetailedHotelInfo(hotel: currentState.hotelModel),
                  const SizedBox(height: 12),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Color(0xFFE8E9EC)),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 15),
                    child: StandardFilledButton(
                      onTap: () => Navigator.of(context).pushNamed(RoomPage.name, arguments: true),
                      text: 'К выбору номера',
                    ),
                  ),
                ],
              ),
            );

          default:
            return StandardScaffold(
              title: 'Отель',
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
