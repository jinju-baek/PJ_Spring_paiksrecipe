package com.paiksrecipe.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/*
 * 로그 수집 작업을 하려면 모든 메소드에 해야함
 * 로그 수집은 중요한 업무이지만 핵심적인 업무는 아니고 공통적인 업무에 해당됨
 * 공통적인 업무는 모든 method에 작성하지 말고 Advice에 모아서 작성하고
 * 세부적인 코드에서는 핵심업무에 집중하도록 처리
 * 
 * - Before: 조인 포인트 전에 실행된다. 예외가 발생하는 경우만 제외하고 항상 실행된다.
 * - After: 조인 포인트에서 처리가 완료된 후 실행된다. 예외 발생이나 정상 종료 여부와 상관없이 항상 실행된다.
 * - Around: 조인 포인트 전후에 실행(가장 광범위하게 사용됨)
 * - After Returning: 조인포인트가 정상적으로 종료 후 실행, 예외가 발생하면 실행되지 않음.
 * - After Throwing: 조인 포인트에서 예외가 발생했을 때 실행된다. 예외가 발생하지 않고 정상적으로 종료하면 실행되지 않는다.
 */

// @Controller @Service @Repository
@Slf4j
@Component // 기타 bean(스프링 빈으로 인식되기 위해 설정)
@Aspect // AOP bean - 공통 업무를 지원하는 코드
public class LogAdvice {
	// 포인트컷 - 실행 시점, Around(메서드 실행 전후)
	// logPring()메서드는 controller, service, persistence 패키지 하위의 *Controller, @
	@Around( // execution경로에 ..는 하위패키지들이 다 들어갈 수 있다는 의미
		"execution(* com.paiksrecipe.controller..*Controller.*(..))" 
			+ " or execution(* com.paiksrecipe.service..*Impl.*(..))"
			+ " or execution(* com.paiksrecipe.persistence..*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		long start = System.currentTimeMillis();
		
		Object result = joinPoint.proceed(); // 핵심업무 실행
		
		// 호출한 클래스 이름
		String type = joinPoint.getSignature().getDeclaringTypeName();
		String name = "";
		if(type.indexOf("Controller") > -1) {
			name="Controller \t:";
		}else if(type.indexOf("Service") > -1) {
			name = "ServiceImpl \t:";
		}else if(type.indexOf("DAO") > -1) {
			name = "DaoImpl \t:";
		}
		// 호출한 클래스, method 정보
		log.info(name + type + "." + joinPoint.getSignature().getName() + "()");
		// method에 전달되는 매개변수들
		log.info(Arrays.toString(joinPoint.getArgs()));
		long end = System.currentTimeMillis();
		long time = end - start;
		log.info("실행시간 : " + time);
		return result;
	}
}
