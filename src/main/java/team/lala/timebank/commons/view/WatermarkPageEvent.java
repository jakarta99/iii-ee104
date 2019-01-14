package team.lala.timebank.commons.view;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;


//浮水印設計
public class WatermarkPageEvent extends PdfPageEventHelper {
	Font FONT = new Font(Font.FontFamily.HELVETICA, 52, Font.BOLD, new GrayColor(0.85f));

	@Override
	public void onEndPage(PdfWriter writer, Document document) {
		ColumnText.showTextAligned(writer.getDirectContentUnder(), Element.ALIGN_CENTER
				, new Phrase("TIMEBANK", FONT)
				,297.5f, 421, writer.getPageNumber() % 2 == 1 ? 45 : -45);
								//浮水印斜角的角度--45度或-45度，跟隨頁數變化
		
		
		
	}
	
	//\img\logo.jpg
}
