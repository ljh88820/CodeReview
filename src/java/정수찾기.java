package java;

public class 정수찾기 {
	 public int solution(int[] num_list, int n) {
	        int answer = 0;
	        
	        for(int i = 0 ; i < num_list.length ; i++) {
	        	if(num_list[i] == n) {
                     answer = 1;
	        	}//if
	        }//for
	        return answer;
	    }//soulution
}//end class
