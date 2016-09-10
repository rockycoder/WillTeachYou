package com.app.Utils;

import java.util.UUID;

public class GenerateGUID {

	public static String getGUID() {

		UUID uuid = UUID.randomUUID();
		String uuidInString = uuid.toString();
		return uuidInString;
	}
}
