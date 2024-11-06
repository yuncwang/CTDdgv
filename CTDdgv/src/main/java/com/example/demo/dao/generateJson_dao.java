package com.example.demo.dao;
import com.example.demo.entity.Result_entity;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class generateJson_dao {
    String rootPath;
    String relativePathToResults = "/file/data/analysis/results/";
    Result_entity R;
    String UUID;
    public generateJson_dao(){}
    public generateJson_dao(Result_entity R, String UUID, String realPath){
        this.rootPath = realPath;
        this.R = R;
        this.UUID = UUID;
    }
    public String geJ(){
        String path = rootPath + relativePathToResults + UUID + "/visual.json";
        // 创建ObjectMapper实例
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // 将对象序列化为JSON，并保存到文件中
            objectMapper.writeValue(new File(path), R);
            System.out.println("Generate json finish...");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return path;
    }
}
