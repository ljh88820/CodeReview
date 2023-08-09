-- 문제 
--  CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 2022년 10월 16일에 대여 중인 
--  자동차인 경우 '대여중' 이라고 표시하고, 대여 중이지 않은 자동차인 경우 
--  '대여 가능'을 표시하는 컬럼(컬럼명: AVAILABILITY)을 추가하여 자동차 ID와 
--  AVAILABILITY 리스트를 출력하는 SQL문을 작성해주세요. 
--  이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시해주시고 
--  결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.

-- 처음에 서브쿼리로 코드를 작성 했는데 하다보니 '대여중' 아니면 '대여 가능'을 
-- 표시하는 컬럼을 출력할 수 없어서 아래 코드로 작성하였다. 
-- 근데 작성한 코드에서 계속 오류남 알고보니 START_DATE와 END_DATE에서
-- 날짜 값을 제대로 포맷을 안해줘소 오류가 났던거다. 
SELECT CAR_ID, 
MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN "대여중" ELSE "대여 가능" END) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;

-- 수정한 코드 
SELECT CAR_ID, 
MAX(CASE WHEN '2022-10-16' BETWEEN TO_CHAR(START_DATE, 'YYYY-MM-DD') AND TO_CHAR(END_DATE, 'YYYY-MM-DD') THEN '대여중'ELSE '대여 가능' END) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;

-- 1. CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
-- 2. 자동차 아이디로 묶고 
-- 3. SELECT 문에서 자동차 아이디, 자동차 대여 가능 여부를 
--    작성하는데 2022-10-16 인 날짜가 대여 시작일과 대여 
--    종료일 사이에 있다면 '대여중' 아니라면 '대여 가능'
--    이라고 조회되게 하고 
-- 4. 조회가 되었다면 ORDER BY 절로 자동차 아이디 기준 내림차순으로 정렬
