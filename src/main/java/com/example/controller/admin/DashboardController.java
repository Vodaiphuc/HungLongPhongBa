package com.example.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.helper.DateHelper;
import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.User;
import com.example.service.CookieService;
import com.example.service.OrderDetailService;
import com.example.service.OrderService;
import com.example.service.SessionService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "admin/dashboard")
public class DashboardController {
	@Autowired
	CookieService cookie;

	@Autowired
	SessionService session;

	@Autowired
	UserService userService;

	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	OrderService orderService;

	private int month = DateHelper.getMonth();
	private int year = DateHelper.getYear();

	@GetMapping(value = "")
	public String dashboardPage(Model model) {
		int lastMonth = 0;
		int lastYear = year;
		if (month == 1) {
			lastMonth = 12;
			lastYear = year - 1;
		} else {
			lastMonth = month - 1;
		}

		int countUserMonthNow = userService.countUserByMonth(month, year);
		int countUserLastMonth = userService.countUserByMonth(lastMonth, lastYear);

		float totailPriceMonthNow = orderDetailService.totailPrice(month, year);
		float totailPriceLastMonth = orderDetailService.totailPrice(lastMonth, lastYear);

		float totailQuantityMonthNow = orderDetailService.totailQuantity(month, year);
		float totailQuantityLastMonth = orderDetailService.totailQuantity(lastMonth, lastYear);

		int countOrderMonthNow = orderService.countOrder(month, year);
		int countOrderLastMonth = orderService.countOrder(lastMonth, lastYear);
		
		int countUserYearNow = userService.countUserByYear(year);
		int countUserYearMonth = userService.countUserByYear(year - 1);
		
		List<User> listSubscriber = userService.findAllByRoleOrderByCreatedDateDesc(false);

		model.addAttribute("countUserMonthNow", countUserMonthNow);
		model.addAttribute("countUserLastMonth", countUserLastMonth);
		model.addAttribute("totailPriceMonthNow", totailPriceMonthNow);
		model.addAttribute("totailPriceLastMonth", totailPriceLastMonth);
		model.addAttribute("totailQuantityMonthNow", totailQuantityMonthNow);
		model.addAttribute("totailQuantityLastMonth", totailQuantityLastMonth);
		model.addAttribute("countOrderMonthNow", countOrderMonthNow);
		model.addAttribute("countOrderLastMonth", countOrderLastMonth);
		model.addAttribute("countUserYearNow", countUserYearNow);
		model.addAttribute("countUserYearMonth", countUserYearMonth);
		model.addAttribute("listSubscriber", listSubscriber);
		return PageTypeEnum.ADMIN_DASHBOARD.type;
	}

	@GetMapping(value = "/logout")
	public String logout() {
		cookie.remove("email");
		cookie.remove("role");
		session.remove("user");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_LOGIN.type;
	}

	@GetMapping(value = "/visitNewUserByYear/{year}")
	public ResponseEntity<List<Object[]>> visitNewUserByYearApi(@PathVariable(name = "year") Optional<Integer> yearOld) {
		List<Object[]> list = userService.visitNewUserByYear(yearOld.orElse(year));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
}
