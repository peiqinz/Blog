package com.peiqin.blog.util;

import java.util.UUID;

import org.junit.Test;


public class UUIDUtils {

	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	@Test
	public void sss(){
		System.out.println(UUID.randomUUID().toString());
	}
}
