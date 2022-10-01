# 🏥 Vaccination Center List App

## 프로젝트 소개
📚[예방접종센터 위치정보 API](https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15077586#/API%20%EB%AA%A9%EB%A1%9D/getcenters)를 이용한 예방접종센터 위치 확인 어플


## 실행 화면
![ezgif com-gif-maker](https://user-images.githubusercontent.com/82325822/193395954-b984ab2c-73a7-4b1b-8ca4-c2d9d3b8663d.gif)

## 기능 구현
- URLSession을 이용한 비동기 네트워크 통신
- 어플 실행시 API호출 및 예방접종센터 List를 CollectionView에 표시
- JSONDecoder, Codable(Decodable만 이용)을 이용한 데이터 파싱
- RxSwift를 이용한 MVVM 패턴 구현
- MapKit을 이용해 접종센터 위치 및 현재 위치 표시 기능 구현

## 개발환경 및 라이브러리
- [![swift](https://img.shields.io/badge/swift-5.6-orange)]()
- [![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()
- [![xcode](https://img.shields.io/badge/RxSwift-6.5.0-hotpink)]()
- [![xcode](https://img.shields.io/badge/SnapKit-5.0.1-skyblue)]()


## 🚀 Trouble Shooting

### 📌 1. API 키 숨기기
구글 북스같이 따로 키가 필요없는 API를 이용할 때는 신경쓰지 않았던 부분이지만 이번 프로젝트는 따로 전달받은 API key가 있는데 회사 입장에서는 이 키가 외부로 노출되면 안될 것이다(악용 될 수 있고 실제로 깃허브에 API key를 올려 소송이 걸린 사례도 있다고 한다)

그래서 API key를 숨기는 방법을 여럿 찾아봤고 그 중에서 plist를 이용해 숨기는 방법을 채택했다

간단하게 설명하자면 plist에는 기본값인 "Please_enter_the_API-Key"라는 문구를 넣어놓고 커밋 한 뒤 해당 plist파일은 커밋을 스킵해주는 명령어를 터미널에 입력한 뒤 실 api key를 입력해주고 해당 키를 가져다 쓰는 작업을 하였으며 자세한 내용은 [블로그 포스팅](https://velog.io/@doogie97/221001-TIL-%EC%99%B8%EB%B6%80%EB%A1%9C-%EB%85%B8%EC%B6%9C%EB%90%98%EB%A9%B4-%EC%95%88%EB%90%98%EB%8A%94-API-Key-%EC%88%A8%EA%B8%B0%EA%B8%B0)에 정리를 해보았다

### 📌 2. queryItems을 쓰면 무조건 URL 인코딩이 잘 되는 줄 알았는데 아니었다...?
제공 받은 API KEY는 인코딩 되기 전의 형식의 키가 주어졌다
그래서 queryItems에 들어가서 url이 되는 과정을 통해 인코딩이 잘 될 것이라고 예상했지만...
= 은 %3D로 정상적으로 인코딩이 되는데 /와 +만 인코딩이 안되는 현상이 발생 했다

그래서 이곳 저곳 알아보니 그 이유를 URLComponents 문서에서 확인 할 수 있었는데 URLComponents는 RFC 3986를 따르며 인코딩이 되지 않는 기호들은 RFC3986 예약어로 지정되어 있기 때문일 것이라고 추측했다(https://www.rfc-editor.org/rfc/rfc3986#section-2.2 링크에 나와있음)

그래서 결론은 인코딩 되기 전 키를 인코딩을 시켜서 쿼리에 넣어버리기로 결정을 했는데 이또한 잘 되지 않았으며 그 이유는 이미 인코딩 된 apikey가 queryItems에 들어가면서 또 인코딩 됨으로 인해 제대로된 키를 전달하지 못하는 경우라고 생각했으며 queryItems대신 `percentEncodedQueryItems`를 사용하면서 문제는 해결 되었다

다만 걱정되는 것은 지금이야 쿼리에 인코딩이 필요없는 문자열이 들어오지만 추후 인코딩이 필요한 문자열이 들어오게 될 경우를 대비해 인코딩 되기전 키를 정상적으로 인코딩 시킬 수 있는 방법을 찾아봐야겠다

## 커밋 룰
💎feat : 새로운 기능 구현

✏️chore : 사소한 코드 수정, 내부 파일 수정, 파일 이동 등

🔨fix : 버그, 오류 해결

📝docs : README나 WIKI 등의 문서 개정

♻️refactor : 수정이 있을 때 사용 (이름변경, 코드 스타일 변경 등)

⚰️del : 불필요한 코드 제거

🔬test : 테스트 코드 수정
