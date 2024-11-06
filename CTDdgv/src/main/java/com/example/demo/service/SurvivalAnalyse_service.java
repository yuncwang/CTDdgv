package com.example.demo.service;
import com.example.demo.dao.Merge_dao;
import com.example.demo.dao.IdentifyPat_Gene_dao;
import com.example.demo.dao.Survival_dao;
import com.example.demo.entity.CreateFolder_entity;
import com.example.demo.entity.CustomException;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import java.io.IOException;

public class SurvivalAnalyse_service {
        String rootPath;
        String uuid;
        String relativePathToData = "/file/data/";
        String relativePathToPro = "/file/Program/";
        //创建R连接对象

    public SurvivalAnalyse_service(String uuid, String rootPath) throws RserveException {
            this.uuid = uuid;
            this.rootPath = rootPath;
    }
    public void survival() throws RserveException {
        createFolder();
        identifyPat_Gene();
        survivalAnalyse();
    }
    //创建生存分析所需文件存储目录
    public void createFolder(){
        CreateFolder_entity C = new CreateFolder_entity(rootPath + relativePathToData + "analysis/survivals/" + uuid);
        C.createFolder();
        System.out.println("Create survival analysis folder finish...");
    }
    //生成患者_驱动基因突变情况表
    public void identifyPat_Gene() throws RserveException {
        IdentifyPat_Gene_dao IG = new IdentifyPat_Gene_dao(uuid,relativePathToData,relativePathToPro, rootPath);
    }
    //生存分析
    public void survivalAnalyse() throws RserveException {
        Survival_dao S = new Survival_dao(uuid,relativePathToData,relativePathToPro,rootPath);
        S.survival();
    }
}
