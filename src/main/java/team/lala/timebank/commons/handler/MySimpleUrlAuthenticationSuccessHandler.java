package team.lala.timebank.commons.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MySimpleUrlAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		SavedRequest savedRequest = requestCache.getRequest(request, response);

		if (savedRequest == null) {
			handle(request, response, authentication);
			clearAuthenticationAttributes(request);
			return;
		}
		String targetUrlParameter = getTargetUrlParameter();
		if (isAlwaysUseDefaultTargetUrl()
				|| (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
			requestCache.removeRequest(request, response);
			handle(request, response, authentication);
			clearAuthenticationAttributes(request);

			return;
		}

		clearAuthenticationAttributes(request);

		// Use the DefaultSavedRequest URL
		String targetUrl = savedRequest.getRedirectUrl();
		logger.debug("Redirecting to DefaultSavedRequest Url: " + targetUrl);
		getRedirectStrategy().sendRedirect(request, response, targetUrl);
	}

	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		String targetUrl = null;
		log.debug("sourceUrl={}",request.getParameter("sourceUrl"));
		log.debug("action={}",request.getParameter("action"));

		if (!StringUtils.isEmpty(request.getParameter("sourceUrl"))) {
			targetUrl = request.getParameter("sourceUrl");
			if ("volunteerApply".equals(request.getParameter("action"))) {
				targetUrl += "&apply=Y";
			}else if ("chatting".equals(request.getParameter("action"))){
				request.getSession().setAttribute("chatting", "Y");
			}
			else if (request.getParameter("action").contains("Id")) {
				targetUrl +="?";
				targetUrl +=request.getParameter("action");
			}
		} else {
			targetUrl = determineTargetUrl(request, response);			
		}
		log.debug("targetUrl={}",targetUrl);
		if (response.isCommitted()) {
			log.debug("Response has already been committed. Unable to redirect to " + targetUrl);
			return;
		}

		getRedirectStrategy().sendRedirect(request, response, targetUrl);
	}

	


	public void setRequestCache(RequestCache requestCache) {
		this.requestCache = requestCache;
	}

}
