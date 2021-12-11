package in.rajatroy.formbasedauthenticationextended.security;

import static in.rajatroy.formbasedauthenticationextended.security.ApplicationUserRole.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {
	
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	public ApplicationSecurityConfig(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf()
			.disable()
			.authorizeRequests()
			.antMatchers("/home")
			.permitAll()
			.antMatchers("/api/**")
			.hasAnyRole(STUDENT.name())
			.anyRequest()
			.authenticated()
			.and()
			.formLogin()
			.and()
			.rememberMe()
				.key("A_SECURE_KEY")
			.and()
			.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout", "POST"))
				.clearAuthentication(true)
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID", "remember-me");
	}

	@Override
	@Bean
	protected UserDetailsService userDetailsService() {
		UserDetails admin = User.builder()
				.username("admin")
				.password(passwordEncoder.encode("password"))
				.authorities(ADMIN.getGrantedAuthorities())
				.build();
		
		UserDetails student = User.builder()
				.username("student")
				.password(passwordEncoder.encode("password"))
				.authorities(STUDENT.getGrantedAuthorities())
				.build();
		
		UserDetails adminTrainee = User.builder()
				.username("adminTrainee")
				.password(passwordEncoder.encode("password"))
				.authorities(ADMINTRAINEE.getGrantedAuthorities())
				.build();
		
		return new InMemoryUserDetailsManager(admin, student, adminTrainee);
	}

}
