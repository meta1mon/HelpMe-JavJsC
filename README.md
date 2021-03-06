# HelpMe-JavJsC
## [시연 영상 바로 보기](https://youtu.be/4LbEk86pi1w) 
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
![사용기술](https://user-images.githubusercontent.com/80940458/127007793-921113f2-1ce4-48a3-a2c4-ae56cf748e6f.PNG)




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
|API| CKeditor5, Highcharts, FullCalendar

---
## 프로젝트 기능구현
- 김연준
  - 게시판 - 다중 파일 첨부 기능, 사진 첨부 기능 / 게시글&댓글 조회, 작성, 수정, 삭제 UI 설계 /  자사 소개 페이지
- 이승연
  - 상품 등록 / 상품 수정 / 상품 삭제 /  장바구니 / 장바구니 수정 / 장바구니 삭제 / 구매하기 / 구매완료 / 실시간 구매량 차트 /  구매량 top5 차트
- 정재훈
  - 프로젝트 총괄 / 회원가입 / 로그인 / 비밀번호찾기 / 게시판-게시글&댓글 조회, 작성, 수정, 삭제, 좋아요 기능 / 게시글 목록, 조회 기능 / 전체적인 MVC 2 모델 통일 및 기능 도움
- 제승하
  - 마이페이지 전체 기능 및 디자인 / 쇼핑몰 사이트 전반적인 프론트 / 관리자 페이지 / 메인 페이지
- 하도경
  - 마이페이지 캘린더 일정 조회 / 일정 등록 / 일정 삭제 / 일정 색상 지정 / 일정 수정(드래그 앤 드롭, 리사이즈) / 공채 캘린더 일정 조회 / 일정 등록(관리자만) / 일정 삭제(관리자만)

---
## 주요기능
**1. 메인페이지 및 자사소개**<br>
---
<left><img src="https://user-images.githubusercontent.com/79201561/126900838-1b291573-2791-4e00-a90a-6825e0a24919.gif"  width="700" height="400" /></left>
- 뉴스 플로팅 메뉴 제공(Cryptonews API 사용)
- 표, 차트로 주요 코인 실시간 조회(bithumb, upbit, Trading View API 사용)
- BTMI, BTAI 지수 조회(Highcharts API 사용)
- 커뮤니티 인기 게시글 조회

**2. 회원가입**<br>
---
<left><img src="https://user-images.githubusercontent.com/79201561/126900943-80404e85-ae88-40ed-8a6a-3d4dcdfdb11e.gif" width="700" height="400" /></left>
<left><img src="https://user-images.githubusercontent.com/79201561/126902445-5b5f3fb8-7334-42e5-9807-bd6deb204550.gif" width="700" height="400" /></left>
- 정규식 활용
  - 필수 항목 입력 여부
  - 아이디, 닉네임, 비밀번호, 전화번호, 이메일 형식 유효성 검사
- 개인 정보 입력
  - 아이디, 닉네임 중복검사 기능
  - 닉네임에 '관리자가 포함되어 있을 경우 가입 불가'
  - 비밀번호, 비밀번호 확인 일치 여부 확인 기능
  - 비밀번호 질문 및 답변 등록
  - 다음 주소 API 활용
  - 체크박스: 필수 체크박스 선택 여부 확인 기능 / 선택 사항 선택 시 이메일 입력 여부 확인 기능

**3. 로그인**<br>
---
<left><img src="https://user-images.githubusercontent.com/79201561/126900990-3e5b47f5-cca2-495b-832e-dda35d0a29f0.gif" width="700" height="400" /></left>
- 아이디, 비밀번호 형식 유효성 검사


**4. 비밀번호 찾기**<br>
---
<left><img src="https://user-images.githubusercontent.com/79201561/126901004-102bfd25-7239-4320-be7e-968e3e74e315.gif" width="700" height="400" /></left>
- 비밀번호 찾기 기능: 회원가입 시 입력한 비밀번호 질문과 답변의 일치 여부를 확인 후 해당 아이디의 비밀번호 제공
- 비밀번호 보기: 보호되어 보이지 않는 비밀번호의 입력 내용을 볼 수 있는 기능


**5. 마이 페이지**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923903/126899270-2bada07c-acf9-4e7c-aba9-535f8bdb1657.gif" width="700" height="400" /></left>
- 비밀번호 일치 여부 확인 후, 마이 페이지로 이동
- 개인 일정 관리 기능
  - 조회, 등록, 일정 색상 지정, 삭제, 드래그앤드롭, 리사이즈
- 개인 정보 확인
  - 아이디, 닉네임, 비밀번호 질문, 비밀번호 답변, 주소, 전화번호, 소식 수신 여부 
- 개인 정보 수정 기능
  - 닉네임, 비밀번호, 비밀번호 확인, 비밀번호 질문, 비밀번호 답변, 주소, 전화번호, 소식 수신 여부
- 작성한 게시글 및 댓글 게시판별로 제공, 더보기 기능
  - 작성한 게시글 및 댓글의 개수가 3개 이상 시, 더보기로 전체 목록 확인 가능
- 구매한 영상 및 도서 확인 기능
- 회원 탈퇴 기능

**6. 게시판**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923946/126897384-38432a94-0dd1-4e41-b086-187ed0bbd3cc.gif"  width="700" height="400" /></left>
- CK Editor API 사용
- 3가지 각각 다른 성격의 게시판 존재 (질문 게시판, 스터디/모임 게시판, 책/영상 리뷰 게시판)
- 게시글 (조회, 등록, 수정, 삭제, 좋아요), 댓글(조회, 등록, 수정, 삭제, 좋아요) 기능
- 조회수 기능
- 게시글 목록 페이징 처리 기능
- 카테고리별(글제목, 작성자, 글내용) 게시글 검색 기능
- 파일 업로드 기능(cos 라이브러리 사용)


**7. 쇼핑몰**<br>
---
<left><img src="https://user-images.githubusercontent.com/80940458/126895483-bc2d7393-876b-45b2-8ddb-4adbac07dac4.gif"  width="700" height="400" /></left>
- 상품 조회
  - 상품 목록 조회 : 상품 리스트 조회
  - 상품 상세 조회 : 정보 상세 조회 및 장바구니에 담을 상품의 수량 선택 기능
- 장바구니
  - 장바구니 담기 : 마음에 드는 상품 장바구니 담기
  - 장바구니 수량 수정 / 삭제 : 장바구니에 담긴 상품 수량 수정 및 삭제 기능
- 구매하기
  - 배송지 입력 : 가입 시 입력한 주문자 정보 불러오기 기능 / 주소 검색 API로 새로운 배송지 등록 기능, 다음 주소검색 API사용 
  - 구매하기 : 장바구니에 담긴 상품 구매 
  - 구매완료 : 구매완료된 상품 목록 조회
  - 장바구니 비우기 : 구매 완료된 상품 장바구니에서 삭제 


**8. 공채 캘린더**<br>
---
<left><img src="https://user-images.githubusercontent.com/79201561/126900893-db334d32-2d1b-4d13-bc52-e5d29789581b.gif" width="700" height="400" /></left>
- 일반 사용자 / 비회원
  - '공채 일정 추가' 버튼 생성 X
  - 등록된 일정 조회 / 일정 상세 내용 조회 기능
  
<left><img src="https://user-images.githubusercontent.com/79201561/126901805-b2942884-14d3-4b5d-b885-ad9d4e3e6f44.gif" width="700" height="400" /></left>
- 관리자
  - 로그인한 사용자의 닉네임이 '관리자'인 경우에만 '공채 일정 추가' 버튼 활성화
  - 공채 일정 관리 기능: 일정 등록 / 상세 내용 확인 / 일정 삭제 기능 


**9. 관리자 페이지**<br>
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
![세미 나머지 부분](https://user-images.githubusercontent.com/80940458/126898825-2cfc5833-07a6-4dd5-8730-ea536929eb1c.png)


### 3. 요구사항 명세서
![요구사항 명세서](https://user-images.githubusercontent.com/82925724/126890636-32d3485c-bd3c-4464-8b9b-aefee33a6625.gif)

### 4. 화면설계서
![슬라이드3](https://user-images.githubusercontent.com/82923946/126899074-f19b3809-baa8-4c97-98f5-322c83f4d5fa.PNG)
![슬라이드6](https://user-images.githubusercontent.com/82923946/126899080-9dacc0e9-9fec-45e0-8f2d-70193c34eb45.PNG)
[화면설계서.zip](https://github.com/meta1mon/HelpMe-JavJsC/files/6874082/default.zip)

### 5. 테이블 정의서
![테이블 정의서](https://user-images.githubusercontent.com/82925724/126890928-dfa80858-535f-4866-a19e-7b259a1630c6.png)
<br>
[테이블 정의서 전체보기](https://github.com/meta1mon/HelpMe-JavJsC/files/6873497/default.docx)

