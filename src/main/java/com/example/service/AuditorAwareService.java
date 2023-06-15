package com.example.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AuditorAware;

import com.example.model.User;

public class AuditorAwareService implements AuditorAware<User> {

	@Autowired
	SessionService session;

	@Override
	public Optional<User> getCurrentAuditor() {
		User user = this.session.get("user");
		if (user == null)
			return null;
		return Optional.of(user);
	}

}
