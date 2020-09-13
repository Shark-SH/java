package stack;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class StackEX {
	public static void main(String args[]) {
		//Last in First out
		Stack<String> st = new Stack<String>();
		Queue<String> qu = new LinkedList<String>();
		
		st.push("0");
		st.push("1");
		st.push("2");
		st.push("3");
		
		//first in first out
		qu.offer("0");
		qu.offer("1");
		qu.offer("2");
		qu.offer("3");
		
		System.out.println("---------------Stack-------------LIFO");
		while(!st.isEmpty()) {
			System.out.println(st.pop());
		}
		
		System.out.println("---------------queue-------------FIFO");
		while(!qu.isEmpty()) {
			System.out.println(qu.poll());
		}
		
		
	}
}
