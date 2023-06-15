package com.example.helper;

public enum PageTypeEnum {
	ADMIN_LOGIN("auth/admin/login"),
	ADMIN_REGISTER("auth/admin/register"),
	ADMIN_FORGOT_PASSWORD("auth/admin/forgot-password"),
	ADMIN_CONFIRM_PASSWORD("auth/admin/confirm-password"),
	ADMIN_ERROR_500("error/admin/500"),
	ADMIN_ERROR_404("error/admin/404"),
	ADMIN_DASHBOARD("dashboard/dashboard"),
	ADMIN_USER_LIST("user/list"),
	ADMIN_USER_FORM("user/form"),
	ADMIN_USER_VIEW("user/view"),
	ADMIN_CATEGORY_PRODUCT_LIST("category-product/list"),
	ADMIN_CATEGORY_BLOG_LIST("category-blog/list"),
	ADMIN_BRAND("brand/list"),
	ADMIN_COLOR("color/list"),
	ADMIN_PRODUCT_LIST("product/list"),
	ADMIN_PRODUCT_FORM("product/form"),
	ADMIN_INVOICE_LIST("invoice/list"),
	ADMIN_INVOICE_VIEW("invoice/view"),
	ADMIN_CONTACT_LIST("contact/list"),
	ADMIN_CONTACT_CONTENT("contact/content"),
	ADMIN_LIKE("like/list"),
	ADMIN_REVIEW("review/list"),
	ADMIN_STATISTICAL_PRODUCT("statistical/product"),
	ADMIN_STATISTICAL_USER("statistical/user"),
	ADMIN_STATISTICAL_REVENUE("statistical/revenue"),
	SHOP_INDEX("index"),
	SHOP_LOGIN("login"),
	SHOP_REGISTER("register"),
	SHOP_CHANGE_PASSWORD("change-password"),
	SHOP_FORGOT_PASSWORD("forgot-password"),
	SHOP_CONFIM_PASSWORD("confirm-password"),
	SHOP_CHANGE_INFORMATION("change-information"),
	SHOP_LIKE("like"),
	SHOP_REVIEW("review"),
	SHOP_CATEGORY("shop-category"),
	SHOP_PRODUCT_DETAIL("product-detail"),
	SHOP_CART("cart"),
	SHOP_CHECK_OUT("checkout"),
	SHOP_CONFIRMATION("confirmation"),
	SHOP_TRACKING("tracking"),
	SHOP_ORDER_HISTORY("order-history");

	public final String type;

	private PageTypeEnum(String type) {
		this.type = type;
	}
}
