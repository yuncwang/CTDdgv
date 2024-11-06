package com.example.demo.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CreateFolder_entity {
    String targetPath; //从跟路径开始
    String uuid;
    public CreateFolder_entity(String targetPath,String uuid){
        this.targetPath = targetPath;
        this.uuid = uuid;
    }
    public CreateFolder_entity(String targetPath){
        this.targetPath = targetPath;
    }
    public void createFolder(){
        File folder = new File(targetPath);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
    }
    public void createOneAnalyseDirectory() {
        String[] all = new String[]{"normalize", "element_mapping", "element_result", "element_filter","element_hot_mutation"};
        for(int i=0;i<all.length;i++){
            File folder = new File(targetPath +"analysis/results/" + uuid + "/" + all[i]);
            if (!folder.isDirectory()) {
                folder.mkdirs();
            }
        }
    }
}
