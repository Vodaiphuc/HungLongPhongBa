<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="page-topbar" id="header">
	<div class="navbar navbar-fixed">
		<nav
			class="navbar-main navbar-color nav-collapsible sideNav-lock navbar-light">
			<div class="nav-wrapper">
				<div class="header-search-wrapper hide-on-med-and-down">
					<i class="material-icons">search</i> <input
						class="header-search-input z-depth-2" type="text" name="Search"
						placeholder="Explore Materialize">
					<ul class="search-list collection display-none"></ul>
				</div>
				<ul class="navbar-list right">
					<li class="hide-on-med-and-down"><a
						class="waves-effect waves-block waves-light toggle-fullscreen"
						href="javascript:void(0);"><i class="material-icons">settings_overscan</i></a></li>
					<li class="hide-on-large-only search-input-wrapper"><a
						class="waves-effect waves-block waves-light search-button"
						href="javascript:void(0);"><i class="material-icons">search</i></a></li>
					<li><a
						class="waves-effect waves-block waves-light profile-button"
						href="javascript:void(0);" data-target="profile-dropdown"><span
							class="avatar-status avatar-online"><img
								src="/uploads/${sessionScope['user'].getAvatar()}"
								alt="avatar"><i></i></span></a></li>
				</ul>
				<!-- profile-dropdown-->
				<ul class="dropdown-content" id="profile-dropdown">
					<li><a class="grey-text text-darken-1" href="#"><i
							class="material-icons">person_outline</i> Profile</a></li>
					<li class="divider"></li>
					<li><a class="grey-text text-darken-1" href="#"><i
							class="material-icons">keyboard_tab</i> Logout</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>