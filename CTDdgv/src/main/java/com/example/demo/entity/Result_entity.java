package com.example.demo.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Result_entity {

    final static String relativePathToResults = "/file/data/analysis/results/";
    final static String relativePathToSurvivals = "/file/data/analysis/survivals/";
    private String code; //code为100表示分析成功并返回数据，101分析+生存成功，102未识别出驱动突变，103数据格式不正确/r脚本分析出错，104java抛出错误
    private String message;
    private String uuid;
    //private List download_url;
    private List elementList;
    private List geneList;
    private String pathToAnalysis;
    private Map visual;
    public Map getVisual() {
        return visual;
    }

    public void setVisual(Map visual) {
        this.visual = visual;
    }
    public String getPathToAnalysis() {
        return pathToAnalysis;
    }

    public void setPathToAnalysis(String pathToAnalysis) {
        this.pathToAnalysis = pathToAnalysis;
    }

    public List getElementList() {
        return elementList;
    }

    public void setElementList(List elementList) {
        this.elementList = elementList;
    }

    public List getGeneList() {
        return geneList;
    }

    public void setGeneList(List geneList) {
        this.geneList = geneList;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    public Result_entity(){}
    //正常分析
    public Result_entity(String code, String message,String uuid,Map visual,List genelist) {
        this.code = code;
        this.message = message;
        this.uuid = uuid;
        this.visual = visual;
        this.pathToAnalysis = "file/data/analysis/";
        this.geneList = genelist;
    }
    //报错时
    public Result_entity(String code,String message){
        this.code = code;
        this.message = message;
    }

     //获取可下载element列表执行方法
    public void suc(String rootPath){
        File file = new File(rootPath+relativePathToResults + uuid + "/element_filter/");
        if(file.listFiles().length>0){
            elementList = new ArrayList<String>();
            for(File f:file.listFiles()){
                String fileName = f.getName();
                int lastDotIndex = fileName.lastIndexOf(".");
                elementList.add(fileName.substring(0, lastDotIndex));
            }
        }
    }

    public void error(){
        this.uuid = null;
        this.elementList = null;
        this.geneList = null;
        this.pathToAnalysis = null;
        this.visual = null;
    }
    //test


}
