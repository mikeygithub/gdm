package com.gxwzu.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/26/20 12:32 AM
 * @Version 1.0
 * @Title: R
 * @Description: 返回结果工具
 **/

public class R implements Serializable {

    private R r;

    private int code;

    private String msg;

    private Map data = new HashMap();

    public static R ok(){
        R r = new R();
        r.code = 200;
        return r;
    }

    public static R ok(int code){
        R r = new R();
        r.code = code;
        return r;
    }

    public static R ok(int code,String msg){
        R r = new R();
        r.code = 200;
        r.msg = msg;
        return r;
    }

    public static R error(){
        R r = new R();
        r.code = 500;
        return r;
    }

    public static R error(int code){
        R r = new R();
        r.code = code;
        return r;
    }

    public static R error(int code,String msg){
        R r = new R();
        r.msg = msg;
        r.code = code;
        return r;
    }

    public R add(String key,Object object){
        this.data.put(key,object);
        return this;
    }

}
