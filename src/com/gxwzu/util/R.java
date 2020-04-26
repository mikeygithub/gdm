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

    public R ok(){
        code = 200;
        r = new R();
        return r;
    }

    public R error(){
        r = new R();
        code = 500;
        return r;
    }

    public R error(int code,String msg){
        r = new R();
        r.msg = msg;
        r.code = code;
        return r;
    }

    public R add(String key,Object object){
        this.data.put(key,object);
        return this;
    }

}
