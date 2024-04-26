package com.tech.ibara.shop.service;

import org.apache.ibatis.session.SqlSession;

public class SqlSessionBase {

	protected SqlSession sqlSession;

	public SqlSessionBase(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
