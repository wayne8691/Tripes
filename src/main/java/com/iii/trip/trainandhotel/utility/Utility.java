package com.iii.trip.trainandhotel.utility;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class Utility {
    private Utility() {}
    
    public static String getStringNotNull(Object input) {
        return input != null ? input.toString() : "";
    }
    
    public static int getIntegerFromString(String input) {
        try {
            return Integer.parseInt(input);
        } catch (Exception e) {
            return 0;
        }
    }

	public static double getDoubleNotNull(String input) {
        try {
            return Double.parseDouble(input);
        } catch (Exception e) {
            return 0.0;
        }
	}
	
	public static void showAllRequestParameter(HttpServletRequest req) {
		Enumeration<String> paramNames = req.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			System.out.println(paramName + ": " + req.getParameter(paramName));
		}
	}
}
