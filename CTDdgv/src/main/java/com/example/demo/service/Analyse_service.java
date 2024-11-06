package com.example.demo.service;
import com.example.demo.dao.*;
import com.example.demo.entity.*;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class Analyse_service {
    String uuid;
    String hg;
    String rootPath;
    String relativePathToData = "/file/data/";
    String relativePathToPro = "/file/Program/";
    //创建R连接对象
    public Analyse_service(){};
    public Analyse_service(String uuid,String hg, String realPath) throws REXPMismatchException ,CustomException, IOException,RserveException{
            this.rootPath = realPath;
            this.uuid = uuid;
            this.hg = hg;
            createDirectory();
            String temPath = unitInputFormat();
            String filepath = temPath;
            if (!ifFileExist.fileState(filepath)) {
                throw new CustomException("Driver genes and hotspot mutations not identified");
            }
            mapping(temPath, hg);
            filepath = rootPath + relativePathToData + "analysis/results/" + uuid + "/element_mapping";
            if (!ifFileExist.fileDirectoryState(filepath)) {
                throw new CustomException("Driver genes and hotspot mutations not identified");
            }
            javaAnalyse();
            filepath = rootPath + relativePathToData + "analysis/results/" + uuid + "/element_result";
            if (!ifFileExist.fileDirectoryState(filepath)) {
                throw new CustomException("Driver genes and hotspot mutations not identified");
            }
            Filter();
            identify_mutation();
            merge();
    }
    //创建分析所需目录
    public void createDirectory(){
        CreateFolder_entity CF = new CreateFolder_entity(rootPath + relativePathToData,uuid);
        CF.createOneAnalyseDirectory();
        System.out.println("Create One Analyse Directory finish...");
    }

    //统一输入格式
    public String unitInputFormat() throws REXPMismatchException, RserveException, CustomException {

        UnitInputFormat_dao unitInputFormatDao = new UnitInputFormat_dao();
        return unitInputFormatDao.unitInputFormat(relativePathToData,uuid,rootPath);
    }

    //基因组原件映射
    private void mapping(String readTablePath,String hg) throws RserveException, REXPMismatchException {
        mapping_dao mappingDao = new mapping_dao(readTablePath);
        mappingDao.mapping(relativePathToData,relativePathToPro,uuid,hg,rootPath);
    }

    //java分析
    private void javaAnalyse() throws IOException {
        eleMHRresult2_dao eleMHRresult2Dao = new eleMHRresult2_dao();
        eleMHRresult2Dao.analyse(relativePathToData,uuid, rootPath);
    }

    //过滤和注释
    private void Filter() throws RserveException, REXPMismatchException {
        FilterAndAnnatation_dao filterAndAnnatationDao = new FilterAndAnnatation_dao();
        filterAndAnnatationDao.filterAndAnnotation(relativePathToData,relativePathToPro,uuid,rootPath);
    }
    //计算不同基因组元件的驱动突变
    private void identify_mutation() throws RserveException {
        identifyMutation_dao im = new identifyMutation_dao(uuid,relativePathToData,relativePathToPro, rootPath);
    }
    //合并filter后的文件(只有驱动基因和热点突变区域，不是驱动突变)
    public void merge() throws RserveException {
        Merge_dao Md = new Merge_dao(uuid,relativePathToData,relativePathToPro, rootPath);
    }
    //得到基因list
    public List getGenelist() throws RserveException, REXPMismatchException {
        RConnection rConnectionL = new RConnection();
        try {
            String rootPath = this.rootPath;
            List a = generateGenelist_dao.geneList(rConnectionL, uuid, rootPath,relativePathToData);
            System.out.println("Get genelist finish...");
            return a;
        }
        finally {
            rConnectionL.close();
        }
    }
}

