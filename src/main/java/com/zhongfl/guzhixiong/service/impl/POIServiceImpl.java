package com.zhongfl.guzhixiong.service.impl;

import com.zhongfl.guzhixiong.bean.model.User;
import com.zhongfl.guzhixiong.mapper.UserMapper;
import com.zhongfl.guzhixiong.service.POIService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Service
public class POIServiceImpl implements POIService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> createAllUserXls() throws IOException {
        //获取桌面路径
        FileSystemView fsv = FileSystemView.getFileSystemView();
        String desktop = fsv.getHomeDirectory().getPath();
        String filePath = desktop+"/user.xls";
        File file = new File(filePath);
        OutputStream outputStream = new FileOutputStream(file);
        //创建一个工作簿，相当于一个Excel文档
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        //创建一个工作表
        HSSFSheet sheet = hssfWorkbook.createSheet("sheet1");

        //将第一行的八个单元格合并用于设置标题
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,7));

        //创建行，行号从0开始
        HSSFRow row = sheet.createRow(0);
        //设置行高度
        row.setHeightInPoints(25);
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("用户信息统计表");
        //创建样式对象
        HSSFCellStyle cellStyle1 = hssfWorkbook.createCellStyle();
        //设置字体
        HSSFFont font = hssfWorkbook.createFont();
        font.setColor(HSSFColor.RED.index); //颜色红色
        font.setFontHeightInPoints((short) 18);
        font.setBold(true); //加粗
        cellStyle1.setFont(font);
        //设置水平垂直居中
        cellStyle1.setAlignment(HorizontalAlignment.CENTER);
        cellStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        //设置单元格样式
        cell.setCellStyle(cellStyle1);

        //设置单元格的宽度
        sheet.setColumnWidth(2,32*256); //password
        sheet.setColumnWidth(3,21*256); //email
        sheet.setColumnWidth(4,12*256); //phone
        sheet.setColumnWidth(6,20*256); //time
        sheet.setColumnWidth(7,20*256);

        //设置表头
        HSSFRow row1 = sheet.createRow(1);
        //表头字段
        String[] tableHeaders = {"id","name","password","email","phone","type","createTime","updateTime"};
        //表头字段样式
        HSSFCellStyle cellStyle3 = hssfWorkbook.createCellStyle();
        HSSFFont font1 = hssfWorkbook.createFont();
        font1.setColor(HSSFColor.BLUE.index);
        font1.setBold(true);
        cellStyle3.setFont(font1);
        //创建行的每个单元格
        for (int i = 0; i < tableHeaders.length; i++) {
            HSSFCell headCell1 = row1.createCell(i);
            headCell1.setCellStyle(cellStyle3);
            headCell1.setCellValue(tableHeaders[i]);
        }

        List<User> userList = userMapper.selectAllUser();
        for (int i = 0; i < userList.size(); i++) {
            HSSFRow dataRow = sheet.createRow(i+2);
            User user = userList.get(i);
            dataRow.createCell(0).setCellValue(user.getId());
            dataRow.createCell(1).setCellValue(user.getName());
            dataRow.createCell(2).setCellValue(user.getPassword());
            dataRow.createCell(3).setCellValue(user.getEmail());
            dataRow.createCell(4).setCellValue(user.getPhone());
            dataRow.createCell(5).setCellValue(user.getType());

            //日期格式化样式
            HSSFCellStyle cellStyle2 = hssfWorkbook.createCellStyle();
            HSSFCreationHelper creationHelper = hssfWorkbook.getCreationHelper();
            cellStyle2.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-MM-dd HH:mm:ss"));
            //设置日期格的样式和数据
            HSSFCell cell6 = dataRow.createCell(6);
            cell6.setCellStyle(cellStyle2);
            cell6.setCellValue(user.getCreateTime());

            HSSFCell cell7 = dataRow.createCell(7);
            cell7.setCellStyle(cellStyle2);
            cell7.setCellValue(user.getCreateTime());
        }
        //设置默认选中的工作表
        hssfWorkbook.setActiveSheet(0);
        //写入到文件中
        hssfWorkbook.write(outputStream);
        //关闭输出流
        outputStream.close();
        return userList;
    }
}
