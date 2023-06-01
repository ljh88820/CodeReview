-- 문제 
-- 보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 
-- 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 
-- 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
-- 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.

SELECT ANIMAL_ID ,
       NAME , 
CASE WHEN SEX_UPON_INTAKE LIKE '%Neutered%' THEN 'O'
     WHEN SEX_UPON_INTAKE LIKE '%Spayed%' THEN 'O'
     ELSE 'X' 
     END AS "중성화"
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

-- 1.ANIMAL_INS 테이블에서
-- 2.SELECT문에서 출력할 데이터를 적어줄건데 문제에서 말한 
--   동물의 아이디와 이름, 중성화 여부로 조회하라고 하였다. 
--   그런데 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 
--   'Neutered' 또는 'Spayed'라는 단어가 들어가는데 
--   이때 중성화가 되어있다면 'O' , 아니면 'X'라고 표시한다. 
--   그래서 위 조건을 판단해 주는 CASE문인 조건문을 사용하여 
--   중성화된 데이터를 판단할 수 있게 해주었다. 
-- 3.마지막으로 문제에서  아이디 순으로 조회하라고 하여 ORDER BY문을 사용해 주었다. 