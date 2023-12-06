import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class SuperBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _printWrapped('bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    var string =
        '\n********************************************************************************\n';
    string +=
        '******************************* TRANSITION START *******************************\n';
    string +=
        '********************************************************************************\n';
    string += 'BLOC: ${bloc.runtimeType}\n';
    string += 'EVENT: ${transition.event}\n';
    string += 'CURRENT STATE: ${transition.currentState}\n';
    string += 'NEXT STATE: ${transition.nextState}\n';
    string +=
        '********************************************************************************\n';
    string +=
        '******************************** TRANSITION END ********************************\n';
    string +=
        '********************************************************************************\n';

    _printWrapped(string);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _printWrapped(
      'bloc: ${bloc.runtimeType}, error: $error, stacktrace: $stackTrace',
    );
  }

  void _printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    debugPrint('\n');
    pattern.allMatches(text).forEach((match) => debugPrint('${match.group(0)}'));
    debugPrint('\n');
  }
}
