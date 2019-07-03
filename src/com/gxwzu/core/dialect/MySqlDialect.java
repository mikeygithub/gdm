package com.gxwzu.core.dialect;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQLDialect;

/**
 * 扩展
 * @author Hibernate3对msql方言的支持
 *
 */
public class MySqlDialect  extends MySQLDialect{

	public MySqlDialect() {
		super();
		registerHibernateType(Types.DECIMAL, Hibernate.BIG_DECIMAL.getName());
		registerHibernateType(Types.LONGVARCHAR, Hibernate.TEXT.getName());
	}

}
