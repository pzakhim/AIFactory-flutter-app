import '../../../../core/bloc/base_bloc_state.dart';

class HomeState extends BaseBlocState {
  const HomeState({
    this.currentTabIndex = 0,
    this.isBalanceMasked = false,
  });

  final int currentTabIndex;
  final bool isBalanceMasked;

  HomeState copyWith({
    int? currentTabIndex,
    bool? isBalanceMasked,
  }) {
    return HomeState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      isBalanceMasked: isBalanceMasked ?? this.isBalanceMasked,
    );
  }

  @override
  List<Object?> get props => [currentTabIndex, isBalanceMasked];
}
