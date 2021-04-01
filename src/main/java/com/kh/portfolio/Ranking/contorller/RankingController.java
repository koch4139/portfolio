package com.kh.portfolio.Ranking.contorller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.kh.portfolio.common.paging.PageCriteria;
import com.kh.portfolio.recipe.svc.RecipeSVC;
import com.kh.portfolio.recipe.vo.RecipeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class RankingController {
	
	final RecipeSVC recipeSVC;
	
	
	/**
	 * 랭킹 리스트 출력
	 * @param model
	 * @return
	 */
	@GetMapping({"/ranking",
				"/ranking/{reqPage}"})
	public String ranking(@PathVariable(value="reqPage", required = false) Optional<Integer> reqPage,
								Model model) {
		Map<String, Object> map = recipeSVC.list(reqPage.orElse(1));
		
		log.info("recipeList 넘어왔는가?"+(List<RecipeVO>)(map.get("recipeList")));
		//게시글 목록
		model.addAttribute("recipeList",(List<RecipeVO>)(map.get("recipeList")));
		//페이징 정보     
		model.addAttribute("pc", (PageCriteria)(map.get("pc")));
		
		return "/ranking/ranking";
	}
}
