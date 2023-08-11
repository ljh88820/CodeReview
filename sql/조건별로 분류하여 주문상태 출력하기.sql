
-- 문제 
-- FOOD_ORDER 테이블에서 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 
-- 조회하는 SQL문을 작성해주세요. 출고여부는 5월 1일까지 출고완료로 이 후 날짜는 
-- 출고 대기로 미정이면 출고미정으로 출력해주시고, 결과는 주문 ID를 기준으로 오름차순 정렬해주세요.

-- 오류난 쿼리문
SELECT ORDER_ID,
       PRODUCT_ID,
       OUT_DATE, 
       CASE WHEN TO_CHAR(OUT_DATE,'MM-DD')='05-01'THEN '출고대기'
            WHEN NULL THEN '출고미정'
            ELSE '출고완료' END
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;

-- 다시 작성한 쿼리문
SELECT ORDER_ID,
       PRODUCT_ID,
       TO_CHAR(OUT_DATE,'YYYY-MM-DD') AS OUT_DATE, 
       CASE WHEN TO_CHAR(OUT_DATE,'YYYY-MM-DD' )<='2022-05-01'  THEN '출고완료'
            WHEN TO_CHAR(OUT_DATE,'YYYY-MM-DD' ) > '2022-05-01' THEN '출고대기'
            ELSE '출고미정' 
            END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;

-- FROM절에서 식품공장의 주문정보를 불러오고
-- SELECT 절에서 주문 ID, 제품 ID, 출고일자인데
-- 출고일이 05-01 이전이면 출고완료이고, 출고일이
-- 05-01 이후면은 출고대기 두개 다 속하지 않으면
-- 출고미정으로 출고여부 설정할 수 있게 해주고 
-- 마지막으로 주문ID 기준으로 오름차순으로 정렬.