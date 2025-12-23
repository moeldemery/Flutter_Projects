

import 'validation_input.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc with ValidationMixin {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _errorMessage = new BehaviorSubject<String>();
  // getters
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get addError => _errorMessage.sink.add;
  // streams
  Stream<String> get email => _email.stream.transform(validatorEmail);
  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<String> get errorMessage => _password.stream;
  Stream<bool> get submitValidForm =>
      Rx.combineLatest3(email, password,_errorMessage, (e, p ,er) => true);

  // submitn button
  submit() {
    print(_email.value);
    print(_password.value);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}