 -- 문제 
 -- CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
 -- 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차 ID 
 -- 리스트를 출력하는 SQL문을 작성해주세요. 
 -- 자동차 ID 리스트는 중복이 없어야 하며, 자동차 ID를 기준으로 내림차순 정렬해주세요.
 
SELECT DISTINCT(A.CAR_ID)
FROM CAR_RENTAL_COMPANY_CAR A JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B 
ON A.CAR_ID = B.CAR_ID
WHERE A.CAR_TYPE ='세단' AND TO_CHAR(B.START_DATE,'MM')='10'
ORDER BY A.CAR_ID DESC;

-- 1. CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY에서 
--    공통으로 사용되는 CAR_ID 가 있어서 두 테이블간에 조인을 시켜준다. 
-- 2. 그리고 WHERE 조건문에서 CAR_TYPE 이 '세단'인거와 START_DATE가 10월
--    인 데이터가 부합하면
-- 3. SELECT절에서 CAR_RENTAL_COMPANY_CAR 테이블에서 CAR_ID 열이 선택되고, 
--    DISTINCT 키워드를 사용하면 결과 집합에서 중복된 항목이 제거된다. 
-- 4. 마지막으로 ORDER BY 를 사용해서 CAR_ID열을 기준으로 결과 차량 ID가 
--    내림차순으로 정렬되어 가장 높은 차량 ID가 결과에서 먼저 출력된다. 