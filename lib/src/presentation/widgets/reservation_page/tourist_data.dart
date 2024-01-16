import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/constants/tourist_nums.dart';
import 'package:job_test/core/services/services.dart';
import 'package:job_test/src/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:job_test/src/presentation/widgets/reservation_page/tourist_card.dart';

class TouristData extends StatelessWidget {
  static int peopleCount = 2;
  final ScrollController controller;
  final TextEditingController textController;

  const TouristData({
    super.key,
    required this.controller,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = services<ReservationBloc>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SizedBox(height: 8),
        BlocBuilder<ReservationBloc, ReservationState>(
          bloc: bloc,
          builder: (context, state) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: (bloc.state as MainReservationState).touristCount,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final GlobalKey<State<TouristCard>> touristCardKey = GlobalKey();
                final touristCardInfo = (bloc.state as MainReservationState).touristCardInfo;

                return TouristCard(
                  touristNumber: touristNums[index],
                  formKey: (bloc.state as MainReservationState).touristCardInfo[index].stateKey,
                  index: index,
                  controller: controller,
                  touristTextFields: touristCardInfo[index],
                  touristCardKey: touristCardKey,
                );
              },
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Добавить туриста',
                  style: textTheme.titleLarge,
                ),
              ),
              const Spacer(),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.rectangle, borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => bloc.add(AddTouristReservationEvent()),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
