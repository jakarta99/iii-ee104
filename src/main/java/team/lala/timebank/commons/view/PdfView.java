package team.lala.timebank.commons.view;

import java.io.IOException;
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
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfView extends AbstractITextPdfView {

	

	 @Override
	 protected void buildPdfDocument(Map<String, Object> pdfModel, Document doc,
	            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
	            throws Exception {
	        //取得Controller塞進來的資料(sheetname、表頭、資料內容)
		 	String title = (String) pdfModel.get("title");
		 	List<String> headers = (List<String>) pdfModel.get("headers");
			List<List<String>> results = (List<List<String>>) pdfModel.get("results");

			//放標題
	        doc.add(new Paragraph(title));
	         
	        //在PDF中創造一個table，並設置欄位數量
	        PdfPTable table = new PdfPTable(headers.size());
	        table.setWidthPercentage(100.0f);
//	        table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f}); //
	        table.setSpacingBefore(10);
	         
	        // 設計表頭字體顏色
	        Font font = FontFactory.getFont(FontFactory.HELVETICA);
	        font.setColor(BaseColor.WHITE);
	         
	        // 設計表頭底色
	        PdfPCell cell = new PdfPCell();
	        cell.setBackgroundColor(BaseColor.GRAY);
	        cell.setPadding(headers.size());
	         
	        // 塞入表頭資料
	        for(String header : headers) {
	        	cell.setPhrase(new Phrase(header, font)); //指定塞入資料的樣式
		        table.addCell(cell);
	        }
	        
	        
	        //塞入資料
	        //如有中文，必須指明中文字體	        
	        BaseFont bfChinese = BaseFont.createFont("C:\\WINDOWS\\Fonts\\KAIU.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	        
	        Font chineseFont = new Font(bfChinese, 12, Font.NORMAL ); 
	        PdfPCell contentCell = new PdfPCell();
	        for (List<String> result : results) {
				for (String value : result) {
					contentCell.setPhrase(new Phrase(value, chineseFont));
					table.addCell(contentCell); 
				}
			}
	        
	        //浮水印
	        writer.setPageEvent(new WatermarkPageEvent());
	        
	        
	        
	        //把表格寫入檔案中
	        doc.add(table);
	        
	         
	    }
	
	 	
	 public void addWatermark(PdfStamper pdfStamper, String waterMarkName) {
			PdfContentByte content = null;
			BaseFont base = null;
			Rectangle pageRect = null;
			PdfGState gs = new PdfGState();
			try {
				// 设置字体
				base = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			} catch (DocumentException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				if (base == null || pdfStamper == null) {
					return;
				}
				// 设置透明度为0.4
				gs.setFillOpacity(0.4f);
				gs.setStrokeOpacity(0.4f);
				int toPage = pdfStamper.getReader().getNumberOfPages();
				for (int i = 1; i <= toPage; i++) {
					pageRect = pdfStamper.getReader().getPageSizeWithRotation(i);
					// 计算水印X,Y坐标
					float x = pageRect.getWidth() / 2;
					float y = pageRect.getHeight() / 2;
					// 获得PDF最顶层
					content = pdfStamper.getOverContent(i);
					content.saveState();
					// set Transparency
					content.setGState(gs);
					content.beginText();
					content.setColorFill(BaseColor.GRAY);
					content.setFontAndSize(base, 60);
					// 水印文字成45度角倾斜
					content.showTextAligned(Element.ALIGN_CENTER, waterMarkName, x, y, 45);
					content.endText();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				content = null;
				base = null;
				pageRect = null;
			}
		}
	 
}
