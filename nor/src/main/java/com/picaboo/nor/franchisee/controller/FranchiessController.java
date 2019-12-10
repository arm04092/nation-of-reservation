package com.picaboo.nor.franchisee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.picaboo.nor.franchisee.service.FranchiseeService;
import com.picaboo.nor.franchisee.vo.Franchisee;
import com.picaboo.nor.franchisee.vo.FranchiseeInfoForm;
import com.picaboo.nor.franchisee.vo.Seat;

@Controller
public class FranchiessController {
	@Autowired FranchiseeService franchiseeService;
	
	// FAQ 리스트 페이지
	@GetMapping("/FAQFranchisee")
	public String getFranchiseeFAQList(HttpSession session,Model model, 
								@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								@RequestParam(value="searchWord", required = false) String searchWord){
		// 세션 검사
		String ownerNo = (String)session.getAttribute("memberNo");
		if (ownerNo == null) {
			return "redirect:/";
		}
		System.out.println("currentPage : " + currentPage);
		System.out.println("searchWord : " + searchWord);
		int rowPerPage = 12;
		Map<String, Object> map = franchiseeService.getFranchiseeFAQ(currentPage, rowPerPage, searchWord);
		model.addAttribute("map", map);
		//System.out.println("map : " + map);
		return "franchisee/FAQFranchisee";
	}

	
	// 가맹점 정보 입력
	@PostMapping("/addFranchiseeInfo")
	public String addFranchiseeInfo(HttpSession session, FranchiseeInfoForm franchiseeInfoForm) {
		System.out.println("addFranchiseeInfo POST 요청");
		
		// 세션 검사
		String ownerNo = (String)session.getAttribute("memberNo");
		if (ownerNo == null) {
		return "redirect:/";
		}
		
		System.out.println("Controller franchiseeInfoForm: " + franchiseeInfoForm);
		
		int rows = franchiseeService.addFranchiseeInfo(franchiseeInfoForm);
		
		if(rows < 0) 
			System.out.println("파일 형식 오류");
		else
			System.out.println("success rows : "+ rows);
		
		return "redirect:/detailFranchisee?franchiseeNo="+franchiseeInfoForm.getFranchiseeNo();
	}

	
	// 가맹점 정보 입력 페이지 요청
	@GetMapping("/addFranchiseeInfo")
	public String addFranchiseeInfo(HttpSession session, Model model, @RequestParam(value="franchiseeNo") String franchiseeNo) {
		System.out.println("addFranchiseeInfo Get 요청");
		// 세션 검사
		String ownerNo = (String)session.getAttribute("memberNo");
		
		if (ownerNo == null) {
			return "redirect:/";
		}
		System.out.println("session memberNo: " + ownerNo);
		// 가맹점 번호 넘김
		model.addAttribute("franchiseeNo", franchiseeNo);
		
		return "franchisee/addFranchiseeInfo";
	}
	
	// 가맹점 좌석 삭제 요청
	@GetMapping("/removeSeat")
    public String removeSeat(@RequestParam(value="franchiseeNo") String franchiseeNo) {
		franchiseeService.removeSeat(franchiseeNo);
        return "redirect:/detailFranchisee?franchiseeNo="+franchiseeNo;
    }
	
	// 가맹점 상세 페이지 요청
	@GetMapping("/detailFranchisee")
	public String detailFranchisee(HttpSession session, @RequestParam(value="franchiseeNo") String franchiseeNo, Model model) {	
		System.out.println("detailFranchisee Get 요청");
		// 세션 검사
		String ownerNo = (String)session.getAttribute("memberNo");
		
		if (ownerNo == null) {
			return "redirect:/";
		}
		System.out.println("session memberNo: " + ownerNo);
		
		// 가맹점 좌석정보 가져와서 넘김
		Franchisee franchisee = franchiseeService.getFranchiseeOne(franchiseeNo);
		List<Seat> seat = franchiseeService.getSeat(franchiseeNo);
		System.out.println("detail franchisee: " + franchisee);
		System.out.println("detail seat: " + seat);
		model.addAttribute("franchisee", franchisee);
		model.addAttribute("seat", seat);
		model.addAttribute("size", seat.size());
		
		// 가맹점 사진, pc사양 가져와서 model로 넘김
		Map<String, Object> franchiseeInfo = franchiseeService.getFranchiseeInfo(franchiseeNo);
		model.addAttribute("franchiseeInfo", franchiseeInfo);
		System.out.println("franchiseeInfo:" + franchiseeInfo);
		
		return "franchisee/detailFranchisee";
	}
	
	// 가맹점 인덱스 페이지 요청
	@GetMapping("/franchiseeIndex")
	public String franchiseeIndex(HttpSession session, Model model) {
		// 세션 검사
		String ownerNo = (String)session.getAttribute("memberNo");
		
		if (ownerNo == null) {
			return "redirect:/";
		}
		System.out.println("session memberNo: " + ownerNo);
		
		// 가맹점 리스트 가져와서 넘김
		List<Franchisee> franchiseeList = franchiseeService.getFranchiseeList(ownerNo);
		model.addAttribute("franchiseeList", franchiseeList);
		
		return "franchiseeIndex";
	}
	
	// 가맹점 등록 요청
	@PostMapping("/addFranchisee")
    public String addFranchisee(Franchisee franchisee, HttpSession session) {
		System.out.println("addFranchisee param franchisee: " + franchisee);
        franchisee.setOwnerNo((String)session.getAttribute("memberNo"));
        franchiseeService.addFranchisee(franchisee);
        
        return "redirect:/franchiseeIndex";
	}
	
	// 가맹점 등록 페이지 요청
	@GetMapping("/addFranchisee")
	public String addFranchisee(HttpSession session) {
		// 세션 검사
		if (session.getAttribute("memberNo") == null) {
			return "redirect:/";
		}
		System.out.println("session memberNo: " + session.getAttribute("memberNo"));
		
		return "franchisee/addFranchisee";
	}
	
		
	// 가맹점 좌석 입력 요청
	@PostMapping("/addFranchiseeSeat")
	public String addFranchiseeSeat( @RequestParam() HashMap<String,String> seatMap) {
		System.out.println("addFranchiseeSeat Post 요청");
		
		System.out.println("addFranchiseeSeat.seatList: " + seatMap);
		franchiseeService.addFranchiseeSeat(seatMap);
		
		return "franchisee/addFranchiseeSeat";
	}
	
	// 가맹점 좌석 입력 페이지 요청
	@GetMapping("/addFranchiseeSeat") 
	public String addFranchiseeSeat(HttpSession session, Model model, @RequestParam(value="franchiseeNo") String franchiseeNo) {
		System.out.println("addFranchiseeSeat Get 요청");
		// 세션 검사
		if (session.getAttribute("memberNo") == null) {
			return "redirect:/";
		}
		// 가맹점 번호 넘김 
		model.addAttribute("franchiseeNo", franchiseeNo);
		
		return "franchisee/addFranchiseeSeat";
	}
}
