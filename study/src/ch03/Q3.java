package ch03;

import java.util.Scanner;

public class Q3 {
	static int method(int[] a , int n , int key, int[] idx) {
		int i = 0;
		int j = 0;
		while(true){
			if(i == n ) {
				break;
			}
			else if(a[i] == key) {
				System.out.println("a[i]�� ����  > "+a[i]);
				idx[j] = i;
				j++; 
			}
			i++;
		}
		int result = idx.length;
		System.out.println(idx.length +"���������迭�� ���� ��");
		return result;
	}
	public static void main(String args[]) {
		Scanner s = new Scanner(System.in);
		System.out.println("��ڼ��� �Է��ϼ���.");
		int num = s.nextInt();
		int[] x = new int[num];
		int y = 0;
		
		for(int i = 0; i < x.length ; i++) {
			System.out.println("x["+i+"]��°�� ���� �Է��ϼ���.");
			x[i] = s.nextInt();
	
		}
		System.out.println("ã�� ���� �Է��ϼ���");
		int key = s.nextInt();
		for (int i = 0; i < x.length; i++) {
			if(x[i]==key) {
				y++;
			}
		}
		
		
		int[] idx = new int[y];
		for (int i = 0; i < idx.length; i++) {
			idx[i] = 0;
		}
		int answer = method(x,num,key,idx); 
		System.out.println(answer);
	}
}
