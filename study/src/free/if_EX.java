package free;

import java.util.Scanner;

public class if_EX {
	public static void main(String args[]) {
		Scanner s = new Scanner(System.in);
		
		int a = s.nextInt();
		int b = s.nextInt();
		
		
		if(a > b ) {
			System.out.println(a+"는 "+b+"보다 큽니다.");
		}
		else if(b > a) {
			System.out.println(b+"는 "+a+"보다 큽니다.");
		}
		else
			System.out.println("두수는 같습니다.");
		
		
		
}

	
	
}
