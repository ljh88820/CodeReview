-- 문제 
-- 2022년 1월의 카테고리 별 도서 판매량을 합산하고, 
-- 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력하는 SQL문을 작성해주세요.
-- 결과는 카테고리명을 기준으로 오름차순 정렬해주세요.

SELECT A.CATEGORY , SUM(B.SALES) AS TOTAL_SALES
FROM BOOK A INNER JOIN BOOK_SALES B
ON A.BOOK_ID = B.BOOK_ID
WHERE TO_CHAR(SALES_DATE,'YYYY-MM')='2022-01'
GROUP BY CATEGORY
ORDER BY CATEGORY ASC;

-- 1. BOOK 테이블과 BOOK _SALES 테이블을 INNER JOIN 하여 BOOK_ID를 기준으로 두 테이블을 결합한다. 
--    그래서 BOOK_ID 가 양쪽 테이블에 모두 존재하는 행만 결과로 받는다.
-- 2. WHERE 절에는 TO_CHAR(SALES_DATE,'YYYY-MM') 함수를 사용하여 2022-01 날짜와 
--    같은게 데이터가 있으면 출력되게 한다.
-- 3. 그래서 2022-01에 일어난 판매량을 총 합산하고 ,
--    GROUP BY절을 사용하여 CATEGORY 기준으로 그룹화하고 ,ORDER BY 로 오름차순하여 정렬한다. 