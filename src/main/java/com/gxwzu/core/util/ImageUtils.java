package com.gxwzu.core.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtils {

    public static void graphics(String text,
                                String imgurl) {
        try {
            int imageWidth = 100;// 图片的宽度

            int imageHeight = 50;// 图片的高度
            BufferedImage image;
            image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
            Graphics graphics = image.getGraphics();
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, imageWidth, imageHeight);
            graphics.setColor(Color.BLACK);
            graphics.setFont(new Font("宋体", Font.BOLD, 14));
            graphics.drawString(text, 30, 30);

            // 改成这样:
            BufferedImage bimg = null;
            try {
                bimg = javax.imageio.ImageIO.read(new java.io.File(imgurl));
            } catch (Exception e) {
            }

            if (bimg != null)
                graphics.drawImage(bimg, 230, 0, null);
            graphics.dispose();


            FileOutputStream fos = new FileOutputStream(imgurl);
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bos);
            encoder.encode(image);
            bos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
