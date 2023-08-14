-- 문제 
-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
--이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.

SELECT ANIMAL_ID,NAME
FROM (SELECT A.ANIMAL_ID,A.NAME
      FROM ANIMAL_INS A JOIN ANIMAL_OUTS B
      ON A.ANIMAL_ID = B.ANIMAL_ID
      ORDER BY B.DATETIME - A.DATETIME DESC)
WHERE ROWNUM <= 2

-- 처음에 서브쿼리 밖에 있는 SELECT문에다가 SELECT A.ANIMAL_ID,A.NAME
-- 이렇게 작성했더니 오류남 , 아마 이미 서브쿼리에서 데이터에 맞게 
-- 출력이 됬는데 WHERE 조건문에서 그에 맞는 데이터가 출력되라고 해서 그런거인듯 싶다. 
