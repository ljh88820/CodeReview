package java;
/* 문제 :
  정수 start와 end가 주어질 때, start부터 end까지의 숫자를 차례로 담은 리스트를 
  return하도록 solution 함수를 완성해주세요.
  
  입출력 예 설명:
  3부터 10까지의 숫자들을 담은 리스트 [3, 4, 5, 6, 7, 8, 9, 10]를 return합니다.
 */
public class 카운트업 {
       public int[] solution(int start, int end) {
	        int size = end - start + 1;
	        int[] answer = new int [size];
	        for(int i = 0 ; i < size; i++){
	            answer[i] = start++;
	        }
	        return answer;
	    }
}

/* int size 에는 배열에 들어갈 수 있는 크기를 설정해 주기 위해
 * int size변수를 선언하고 end-start+1 값을 
 * answer 배열로 만들어 배열 크기를 만들어 준다. 
 * 다음 for 반복문으로 각 반복마다 answer의 각 요소에 1씩 증가하는 start값을 할당했다.
 */
