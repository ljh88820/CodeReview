-- 문제
-- 동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
-- 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.

-- 처음에 작성하고 오류가 났던 쿼리문
SELECT ANIMAL_ID , NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN (LUCY, ELLA)
ORDER BY ANIMAL_ID ASC;

-- 오류 해결한 쿼리문
SELECT ANIMAL_ID , NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY ANIMAL_ID ASC;

-- 문제점: 문제에서 보여진 테이블에 LUCY, ELLA 만 존재해서 처음에 
--         작성한 쿼리문 처럼 조건을 주면 데이터가 출력될 줄 알았다.
--         근데 문제를 잘 읽어 보니 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
--         동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 거였고, 
--         이름이 문자열로 되어있는데 홀따움표를 쓰지 않아서 생긴 오류였던 거다. 

-- 풀이 : 
-- 1.ANIMAL_INS 테이블에서
-- 2.주어진 문제에서 말한 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty 인 
--   동물이라는 조건을 말해 주어서  WHERE문을 사용하고 컬럼명 IN() 함수를 사용하여 이 와 
--   같은 이름들이 있으면 데이터를 출력할 수 있는 조건을 걸어두었고
-- 3.테이블에 출력될 데이터들을  ANIMAL_ID , NAME, SEX_UPON_INTAKE로 나오게 해주었다
-- 4.마지막으로 결과는 아이디 순으로 조회하라고 해서 오름차순으로 정렬해 주었다
