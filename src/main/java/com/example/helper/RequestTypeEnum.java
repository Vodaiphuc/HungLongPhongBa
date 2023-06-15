package com.example.helper;

public enum RequestTypeEnum {
	ADMIN_DASHBOARD("/admin/dashboard"),
	ADMIN_LOGIN("/auth/admin/login"),
	ADMIN_CONFIRM_PASSWORD("/auth/admin/confirm-password"),
	ADMIN_ERROR_500("/error/admin/500"),
	ADMIN_ERROR_404("/error/admin/404"),
	ADMIN_USER("/admin/user"),
	ADMIN_CATEGORY_PRODUCT("/admin/category-product"),
	ADMIN_CATEGORY_BLOG("/admin/category-blog"),
	ADMIN_BRAND("/admin/brand"),
	ADMIN_COLOR("/admin/color"),
	ADMIN_PRODUCT("/admin/product"),
	ADMIN_INVOICE("/admin/invoice"),
	ADMIN_CONTACT("/admin/contact"),
	ADMIN_LIKE("/admin/like"),
	ADMIN_REVIEW("/admin/review"),
	ADMIN_STATISTICAL_PRODUCT("/admin/statistical/product"),
	ADMIN_STATISTICAL_USER("/admin/statistical/user"),
	ADMIN_STATISTICAL_REVENUE("/admin/statistical/revenue"),
	SHOP_HOME("/shop/home"),
	SHOP_ACCOUNT_LOGIN("/shop/account/login"),
	SHOP_ACCOUNT_REGISTER("/shop/account/register"),
	SHOP_ACCOUNT_CHANGE_PASSWORD("/shop/account/change-password"),
	SHOP_ACCOUNT_FORGOT_PASSWORD("/shop/account/forgot-password"),
	SHOP_ACCOUNT_CONFIM_PASSWORD("/shop/account/confirm-password"),
	SHOP_ACCOUNT_CHANGE_INFORMATION("/shop/account/change-information"),
	SHOP_ACCOUNT_LOGOUT("/shop/account/logout"),
	SHOP_LIKE("/shop/like"),
	SHOP_REVIEW("/shop/review"),
	SHOP_PRODUCT_DETAIL("/shop/product-detail"),
	SHOP_CART("/shop/cart"),
	SHOP_CHECK_OUT("/shop/checkout"),
	SHOP_CONFIRMATION("/shop/confirmation"),
	SHOP_TRACKING("/shop/tracking"),
	SHOP_ORDER_HISTORY("/shop/order-history");

	public final String type;

	private RequestTypeEnum(String type) {
		this.type = type;
	}
}