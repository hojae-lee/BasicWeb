
public class Ex {
	public static void main(String[] args) {
		String str="ABCDEF-GHIJKL";
		
		int beginIndex = str.indexOf("-") +1 ;
		System.out.println(beginIndex);
		String strIndex = str.substring(7,str.length());
		System.out.println(str.length());
		System.out.println(strIndex);
		
	}
}
