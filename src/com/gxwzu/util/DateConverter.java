package com.gxwzu.util;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.log4j.Logger;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 12/12/19 12:13 PM
 * @Version 1.0
 * @Description:
 **/

public class DateConverter extends DefaultTypeConverter {

    private static final Logger logger = Logger.getLogger(DateConverter.class);

    private static final String DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    private static final String DATE_PATTERN = "yyyy-MM-dd";

    private static final String MONTH_PATTERN = "yyyy-MM";

    /**
     * Convert value between types
     */
    @SuppressWarnings("unchecked")
    @Override
    public Object convertValue(Map ognlContext, Object value, Class toType) {
        Object result = null;
        if (toType == Date.class) {
            result = doConvertToDate(value);
        } else if (toType == String.class) {
            result = doConvertToString(value);
        }
        return result;
    }

    /**
     * Convert String to Date
     *
     * @param value
     * @return
     */
    private Date doConvertToDate(Object value) {
        Date result = null;

        if (value instanceof String) {
            try {
                result = DateUtils.parseDate((String) value, new String[]{DATE_PATTERN, DATETIME_PATTERN, MONTH_PATTERN});
            }catch (Exception e){ e.printStackTrace(); }
            // all patterns failed, try a milliseconds constructor
            if (result == null && StringUtils.isNotEmpty((String)value)) {

                try {
                    result = new Date(new Long((String) value).longValue());
                } catch (Exception e) {
                    logger.error("Converting from milliseconds to Date fails!");
                    e.printStackTrace();
                }

            }

        } else if (value instanceof Object[]) {
            // let's try to convert the first element only
            Object[] array = (Object[]) value;

            if ((array != null) && (array.length >= 1)) {
                value = array[0];
                result = doConvertToDate(value);
            }

        } else if (Date.class.isAssignableFrom(value.getClass())) {
            result = (Date) value;
        }
        return result;
    }

    /**
     * Convert Date to String
     *
     * @param value
     * @return
     */
    private String doConvertToString(Object value) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATETIME_PATTERN);
        String result = null;
        if (value instanceof Date) {
            result = simpleDateFormat.format(value);
        }
        return result;
    }
}
