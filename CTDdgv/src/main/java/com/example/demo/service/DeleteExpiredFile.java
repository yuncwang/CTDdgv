package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
@Service
public class DeleteExpiredFile {
    @Autowired
    public ServletContext servletContext;
    //获取geMER根目录
    public String getrealPath() {
        Path realPath = Paths.get(servletContext.getRealPath("/")); //Path.get会根据操作系统自动返回不同的路径分隔符
        return realPath.toString().replace("\\", "/");
    }

    //1充当游标的作用
    public DeleteExpiredFile(){}
    public void deleteExpiredFileTask() {
        String rootPath = getrealPath();
        String relativePath = rootPath + "/file/data/";

        String mutation = relativePath + "/uploads/mutations";
        String  upSurvivals= relativePath + "/uploads/survivals";
        String  results= relativePath + "/analysis/results";
        String  anSurvivals= relativePath + "/analysis/survivals";

        deleteExpiredFile(new File(mutation),1);
        deleteExpiredFile(new File(upSurvivals),1);
        deleteExpiredFile(new File(results),1);
        deleteExpiredFile(new File(anSurvivals),1);
    }
//删除指定目录下的所有过期文件及过期文件夹（没有递归）
    private void deleteExpiredFile(File file,int i) {
        if (!file.exists()) return;
        if (!file.isDirectory()) {
            determineExpiredFile(file);
        } else if(file.listFiles().length == 0) {
                    if(i > 1) {
                        determineExpiredFile(file);
                    }
            }else {
            for (File f : file.listFiles()) {
                deleteExpiredFile(f,i+1);
            }
        }
    }
    //删除文件
    private void determineExpiredFile(File file) {
        long lastModifiedTime = file.lastModified();
        long currentTime = new Date().getTime();
        long timeInterval = 3*24*60*60*1000;// 正式部署时间 7*24*60*60*1000;
        if (currentTime - lastModifiedTime > timeInterval) {
            file.delete();
        }
    }

}
/* 递归删除一定目录下的所有过期文件，保留文件夹
    private void deleteExpiredFile(File file) {
        if (!file.exists()) return;

        if (!file.isDirectory()) {
            determineExpiredFile(file);
        } else {
            for (File f : file.listFiles()) {
                deleteExpiredFile(f);
            }
        }
    }
    }
 */

/* 递归删除一定目录下的所有过期文件，并删除空文件夹
private void deleteExpiredFolder(File folder) {
        if (!folder.exists()) return;
        if (folder.isDirectory()) {
            for (File subFile : folder.listFiles()) {
                if (subFile.isDirectory()) {
                    deleteExpiredFolder(subFile); // Recursively delete subfolders
                } else {
                    determineExpiredFile(subFile); // Delete expired files within the folder
                }
            }
            if (folder.list().length == 0) {
                folder.delete(); // Delete the folder if it's empty
            }
        }
    }
 */