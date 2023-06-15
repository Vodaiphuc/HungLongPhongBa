package com.example.helper;

import java.util.concurrent.ThreadLocalRandom;

public class IntegerHelper {

	public static int random5Number() {
		return ThreadLocalRandom.current().nextInt(10000, 99999);
	}

}
