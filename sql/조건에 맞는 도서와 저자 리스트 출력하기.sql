-- 문제 
-- '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 
-- 리스트를 출력하는 SQL문을 작성해주세요. 결과는 출판일을 기준으로 오름차순 정렬해주세요.


SELECT BOOK_ID, AUTHOR_NAME,TO_CHAR(PUBLISHED_DATE ,'YYYY-MM-DD')AS PUBLISHED_DATE
FROM BOOK B JOIN AUTHOR A ON(B.AUTHOR_ID = A.AUTHOR_ID)
WHERE CATEGORY ='경제'
ORDER BY PUBLISHED_DATE ASC;

-- 1. 출력 되어야 할 컬럼이 BOOK _ID, AUTHOR_NAME , PUBLISHED_DATE 이기 
--    때문에 BOOK 테이블과 AUTHOR 테이블 두 테이블들을 조인 시켜야 한다. 
--    그래서 가장 범용성 있는 JOIN ~ ON 키워드를 사용한 조인 방식으로 기존 
--    WHERE절에 있는 조인 조건식을 ON 키워드 옆에 작성할 수 있게하는 JOIN ~ ON 조인 
--    방법을 사용
-- 2. WEHRE 문으로 CATEGORY = "경제" 조건을 주었고
-- 3. ORDER BY 문으로 출판일을 오름차순 조건으로 주었다
