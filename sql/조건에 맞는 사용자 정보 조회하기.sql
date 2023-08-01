-- 문제 
-- USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 중고 거래 게시물을 3건
-- 이상 등록한 사용자의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회하는 SQL문을 작성해주세요. 
-- 이때, 전체 주소는 시, 도로명 주소, 상세 주소가 함께 출력되도록 해주시고, 
-- 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력해주세요. 
-- 결과는 회원 ID를 기준으로 내림차순 정렬해주세요.

-- 처음에 작성하고 오류가 났던 쿼리문
SELECT USER_ID, 
        NICKNAME,
       CITY || ' ' ||STREET_ADDRESS1|| ' ' || STREET_ADDRESS2 AS 전체주소,
       SUBSTR(TLNO,0,3) || '-' ||SUBSTR (TLNO,4,4) || '-' || SUBSTR(TLNO,8,4) AS전화번호
 FROM USED_GOODS_USER
 WHERE USER_ID IN (SELECT USER_ID
                   FROM USED_GOODS_BOARD
                   WHERE WRITER_ID >=3)
                   
-- 먼저 위에 작성된 서브쿼리에서 SELECT 문에 값을 잘 못 적어주었고
-- WHERE 조건에서도 WHERE WRITER_ID >=3 이렇게 조건을 적어주면 값이 제대로 나오지 않았다. 
-- 그 이유는 아마 WRITER_ID >= 3 이 , WRITER_ID 가 무슨 3보다 크다는 조건을 만족하는지 몰라서?인 거 같다 
-- 그래서 아래와 같이 서브쿼리를 다시 작성해줌
SELECT WRITER_ID
FROM USED_GOODS_BOARD
GROUP BY WRITER_ID 
HAVING COUNT(WRITER_ID) >= 3
-- 그랬더니 일단 실행결과는 잘 나온다 

-- 위에 새로 짠 서브쿼리문을 바탕으로 다시 쿼리를 작성해 봄
SELECT USER_ID, 
       NICKNAME,
       CITY || ' ' ||STREET_ADDRESS1|| ' ' || STREET_ADDRESS2 AS 전체주소,
       SUBSTR(TLNO,0,3) || '-' ||SUBSTR (TLNO,4,4) || '-' || SUBSTR(TLNO,8,4) AS전화번호
FROM USED_GOODS_USER
WHERE USER_ID IN (SELECT WRITER_ID
                  FROM USED_GOODS_BOARD
                  GROUP BY WRITER_ID
                   HAVING COUNT(WRITER_ID) >= 3)
ORDER BY USER_ID DESC;