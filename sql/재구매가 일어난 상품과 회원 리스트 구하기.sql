-- 문제
-- ONLINE_SALE 테이블에서 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 
-- 재구매한 회원 ID와 재구매한 상품 ID를 출력하는 SQL문을 작성해주세요. 
-- 결과는 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 
-- 내림차순 정렬해주세요.

SELECT USER_ID, PRODUCT_ID 
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(PRODUCT_ID) >= 2
ORDER BY USER_ID ASC , PRODUCT_ID DESC;

-- 1. ONLINE_SALE 테이블에서 
-- 2. 동일한 회원이 동일한 상품을 재구매한 데이터를 구하라고 해서 GROUP BY 문으로 
--    USER_ID와 PRODUCT_ID를 그룹화시켜주었고 
-- 3. 그룹화시켜주고 USER가 재구매한 상품들이 2번 이상이 되면 재구매한 걸로 결과
--    테이블에 나왔기 때문에 WHERE조건과 비슷한 GROUP BY문으로 그룹화된 대상을
--    출력에서 제한하는 HAVING절을 사용하여 조건을 주었고
-- 4. 회원 ID를 기준으로 오름차순과 상품 ID를 기준으로 내림차순으로 정렬해 주었다. 