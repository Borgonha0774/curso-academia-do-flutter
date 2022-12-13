import 'package:flutter/widgets.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Paul Walker';
  String imgAvatar =
      'https://imagepng.org/wp-content/uploads/2017/08/whatsapp-icone-4.png';
  String birthDate = '12/12/2012';

  void alterarDados() {
    name = 'Sales';
    imgAvatar =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJrUw6FoJtv2TtMxcL-2QkrnAwChuQnCheK4pvemud&s';
    birthDate = '22/02/2014';
    notifyListeners();
  }

  void alterarNome() {
    name = 'Academia deo Flutter';
    notifyListeners();
  }
}
