package com.gxwzu.util;

import com.alibaba.fastjson.JSONObject;

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

    @Override
    public String toString() {
        System.out.println(JSONObject.toJSON(this));
        return JSONObject.toJSONString(this);
    }

    public R getR() {
        return r;
    }

    public void setR(R r) {
        this.r = r;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map getData() {
        return data;
    }

    public void setData(Map data) {
        this.data = data;
    }
}
