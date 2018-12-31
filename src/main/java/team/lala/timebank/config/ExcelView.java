package team.lala.timebank.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

public class ExcelView extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	public void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) {
		// VARIABLES REQUIRED IN MODEL
		String sheetName = (String) model.get("sheetname");
		List<String> headers = (List<String>) model.get("headers");
		List<List<String>> results = (List<List<String>>) model.get("results");
		
			
		// BUILD DOC
		Sheet sheet = workbook.createSheet(sheetName);
		sheet.setDefaultColumnWidth((short) 12);
		int currentRow = 0;//起始row
		short currentColumn = 0;//起始column
		// CREATE STYLE FOR HEADER
			//CellStyle headerStyle = workbook.createCellStyle();
			//Font headerFont = workbook.createFont();
			//headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			//headerStyle.setFont(headerFont);
		// POPULATE HEADER COLUMNS
		Row headerRow = sheet.createRow(currentRow);
		for (String header : headers) {
			Cell cell = headerRow.createCell(currentColumn);
			//cell.setCellStyle(headerStyle);
			cell.setCellValue(header);
			currentColumn++;
		}
		// POPULATE VALUE ROWS/COLUMNS
		currentRow++;// exclude header
		
		for (List<String> result : results) {
//		for (String result : results) {
			currentColumn = 0;
			Row row = sheet.createRow(currentRow);

			for (String value : result) {// used to count number of columns
				Cell cell = row.createCell(currentColumn);
				cell.setCellValue(value);
				currentColumn++;
			}
			currentRow++;
		}
	}



}
