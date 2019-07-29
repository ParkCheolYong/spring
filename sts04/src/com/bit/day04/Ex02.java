package com.bit.day04;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bit.day04.modul.Module1;
import com.bit.day04.modul.Module2;
import com.bit.day04.modul.Module3;

public class Ex02 {

	public static void main(String[] args) {
		//IoC(제어역전)
		
//		Module3 module=new Module3();
//		module.setModule(new Module2());
		
		ClassPathXmlApplicationContext context=null;
		new ClassPathXmlApplicationContext("application.xml");
		Module3 mod=(Module3) context.getBean("mod");
		mod.func();
		
		
		//DI(Dependency Injection) 의존주입

	}

}
