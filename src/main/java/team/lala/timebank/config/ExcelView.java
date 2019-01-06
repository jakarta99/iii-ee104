package team.lala.timebank.config;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

public class ExcelView extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	public void buildExcelDocument(Map<String, Object> excelModel, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) {
		//取得Controller塞進來的資料(sheetname、表頭、資料內容)
		String sheetName = (String) excelModel.get("sheetname");
		List<String> headers = (List<String>) excelModel.get("headers");
		List<List<String>> results = (List<List<String>>) excelModel.get("results");
		
			
		// 準備檔案
		Sheet sheet = workbook.createSheet(sheetName); //建立sheet
		sheet.setDefaultColumnWidth((short) 12); //建立欄位寬度
		int currentRow = 0;//起始row
		short currentColumn = 0;//起始column
		// 設計表頭樣式
			//CellStyle headerStyle = workbook.createCellStyle();
			//Font headerFont = workbook.createFont();
			//headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			//headerStyle.setFont(headerFont);
		// 塞入表頭資料
		Row headerRow = sheet.createRow(currentRow);
		for (String header : headers) {
			Cell cell = headerRow.createCell(currentColumn);
			//cell.setCellStyle(headerStyle); //表頭樣式
			cell.setCellValue(header);
			currentColumn++;
		}
		currentRow++;// 離開表頭列，進入資料列
		
		
		//塞入資料
		for (List<String> result : results) {
			currentColumn = 0; 
			Row row = sheet.createRow(currentRow);//新增一列
			for (String value : result) { //塞入一列資料
				Cell cell = row.createCell(currentColumn);
				cell.setCellValue(value);
				currentColumn++;
			}
			currentRow++;
		}
	}



}
