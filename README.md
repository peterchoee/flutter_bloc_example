# Flutter BLOC Pattern Example
- 한국영화진흥위원회 OpenAPI를 이용해 박스오피스 순위(1위~10위)를 받아와서 '즐겨찾기' 추가 기능을 사용하여 로컬DB에 저장하는 예제  
- 해당 기능을 Flutter에서 권장되는 BLOC 패턴을 사용해 진행

## Flutter
- 플러터(Flutter)는 구글이 개발한 오픈 소스 모바일 애플리케이션 개발 프레임워크

[플러터 개발환경 구축](https://choedeb.github.io/2020-02-08-flutter-setting.md)<br>
[플러터 SDK 버전 정보](https://flutter.dev/docs/development/tools/sdk/releases)<br>
[플러터 패키지 정보](https://pub.dev/)<br>

## BLoC Pattern
- BLoC Pattern 이란 Bussiness Logic Component의 줄임말이다. 
- BLoC Pattern은 Flutter 의 상태(State) 관리를 제어하기위해서 Google 개발자에 의해서 디자인되었다. 
- Flutter 에서는 상태에 따라서 렌더링이 일어나기 때문에, 상태 관리가 매우 중요하다. 
- BLoC 은 UI 와 Bussiness Logic 을 분리하여, 각각 코드의 의존성을 낮추게한다.

![BLoC_Pattern_Image](https://user-images.githubusercontent.com/58249793/79863123-2d268b80-8412-11ea-9b7a-9997deead931.png)

- BLoC은 MVVM의 ViewModel과 같은 계층이다.
- ViewModel과 같이 BLoC은 View 계층에 대한 의존성이 없다.
- MVVM에서는 ViewModel이 View를 변경하기 위해 Observer와 DataBinding을 사용하지만 BLoC은 Stream을 사용한다.

## Requirements
* 박스오피스 일간순위 정보 (dio, retrofit, rxdart)
* 일간순위 정보 로컬 저장, 삭제 (sqlite, path)

## References
* [https://medium.com/@vaygeth/reactive-flutter-todo-app-using-bloc-design-pattern-b71e2434f692](https://medium.com/@vaygeth/reactive-flutter-todo-app-using-bloc-design-pattern-b71e2434f692)
* [https://medium.com/flutterdevs/flutter-bloc-for-state-management-using-dio-with-retrofit-ca877463634d](https://medium.com/flutterdevs/flutter-bloc-for-state-management-using-dio-with-retrofit-ca877463634d)

## etc
* [한국영화진흥위원회 OpenAPI](http://www.kobis.or.kr)