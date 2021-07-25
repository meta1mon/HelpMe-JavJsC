# HelpMe-JavJsC
## [War 링크 넣을 곳](http://www.naver.com)
## [시연 영상 바로 보기](http://www.naver.com) 
##### 팀원 : 김연준, 이승연, 정재훈, 제승하, 하도경
---
## Contents
1. [프로젝트 소개](#프로젝트-소개)
2. [설계 주안점](#설계-주안점)
3. [개발환경](#개발환경)
4. [프로젝트 기능구현](#프로젝트-기능구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
---
## 프로젝트 소개
- 신입 개발자를 위한 종합 커뮤니티
- 신입 개발자와 선배 개발자의 접점 제공

---
## 설계 주안점
* 설계의 주안점
  - 사용자 관점 : 커뮤니티 사용자의 편의성을 높이고자 함
  - 관리자 관점 : 관리자의 관리 용이성을 높이고자 함
  - 학습한 내용을 프로젝트에서 실제로 적용
  - 다양한 API 사용 경험 축적

---
## 개발환경
![사용기술](https://user-images.githubusercontent.com/82925724/126887934-9267543d-35ad-4f67-823c-b398fbf5191a.png)



|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JavaScript, CSS3, JQuery, Bootstrap|
|BackEnd|Java(JDK 1.8), Servlet, JSP|
|OS|Windows 10|
|Library|COS|
|IDE|Eclipse, VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, diagrams.net, StarUML|
|CI|Github|
|DateBase|SQL Developer, Oracle(11g)|
|API| CKeditor5

---
## 프로젝트 기능구현
- 김연준
  - ㅁㅁ
- 이승연
  - 상품 등록 / 상품 수정 / 상품 삭제 /  장바구니 / 장바구니 수정 / 장바구니 삭제 / 구매하기 / 구매완료 / 실시간 구매량 차트 /  구매량 top5 차트
- 정재훈
  - 프로젝트 총괄 / 회원가입 / 로그인 / 비밀번호찾기 / 커뮤니티-게시글&댓글 조회, 작성, 수정, 삭제, 좋아요 기능 / 게시글 목록, 조회 기능 / 전체적인 MVC 2 모델 통일 및 기능 도움
- 제승하
  - ㅍㅍ
- 하도경
  - ㅌㅌ

---
## 주요기능
**1. 메인페이지**<br>
---
<left><img src=""  width="700" height="400" /></left>
- 뉴스 플로팅 메뉴 제공(Cryptonews API 사용)
- 표, 차트로 주요 코인 실시간 조회(bithumb, upbit, Trading View API 사용)
- BTMI, BTAI 지수 조회(Highcharts API 사용)
- 커뮤니티 인기 게시글 조회

**14. 관리자 페이지**<br>
---
<left><img src="https://user-images.githubusercontent.com/82925724/126891364-f3cde214-5e6f-414e-bea4-e603cc15116e.gif"  width="700" height="400" /></left>
- 관리자 계정(semi01)으로 로그인 시에만 관리자 페이지 접근 가능(POST)
- 구매 차트 : 책/비디오 상품의 실시간 구매 차트와 판매량 TOP-5 차트, HIGH-CHART API 사용
- 상품 관리 : 책/비디오 상품 카테고리별 조회, 등록, 수정, 삭제 기능
- 회원 관리 : 회원 정보 검색, 조회, 삭제


## Document
### 1. 유스케이스
![유스케이스](https://user-images.githubusercontent.com/82925724/126890632-9a5044a2-9488-47de-a262-75e68f4e9f3c.gif)

### 2. ERD
![게시판 관련](https://user-images.githubusercontent.com/82925724/126888986-cb32d788-97be-4339-8c41-54276c5bc637.png)
![세미 나머지 부분](https://user-images.githubusercontent.com/82925724/126888989-b143eec5-c0db-40bc-92c9-c5e5b1aa490f.png)

### 3. 요구사항 명세서
![요구사항 명세서](https://user-images.githubusercontent.com/82925724/126890636-32d3485c-bd3c-4464-8b9b-aefee33a6625.gif)

### 4. 화면설계서

### 5. 테이블 정의서
![테이블 정의서](https://user-images.githubusercontent.com/82925724/126890928-dfa80858-535f-4866-a19e-7b259a1630c6.png)
<br>
[테이블 정의서 전체보기](https://github.com/meta1mon/HelpMe-JavJsC/files/6873497/default.docx)

