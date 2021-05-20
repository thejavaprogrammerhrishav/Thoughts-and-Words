
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.PostFile;
import com.hdsoft.techblog.models.User;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;


public class Files {

    public static List<PostFile> getFiles(String data, HttpServletRequest req, User user) {
        String path = req.getServletContext().getRealPath("/");
        path = path + "userdata" + File.separator + "user_" + user.getId() + File.separator;
        List<PostFile> postFiles = new ArrayList<>();
        String[] names;
        if (data.contains(",")) {
            names = data.split(",");
        } else {
            names = new String[1];
            names[0] = data;
        }

        for (String name : names) {
            byte[] filedata = readFile(path + name);
            PostFile pf = new PostFile(name, filedata);
            postFiles.add(pf);
        }

        return postFiles;
    }

    private static byte[] readFile(String name) {
        try {
            BufferedInputStream bin = new BufferedInputStream(new FileInputStream(name));
            byte[] b = new byte[bin.available()];
            bin.read(b);

            bin.close();
            return b;
        } catch (IOException ex) {
            Logger.getLogger(Files.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new byte[0];
    }

}
