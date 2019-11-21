package util;

import java.text.NumberFormat;

public class FormatUtil {

	//숫자형태의 문자열을 전달받아서 세자리마다 콤마를 찍은후 반환
	public static String commaNumber (String moneyStr) {
		
		int money = Integer.parseInt(moneyStr);
		NumberFormat nf = NumberFormat.getInstance();
		String commaMoney = nf.format(money);
		
		return commaMoney;
	}
	
}
