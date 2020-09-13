package ch03;

import java.util.Scanner;

//�����˻� 
public class BinSearch {
	
	static int binSearch(int[]a , int n , int key) {
		
		int pl = 0;			//���۰�	ex 0
		int pr = n-1;		//����(n�� ����� ���� �迭�� 0������ ���������� -1���� ���ش� ex n=8
		
		do {
			int pc = (pl+pr)/2; //�߾ӿ���� �ε���
			
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
		
		System.out.println("��ڼ� : ");
		int num = s.nextInt();
		int[] x = new int[num];
		
		System.out.println("ù��° ��Ҹ� �Է����ּ��� x[0]");
		x[0] = s.nextInt();
		
		for (int i = 1; i < x.length; i++) {
			
			System.out.println("x["+i+"]");
			x[i] = s.nextInt();			
		}
		
		System.out.println("�˻��� �� : ");
		int key = s.nextInt();
		int idx = binSearch(x, num, key);
		
		if(idx == -1) {
			System.out.println("�װ��� �����ϴ�.");
		}
		else
			System.out.println("ã�� ���� x["+idx+"] �Դϴ�.");
		
		
		
		
		
	}
}
