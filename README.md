# Flutter BLOC Pattern Example
한국영화진흥위원회 오픈 API 통신으로 박스오피스 순위(1위~10위)를 받아와서
'즐겨찾기' 추가 기능을 사용하여 로컬 데이터베이스(SQLite)에 저장하는
예제이다. 해당 기능을 Flutter에서 권장되는 BLOC 패턴을 사용한다.

## 플러터
플러터(Flutter)는 구글이 개발한 오픈 소스 모바일 애플리케이션 개발
프레임워크이다. 안드로이드, iOS용 애플리케이션 개발을 위해, 또 구글
푸크시아용 애플리케이션 개발의 주된 방식으로 사용된다. 플러터의 최초 버전의
코드명은 "Sky"(스카이)이며 안드로이드 운영 체제에서 실행되었다. 2015년 다트
개발자 서밋에서 공개되었으며 120 프레임/초로 꾸준히 렌더링이 가능하도록
의도되었다고 언급되었다. 상하이의 구글 개발자의 날 키노트 중에 구글은
플러터 1.0 전의 마지막 대형 릴리스인 플러터 릴리스 프리뷰 2를 발표하였다.
2018년 12월 4일, 플러터 1.0이 플러터 라이브 이벤트에서 공개되었으며
프레임워크의 최초의 안정판으로 언급되었다.

[플러터 개발환경 구축](https://choedeb.github.io/2020-02-08-flutter-setting.md)<br>
[플러터 SDK 버전 정보](https://flutter.dev/docs/development/tools/sdk/releases)<br>
[플러터 패키지 정보](https://pub.dev/)<br>

## 디자인 패턴
BLoC Pattern 이란 Bussiness Logic Component 의 줄임말이다. BLoC Pattern
은 Flutter 의 상태 관리를 제어하기위해서 Google 개발자에 의해서 디자인
되었다. Flutter 에서는 상태에 따라서 렌더링이 일어나기 때문에, 상태 관리가
매우 중요하다. BLoC 은 UI 와 Bussiness Logic 을 분리하여, 각각 코드의
의존성을 낮추게한다. Flutter 을 위해 설계 되었지만, 디자인 패턴이기 때문에,
어떠한 프레임워크 나 언어에서도 사용이 가능하다. 만약 Reactive Programming
을 이해하고 있다면, BLoC Pattern 을 이해하기 쉽다.

## 요구사항
* 박스오피스 일간순위 정보 (dio, retrofit, rxdart)
* 일간순위 정보 로컬 저장, 삭제 (sqlite, path)

## 참고자료
* [https://medium.com/@vaygeth/reactive-flutter-todo-app-using-bloc-design-pattern-b71e2434f692](https://medium.com/@vaygeth/reactive-flutter-todo-app-using-bloc-design-pattern-b71e2434f692)
* [https://medium.com/flutterdevs/flutter-bloc-for-state-management-using-dio-with-retrofit-ca877463634d](https://medium.com/flutterdevs/flutter-bloc-for-state-management-using-dio-with-retrofit-ca877463634d)

## 기타
* 한국영화진흥위원회 오픈 API [바로가기](http://www.kobis.or.kr)