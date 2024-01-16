import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:job_test/src/presentation/bloc/room/room_bloc.dart';
import 'package:job_test/src/presentation/widgets/room_page/room_card.dart';
import 'package:job_test/src/presentation/widgets/common/standard_scaffold.dart';

class RoomPage extends StatelessWidget {
  static const name = 'room';
  static final controller = ScrollController();

  const RoomPage({
    super.key,
    required this.arrowBack,
  });

  final bool arrowBack;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = services<RoomBloc>();
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (_, __) {
        switch (bloc.state.runtimeType) {
          case LoadedRoomState:
            final listRooms = (bloc.state as LoadedRoomState).listRooms.rooms;

            return StandardScaffold(
              arrowBack: arrowBack,
              title: (services<HotelBloc>().state as LoadedHotelState).hotelModel.name,
              child: ListView.separated(
                itemCount: listRooms.length,
                controller: controller,
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) => RoomCard(room: listRooms[index]),
              ),
            );
          default:
            return StandardScaffold(
              title: (services<HotelBloc>().state as LoadedHotelState).hotelModel.name,
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
