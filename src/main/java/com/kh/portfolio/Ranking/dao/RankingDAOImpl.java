package com.kh.portfolio.Ranking.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.recipe.vo.RecipeVO;

@Repository
public class RankingDAOImpl implements RankingDAO {

	@Autowired
	JdbcTemplate jt = new JdbcTemplate();
	
	@Override
	public List<RecipeVO> list(int startRec, int endRec) {
		StringBuilder sql = new StringBuilder();
		sql.append("select *  ");
		sql.append("from  ");
		sql.append("(select row_number() over (order by r1.RECIPE_VIEW_COUNT)as num,  ");
		sql.append("        recipe_name,  ");
		sql.append("        recipe_id,  ");
		sql.append("        member_user_id,  ");
		sql.append("        recipe_c_date, ");
		sql.append("        RECIPE_TAG ");
		sql.append("from recipe r1)t1  ");
		sql.append("where t1.num between ? and ? ");
		List<RecipeVO> result = jt.query(sql.toString(), new BeanPropertyRowMapper<RecipeVO>(RecipeVO.class), startRec, endRec);
		
		return result;
	}
}
