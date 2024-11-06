package com.example.demo.dao;
import com.example.demo.entity.CustomException;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.example.demo.entity.*;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;


public class UnitInputFormat_dao {
    
    public UnitInputFormat_dao(){}
    public String unitInputFormat(String relativePath,String uuid, String rootPath) throws RserveException, REXPMismatchException, CustomException {
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            REXP rexp = rConnection.eval("R.version.string");//测试连接，方法是eval(String arg0)
            System.out.println(rexp.asString());
            String readTablePath = rootPath + relativePath + "uploads/mutations/"+uuid+".txt";
            String writeTablePath = rootPath + relativePath + "analysis/results/"+uuid+"/normalize/cfDNA_mutation_result.txt";
            String programPath = rootPath + "/file/Program/unit_Input_Format.R";
            if (!(ifFileExist.fileState(readTablePath) && ifFileExist.fileState(programPath))) {
                throw new CustomException("The file directory is not created successfully!");
            }
            rConnection.eval("rm(list=ls())");
            //指定脚本中读入文件路径
            rConnection.assign("readTablePath",readTablePath);
            //指定执行脚本路径
            rConnection.assign("programPath",programPath);
            //指定脚本中输出文件路径
            rConnection.assign("writeTablePath",writeTablePath);
            rConnection.eval("source(programPath)");
            System.out.println("Unit input format finish...");
            return writeTablePath;
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection");
            } else {
                rConnection.close();
            }
        }
    }
}
