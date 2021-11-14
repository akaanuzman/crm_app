## 📱 State Management
I used MobX state management in this proeject.
<br>
<img src="https://mobx.js.org/img/mobx.png" width="300" height="300">
```dart
import 'package:mobx/mobx.dart';

part 'reset_pass_view_model.g.dart';

class ResetPassViewModel = _ResetPassViewModelBase with _$ResetPassViewModel;

abstract class _ResetPassViewModelBase with Store {
  @observable
  bool isOpen = false;

  @observable
  bool isClose = true;

  @observable
  bool isButtonClose = false;

  @action
  void openToClose() {
    isOpen = !isOpen;
  }

  @action
  void closeToOpen() {
    isClose = !isClose;
  }

  @action
  void buttonCloseOrOpen() {
    isButtonClose = !isButtonClose;
  }
}
```


## 💻 Software Design Pattern
I used it singleton design pattern, abstract factory pattern, build and observer desing pattern in this project for performance.
```dart
import 'package:dio/dio.dart';

import '../../constants/app/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance != null) {
      return _instance;
    } else {
      _instance = NetworkManager.init();
      return _instance!;
    }
  }

  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(baseUrl: ApplicationConstants.instance!.baseUrl));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
      ),
    );
  }
}
```

## 📚 Software Architectural Pattern
I used MVVM software architectural pattern in this project.
<img src="assets/images/mvvm.png">
<img src="https://api.hackathonturkiye.com/media/hosting/images/mvvm.jpg">

## 🔍 Preview
#### 🔥 Login Page View
<img src="assets/images/login.png" width=300 height=600>

#### 🔥 Register Page View
<img src="assets/images/register.png" width=300 height=600>

#### 🔥 Reset Password Page View
<img src="assets/images/resetpass.png" width=300 height=600>

#### 🔥 Project Page View
<img src="assets/images/proje3.jpeg" width=300 height=600>
<img src="assets/images/proje2.jpeg" width=300 height=600>
<img src="assets/images/proje1.jpeg" width=300 height=600>

#### 🔥 Dashboard Page View
<img src="assets/images/katman3.jpeg" width=300 height=600>
<img src="assets/images/katman1.jpeg" width=300 height=600>
<img src="assets/images/katman2.jpeg" width=300 height=600>

#### 🔥 Dashboard Settings Page View
<img src="assets/images/katman4.jpeg" width=300 height=600>
<img src="assets/images/katman5.jpeg" width=300 height=600>
<img src="assets/images/katman6.jpeg" width=300 height=600>

#### 🔥 Contact Page View
<img src="assets/images/rehber2.jpeg" width=300 height=600>
<img src="assets/images/rehber1.jpeg" width=300 height=600>

#### 🔥 Mail Page View
<img src="assets/images/mail2.jpeg" width=300 height=600>
<img src="assets/images/mail1.jpeg" width=300 height=600>

#### 🔥 Company Page View
<img src="assets/images/firma1.jpeg" width=300 height=600>
<img src="assets/images/firma2.jpeg" width=300 height=600>
<img src="assets/images/firma3.jpeg" width=300 height=600>

#### 🔥 Company Page View (UPDATED 💣)
<img src="assets/images/yenifirma3.png" width=300 height=600>
<img src="assets/images/yenifirma2.png" width=300 height=600>
<img src="assets/images/yenifirma1.png" width=300 height=600>
<img src="assets/images/yenifirma4.png" width=300 height=600>

#### 🔥 Profile Page View
<img src="assets/images/profil4.jpeg" width=300 height=600>
<img src="assets/images/profil3.jpeg" width=300 height=600>
<img src="assets/images/profil2.jpeg" width=300 height=600>
<img src="assets/images/profil1.jpeg" width=300 height=600>
