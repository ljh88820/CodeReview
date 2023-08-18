-- 문제 
-- 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
-- 보호소에 들어올 당시에는 중성화 되지 않았지만, 
-- 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 
-- 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.

-- 오류난 커리 문
SELECT B.ANIMAL_ID, B.ANIMAL_TYPE, B.NAME
FROM ANIMAL_INS A INNER JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.SEX_UPON_INTAKE LIKE 'Intact%' 
AND B.SEX_UPON_OUTCOME LIKE 'Spayed%'
ORDER BY B.ANIMAL_ID ASC;
-- 오류 났던 이유는 들어올 당시에 중성화 되지 않은 동물을 찾아야 하고 
-- 나갈 당시에는 중성화된 동물의 아이디를 찾는건데, 위에 처럼 작성하게 되면
-- A.SEX_UPON_INTAKE에서 중성화된 동물도 있으니까 이미 중성화된 동물은 
-- 나갈때도 중성화된 동물이 되어버려서 조건에 맞지 않으니까 오류가 나온거다.  

-- 다시 수정한 쿼리 문
SELECT B.ANIMAL_ID, B.ANIMAL_TYPE, B.NAME
FROM ANIMAL_INS A INNER JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.SEX_UPON_INTAKE LIKE 'Intact%' 
AND B.SEX_UPON_OUTCOME NOT LIKE 'Intact%'
ORDER BY B.ANIMAL_ID ASC;


