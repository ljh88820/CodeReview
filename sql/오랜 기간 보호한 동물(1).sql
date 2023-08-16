 -- 문제 
 -- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 
 -- 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
 -- 이때 결과는 보호 시작일 순으로 조회해야 합니다.
 
SELECT *
FROM (SELECT A.NAME, A.DATETIME
      FROM ANIMAL_INS A LEFT JOIN ANIMAL_OUTS B
      ON A.ANIMAL_ID = B.ANIMAL_ID
      WHERE B.ANIMAL_ID IS NULL
      ORDER BY A.DATETIME) 
WHERE ROWNUM <= 3      

-- 아직 입양을 못 간 동물 데이터를 출력시켜야 하는데 
-- ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블이여서
-- ANIMAL_INS 테이블과 ANIMAL_OUTS 테이블을 LEFT JOIN을 한다. 
-- WHERE B.ANIMAL_ID IS NULL 조건은 조인된 결과에서 ANIMAL_OUTS 테이블의 
-- 레코드가 없는 경우를 필터링한다. 즉, ANIMAL_INS테이블에 동물 중에서 ANIMAL_OUTS 기록이 없는 동물들을 찾는거다.
-- 그런다음 SELECT 절로 이름과 보호 시작일 데이터를 출력시키고 
-- ORDER BY절로 보호 시작일 순을 오름차순으로 정렬 시키고 
-- 마지막으로 조건에서 정렬된 결과에서 상위 3개의 레코드만을 선택한다.
