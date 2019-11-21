package util;

public class PagingUtil {

	public static String pagingImg(int totalRecordCount, int pageSize, int blockPage,int nowPage, String page) {
		
		String pagingStr = "";
		int totalPage = (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage) +1;
		
		if(intTemp != 1) {
			pagingStr += ""
					+"<a href='"+page+"nowPage=1>"
					+"<img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += ""
					+ "<a href='"+page+"nowPage="+
												(intTemp-blockPage)+"'>"
					+ "<img src ='../images/paging2.gif'></a>";
		}
		
		int blockCount =1;
		while(blockCount<=blockPage && intTemp<= totalPage) {
			if(intTemp == nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a>&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+page+"nowPage="+
											intTemp+"'>"
				+ "<img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+page+"nowPage="+
											totalPage+"'>"
				+ "<img src='../images/paging4.gif'></a>";
		}

		return pagingStr;
		
	}
	
}
