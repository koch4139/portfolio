package com.kh.portfolio.search.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.recipe.vo.RecipeVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDAOImpl implements SearchDAO {
	
	public final JdbcTemplate jt;
	/**
	   레시피 검색 리스트 출력
	 * @param startRec
	 * @param endRec
	 * @return
	 */
	@Override
	public List<RecipeVO> searchList(String keyword) {
		StringBuilder sql = new StringBuilder();
		/* String add = "where r1.recipe_name like '%" + keyword + "%')t1"; */
		sql.append(" select *  ");
		sql.append(" from  ");
		sql.append(" (select row_number() over (order by r1.recipe_c_date)as num,  ");
		sql.append("        recipe_name,  ");
		sql.append("        member_user_id,  ");
		sql.append("        recipe_id,  ");
		sql.append("        recipe_c_date  ");
		sql.append(" from recipe r1  ");
		sql.append(" where r1.recipe_name like '%"+keyword+"%')t1 ");
		
		
		
		
		List<RecipeVO> result = jt.query(sql.toString(), new BeanPropertyRowMapper<RecipeVO>(RecipeVO.class)); 
		
		return result;
	}
	
	/**
	 * 재료 검색 리스트 출력
	 * @param startRec
	 * @param endRec
	 * @return
	 */
	@Override
	public List<RecipeVO> searchMaterialList(String keyword) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(" from recipe ");
		sql.append(" where recipe_id in ");
		sql.append(" (select recipe_recipe_id ");
		sql.append(" from material ");
		sql.append(" where material_title like '%"+keyword+"%' ");
		sql.append(" group by recipe_recipe_id ) ");
		
		
		List<RecipeVO> result = jt.query(sql.toString(), new BeanPropertyRowMapper<RecipeVO>(RecipeVO.class));
		return result;
	}
}
