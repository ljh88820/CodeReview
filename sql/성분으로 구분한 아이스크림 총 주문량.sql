-- 문제
-- 상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 
-- 총주문량을 총주문량이 작은 순서대로 조회하는 SQL 문을 작성해주세요. 
-- 이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.

SELECT I.INGREDIENT_TYPE , SUM(F.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF F JOIN ICECREAM_INFO I ON(F.FLAVOR = I.FLAVOR)
GROUP BY I.INGREDIENT_TYPE;

-- 1. FIRST_HALF테이블과 ICECREAM_INFO테이블에서
-- 2. SELECT문에 출력되어야 할 컬럼들이  ICECREAM_INFO테이블에 있는 
--    INGREDIENT_TYPE과 FIRST_HALF테이블에 있는 TOTAL_ORDER 이기 때문에 
-- 3. FROM문에서 두 테이블을 조인시켜줘야 한다. 
-- 4. 문제에서 상반기 동안 각 아이스크림 성분 타입에 대한 아이스크림 총주문량을 
--    조회하라고 했기 때문에 먼저 INGREDIENT_TYPE에 아이스크림 성분 타입에 대해 GROUP BY 해주고
-- 5. 마지막으로 SELECT 문에서 SUM(F.TOTAL_ORDER) AS TOTAL_ORDER 해주면 데이터가 잘 출력된다. 

