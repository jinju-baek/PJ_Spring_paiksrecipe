package com.paiksrecipe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paiksrecipe.domain.MemberDTO;
import com.paiksrecipe.service.mail.MailService;
import com.paiksrecipe.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

/*
 * SessionAttributes로 설정된 변수(객체)는
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다.
 * web browser와 server간에 한번이라도 연결이 이루어졌으면
 * Session..에 등록된 변수는 서버가 중단될 때까지 그 값이 그대로 유지된다.
 * web은 클라이언트의 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런 특성과는 달리 Spring기반의 web은 일부 데이터들을
 * 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그 중 SessionAttributes라는 기능이 있다.
 * 
 *  SessionAttributes()에 설정하는 문자열(이름)은
 *  클래스의 표준 객체생성 패턴에 의해 만들어진 이름
 *  MemberDTO memberDTO 
 */

@Slf4j
@RequestMapping("/member")
@SessionAttributes({"memberDTO"})
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	/*
	 * SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야하고
	 * 해당 메서드에는 @ModelAttribute("변수명")이 있어야 한다.
	 */
	
	// 초기화하는 작업(필수)
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}
	
	@GetMapping("/constract")
	public String viewConstract() {
		log.info("★★★★★★★★★★★★★★★ MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
	
	/*
	 * SessionAttributes에서 설정한 변수(객체)에는
	 * @ModelAttribute를 설정해두어야 한다.
	 * 단, 5.x 이하에서는 필수 5.x 이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할 경우
	 * @ModelAttribute("객체이름")을 필수로 지정해주어야 한다.
	 */
	
	@GetMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
			@RequestParam(value="flag", defaultValue="0") String flag, Model model) {
		log.info("★★★★★★★★★★★★★★★ MEMBER/JOIN PAGE GET 출력");
		log.info("★★★★★★★★★★★★★★★ " + mDto.toString());
		
		//비정상적인 접근일 경우 약관 동의페이지로 이동
		if(!flag.equals("1")) {
			return "member/constract";
		}
		return "member/join";
	}
	
	/*
	 * join POST가 mDto를 수신할 때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드변수에 setting을 하고
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * mDto변수에서 값을 가져와서 비어있는
	 * 필드변수를 채워서서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp 코드에서 Spring-form tag로 input을 코딩해야 한다.
	 */
	
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, 
			HttpServletRequest request, RedirectAttributes rttr) {
		log.info("★★★★★★★★★★★★★★★ MEMBER/JOIN PAGE POST 출력");		
		log.info(mDto.toString());
		
		log.info("Password: " + mDto.getPw());
		// 1. 사용자 암호 hash 변환
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		log.info("Password(+Hash): " + mDto.getPw());
		
		// 2. DB에 회원 등록
		int result = mService.memInsert(mDto);
		
		// 3. 회원 등록 결과
		if(result > 0) {
			log.info("★★★★★★★★★★★★★★★ " + mDto.getId() + "님 회원가입되셨습니다.");
		}
		
		// 4. 회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		
		// SessionAttributes를 사용할 때 insert, update가 완료되고 
		// view로 보내기 전 반드시 setComplet()를 실행하여
		// session에 담긴 값을 clear 해주어야 한다.
		// sessionStatus : controller에서 공유하던 영역을 제거
		sessionStatus.setComplete();
		
		// 회원가입 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", mDto.getId());
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
		
		// 페이지를 띄울 때 forward, sendRedirect
		// forward(default) : 기존페이지 위에 내용을 덮음(주소 안바뀜)
		// sendRedirect : 새 페이지로 이동(주소 바뀜), DB작업(등록, 수정, 삭제)시 이용
		// 회원가입페이지위에 forward 할 경우 새로고침하면 DB에 정보가 저장된 상태에서 한번 더 실행됨 
		
		// forward는 해당페이지 위에 덮는 것이므로 디자인만 보냄
		// 해당 프로젝트내에서 /를 mapping으로 잡는(@ReqeustMapping("/")) 메서드를 실행
		return "redirect:/";
	}
	
	// 회원가입 후 email 인증
	@GetMapping("/keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {
		
		mailService.keyAuth(id, key);
		
		// 인증 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth");
		
		return "redirect:/";
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info("★★★★★★★★★★★★★★★ ID OVERLAP CHECK");
		log.info("아이디 : " + id);
		int cnt = mService.idOverlap(id);
		
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		return flag;
	}
	
	// 회원정보수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET : Member Update Page");
		
		// 현재 로그인 상태를 확인
		// session영역에 담을경우 제일 최상의 타입인 object로 변환하여 담음
		// 담기 전 형변환 해야함
		String id = (String)session.getAttribute("userid");
		
		// 로그인 된 유저의 정보를 GET
		model.addAttribute("user", mService.userView(id));
		return "member/join";
	}
	
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ POST: Member Update Action");
		log.info(mDto.toString());
		
		mService.memUpdate(mDto, session);

		return "redirect:/";
	}
	
	// 비밀번호수정
	@GetMapping("/pwupdate")
	public String pwUpdate() {
		log.info("★★★★★★★★★★★★★★★ GET: Password Update Action");
		
		return "member/pwupdate";
	}
	
	@PostMapping("/pwupdate")
	public String pwUpdate(HttpSession session, MemberDTO mDto) {
		log.info("★★★★★★★★★★★★★★★ POST: Password Update Action");
		log.info("수정 비밀번호 : " + mDto.getPw());
		
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		
		String id = (String)session.getAttribute("userid");
		mDto.setId(id);
		log.info(mDto.toString());
		
		mService.pwUpdate(mDto);
		
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/pwcheck")
	public Integer pwCheck(String pw, HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ POST: Password Check(AJAX)");
		
		String id = (String)session.getAttribute("userid");
		
		return mService.pwCheck(id, pw);
	}
	
	@GetMapping("/drop")
	public String memdrop(HttpSession session, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: Member Drop Page");
		
		String id = (String)session.getAttribute("userid");
		
		model.addAttribute("id", id);
		model.addAttribute("key", "drop");
		
		return "member/drop";
	}
	
	@GetMapping("/dropAction")
	public String mypage(HttpSession session, RedirectAttributes rttr) {
		log.info("★★★★★★★★★★★★★★★ GET: Member Drop Action");
		
		String id = (String)session.getAttribute("userid");
		
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "dropResult");
		
		mService.memDrop(session, id);
		
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: Member Mypage Page");
		
		String id = (String)session.getAttribute("userid");
		
		model.addAttribute("user", mService.userView(id));
		
		return "member/mypage";
	}
	
}
























