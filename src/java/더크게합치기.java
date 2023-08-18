package java;

public class 더크게합치기 {

	 public int solution(int a, int b) {
	        int answer = Integer.parseInt(Integer.toString(a)+Integer.toString(b));
	        int answer1 = Integer.parseInt(Integer.toString(b)+Integer.toString(a));
	        
	        if(answer > answer1) {
	        	return answer;
	        }else {
	        	return answer1;
	        }//if-else
	    
	    }//solution
}//end class
