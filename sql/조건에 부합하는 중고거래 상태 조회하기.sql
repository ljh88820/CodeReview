--문제
--USED_GOODS_BOARD 테이블에서 2022년 10월 5일에 등록된 중고거래 게시물의 게시글 ID, 작성자 ID, 
--게시글 제목, 가격, 거래상태를 조회하는 SQL문을 작성해주세요. 거래상태가 SALE 이면 판매중, RESERVED이면 예약중, 
--DONE이면 거래완료 분류하여 출력해주시고, 결과는 게시글 ID를 기준으로 내림차순 정렬해주세요.

--CASE문 방식
SELECT BOARD_ID, 
       WRITER_ID, 
       TITLE, 
       PRICE, 
       CASE 
             WHEN STATUS='SALE' THEN '판매중'
             WHEN STATUS='RESERVED' THEN'예약중'
             WHEN STATUS='DONE' THEN'거래완료' 
             END AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE  = TO_DATE('2022-10-05','YYYY-MM-DD')
ORDER BY BOARD_ID DESC;

--1. USED_GOODS_BOARD 테이블에서 
--2. 2022년 10월 5일과 동일한 데이터를 출력하게 해야 하니까 WHERE 문으로 조건을 주었다.
--3. 결과는 게시글 ID 기준으로 내림차순 정렬하라고 해서 ORDER BY BOARD_ID DESC 이렇게 정렬해주었고 
--4. SELECT 문에서 요구한 데이터를 출력해야하는데 거래상태가 SALE 이면 판매중, RESERVED이면 예약중, 
--   DONE이면 거래완료로 분류하여 출력 해야한다. 그러면 먼저 STATUS 컬럼에서 CASE 문을 사용하여 조건을 
--   적용시는 방식으로 데이터를 출력되게 하였다. 


-- DECODE방식
SELECT BOARD_ID, 
       WRITER_ID, 
       TITLE, 
       PRICE, 
       DECODE(STATUS,
              'SALE' , '판매중',
              'RESERVED' ,'예약중', 
              'DONE' , '거래완료') AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE  = TO_DATE('2022-10-05','YYYY-MM-DD')
ORDER BY BOARD_ID DESC;
