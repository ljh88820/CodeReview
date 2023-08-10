-- 문제
-- REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류,
-- ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.

SELECT FOOD_TYPE, REST_ID , REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE,FAVORITES)IN(
           SELECT FOOD_TYPE, MAX(FAVORITES)
           FROM REST_INFO
           GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;

-- 음식 종류와 최대 즐겨찾기가 많은 식당을 뽑아야 하기 때문에
-- 서브 쿼리를 사용하여 음식종류와, 즐겨찾기수가 최대값인 식당의
-- SELECT 하고 WHERE절에 조건에 해당하는 데이터를 추출하여
-- 음식종류와 식당ID, 식당이름, 즐겨찾기 수를 나오게 한다. 
-- 그리고 마지막으로 해당 데이터를 음식종류 내림차순으로 정렬시킨다. 