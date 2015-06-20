package com.me.finalproject.utility;

import java.io.File;
import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.me.finalproject.pojo.MemberTable;

public class UtilityFunctions {

	public ArrayList<MemberTable> extractMembers(File fileName) {
		ArrayList<MemberTable> memberTables = new ArrayList<MemberTable>();
		try {
			FileInputStream file = new FileInputStream(fileName);

			// Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			// Get first/desired sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);

			// Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			int i = 0;
			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				if (i != 0) {
					MemberTable memberTable = new MemberTable();

					Cell cell = row.getCell(0);
					memberTable.setCustomerId((int)cell.getNumericCellValue());
					
					cell = row.getCell(1);
					memberTable.setName(cell.getStringCellValue());
					
					cell = row.getCell(2);
					memberTable.setMailStop(cell.getStringCellValue());
					
					cell = row.getCell(3);
					memberTable.setAddrL1(cell.getStringCellValue());
					
					cell = row.getCell(4);
					memberTable.setAddrL2(cell.getStringCellValue());
					
					cell = row.getCell(5);
					memberTable.setAddrL3(cell.getStringCellValue());
					
					cell = row.getCell(6);
					memberTable.setAddrL4(cell.getStringCellValue());
					
					cell = row.getCell(8);
					memberTable.setEmail(cell.getStringCellValue());
					
					cell = row.getCell(9);
					memberTable.setSecondaryEmail(cell.getStringCellValue());

					cell = row.getCell(10);
					memberTable.setHome(cell.getStringCellValue());
					
					cell = row.getCell(11);
					memberTable.setWork(cell.getStringCellValue());
					
					cell = row.getCell(12);
					memberTable.setFax(cell.getStringCellValue());
					
					cell = row.getCell(13);
					memberTable.setMobile(cell.getStringCellValue());
					
					cell = row.getCell(14);
					memberTable.setMembershipPeriod(cell.getStringCellValue());
					
					cell = row.getCell(15);
					memberTable.setMemberSince(dateFormat.format(cell.getDateCellValue()));
					
					cell = row.getCell(16);
					memberTable.setStatus(cell.getStringCellValue());
					
					memberTables.add(memberTable);
				}
				else
				{
					Cell cell = row.getCell(0);
					if(cell.getStringCellValue() == "Customer Id")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(1);
					if(cell.getStringCellValue() == "Name")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(2);
					if(cell.getStringCellValue() == "Mail Stop")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(3);
					if(cell.getStringCellValue() == "Addr L1")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(4);
					if(cell.getStringCellValue() == "Addr L2")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(5);
					if(cell.getStringCellValue() == "Addr L3")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(6);
					if(cell.getStringCellValue() == "Addr L4")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(8);
					if(cell.getStringCellValue() == "Email")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(9);
					if(cell.getStringCellValue() == "Secondary email")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(10);
					if(cell.getStringCellValue() == "Home")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(11);
					if(cell.getStringCellValue() == "Work")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(12);
					if(cell.getStringCellValue() == "Fax")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(13);
					if(cell.getStringCellValue() == "Mobile")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(14);
					if(cell.getStringCellValue() == "Membership Period")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(15);
					if(cell.getStringCellValue() == "Member Since")
					{
						throw new Exception("Excel is not of correct format");
					}
					
					cell = row.getCell(16);
					if(cell.getStringCellValue() == "Status(*)")
					{
						throw new Exception("Excel is not of correct format");
					}
				}
				
				i++;
			}
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberTables;
	}

}
