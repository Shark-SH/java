package ch03;

import java.util.Scanner;

//이진검색 
public class BinSearch {
	
	static int binSearch(int[]a , int n , int key) {
		
		int pl = 0;			//시작값	ex 0
		int pr = n-1;		//끝값(n은 요소의 갯수 배열은 0번부터 시작임으로 -1값을 해준다 ex n=8
		
		do {
			int pc = (pl+pr)/2; //중앙요소의 인덱스
			
			if(a[pc]==key) {
				return pc;
			}
			else if(a[pc] < key) {
				pl=pc+1;
			}
			else {
				pr= pc - 1;
			}
		}while(pl <= pr);
		return -1;
	}
	public static void main(String args[]) {
		Scanner s = new Scanner(System.in);
		
		System.out.println("요솟수 : ");
		int num = s.nextInt();
		int[] x = new int[num];
		
		System.out.println("첫번째 요소를 입력해주세요 x[0]");
		x[0] = s.nextInt();
		
		for (int i = 1; i < x.length; i++) {
			
			System.out.println("x["+i+"]");
			x[i] = s.nextInt();			
		}
		
		System.out.println("검색할 값 : ");
		int key = s.nextInt();
		int idx = binSearch(x, num, key);
		
		if(idx == -1) {
			System.out.println("그값은 없습니다.");
		}
		else
			System.out.println("찾는 값은 x["+idx+"] 입니다.");
		
		
		
		
		
	}
}
