package team.lala.timebank.commons.view;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfViewForChart extends AbstractITextPdfView {

	

	 @Override
	 protected void buildPdfDocument(Map<String, Object> pdfModel, Document doc,
	            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	            throws Exception {
	        //取得Controller塞進來的資料(htmlStr)
		 	String htmlStr = (String) pdfModel.get("htmlStr");
//		 	List<String> headers = (List<String>) pdfModel.get("headers");
//			List<List<String>> results = (List<List<String>>) pdfModel.get("results");

			//放標題
	        doc.add(new Paragraph("捐款統計表"));
	         
	        try {
//			    String k = "<html>"+ htmlStr +"</html>";
			    String k = "<html><body> This is my Project </body></html>";

			    doc.open();
			    HTMLWorker htmlWorker = new HTMLWorker(doc);
			    htmlWorker.parse(new StringReader(k));
			    doc.close();

			} catch (Exception e) {
			    e.printStackTrace();
			}
	        
	        
	        
	        //塞入資料
	        //如有中文，必須指明中文字體	        
	        BaseFont bfChinese = BaseFont.createFont("C:\\WINDOWS\\Fonts\\KAIU.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	        

	        
	        //浮水印
	        writer.setPageEvent(new WatermarkPageEvent());
	        
	        
	        
	        //把表格寫入檔案中
//	        doc.add(table);
	        
	         
	    }
	
	 
}
