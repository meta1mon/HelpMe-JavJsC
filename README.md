# HelpMe-JavJsC
## [BTS 바로 가기](http://112.221.156.36:8090/bts)
## [시연 영상 바로 보기]() 
##### 팀원 : 김연준, 이승연, 정재훈, 제승하, 하도경
---
## Contents
1. [프로젝트 소개](#프로젝트-소개)
2. [설계의 주안점](#설계목표와-기대효과)
3. [개발환경](#개발환경)
4. [프로젝트 기능구현](#프로젝트-기능구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
---
## 프로젝트 소개
- 사용자에게 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼
- 가상자산에 투자하려는 사람들에게 위험부담 없는 투자 기회와 경험을 제공
- 주식은 모의투자 개념의 프로그램이 이미 많이 활성화 되어있으나 암호화폐는 투자를 연습할 공간이 없는 실정이므로, 이에 암호화폐 모의투자 사이트를 기획하게 됨

---
## 설계목표와 기대효과
* 설계의 주안점
  - 적시성 : 현재 사회의 시대적 흐름을 반영한다
  - 실용성 : 현실에서 의미있게 사용되도록 한다
  - 다양한 경험 : 여러 API, 특히 RESTful API를 경험한다

* 기대효과
  - 코인 거래 시장에 대한 이해 증진
  - 투자의 Risk와 Return에 대한 이해 증진
  - 경제현상에 대한 분석능력 및 종합 사고력 향상

---
## 개발환경
![environment](https://user-images.githubusercontent.com/82936574/125957241-02971626-a1f4-400a-95b4-8219c22470b7.png)


|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JavaScript, CSS3, JQuery, Bootstrap|
|BackEnd|Java(JDK 1.8), Servlet, JSP, Spring, MyBatis|
|OS|Windows 10|
|Library|Apache Commons FileUpload, Imgscalr|
|IDE|Eclipse, VisualStudio, Spring Tool Suite|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, diagrams.net|
|CI|Github|
|DateBase|SQL Developer, Oracle(11g)|
|API|Investment Widget, Iamport Payment, Trading View, CKeditor5, Java.Mail.Sender, <br>Talk Plus, KaKao Channel, Cryptonews, Bithumb, Upbit

---
## 프로젝트 기능구현
- 정재훈
  - 프로젝트 총괄 / 커뮤니티-비동기 방식으로 게시글/댓글 조회, 작성, 수정, 삭제, 신고 기능 / 마이페이지-화면 설계, 공통메뉴 구현, 회원정보 조회 및 수정 기능 / 관리자페이지-화면 설계, 공통메뉴 구현 / 모의투자-Bithumb API 활용 / 랭킹-랭킹 조회, 자동 갱신, 수익률 산정 기능
- 강수목
  - 시스템분석 / 마이페이지 / 공지사항 관리 / 뉴스 페이지 / CSS 전반
- 김도영
  - 각종 API / 논리모델 구축 / 채팅 / 위젯 / 관리자-어사이드 / 1:1문의 / 모의투자
- 김연준
  - UI 설계 / 공지사항 / 커뮤니티-글목록, 글상세, 글등록 / 부트스트랩 / 각종 템플릿
- 제승하
  - 시스템설계 / 회원가입 / 로그인 / 비밀번호찾기 / 거래내역 페이지 / 관리자 페이지 / CSS 및 시스템 전반

---
## 주요기능
**1. 메인페이지**<br>
---
<left><img src=""  width="700" height="400" /></left>
- 뉴스 플로팅 메뉴 제공(Cryptonews API 사용)
- 표, 차트로 주요 코인 실시간 조회(bithumb, upbit, Trading View API 사용)
- BTMI, BTAI 지수 조회(Highcharts API 사용)
- 커뮤니티 인기 게시글 조회

## Document
### 1. 개발일정
![schedule](https://user-images.githubusercontent.com/82936574/125962840-a5019046-daa8-4b37-9baf-523ee7572f41.png) <br>
[개발일정 전체보기](https://github.com/meta1mon/final01/files/6831288/_.xlsx)

### 2. 유스케이스
![usecase](https://user-images.githubusercontent.com/82936574/125957196-0a2b51df-9a06-4433-8781-34aae77a0c35.gif)

### 3. ERD
![erd_board](https://user-images.githubusercontent.com/82936574/125958624-6300c3fa-1a4d-480f-98a1-d4cc5b9a5677.png)
![erd_investment](https://user-images.githubusercontent.com/82936574/125958638-54ebf113-c747-4b82-bcb9-8e816cb6034d.png)

### 4. 요구사항 정의서 및 분석서
![requirements_def](https://user-images.githubusercontent.com/82936574/126136679-44ad8a10-26eb-424c-8eba-046624f868d2.png) <br>
[요구사항 정의서 전체보기](https://github.com/meta1mon/Blockchain-Trading-Simulator/files/6839726/_.docx)<br><br>

![requirements_ana](https://user-images.githubusercontent.com/82936574/126138014-ee594f5e-8908-4fb5-8322-24f2c3b22663.png) <br>
[요구사항 분석서 전체보기](https://github.com/meta1mon/Blockchain-Trading-Simulator/files/6839728/_.docx)

### 5. 화면설계서
![슬라이드7](https://user-images.githubusercontent.com/82923946/126185505-a7f56b0a-74da-46e8-94f1-ec92660895d2.PNG)
![슬라이드18](https://user-images.githubusercontent.com/82923946/126185522-6e3d8456-5ed3-4f3b-9a1d-633277b4f351.PNG)
![슬라이드62](https://user-images.githubusercontent.com/82923946/126185570-f1756c10-bdb0-49e0-9802-5361754bc700.PNG)
[화면설계서 전체보기](https://github.com/meta1mon/Blockchain-Trading-Simulator/files/6842144/V3.4_StoryBoard.pdf)
