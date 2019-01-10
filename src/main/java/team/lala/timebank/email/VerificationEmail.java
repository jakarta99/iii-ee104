package team.lala.timebank.email;

import team.lala.timebank.entity.Member;

public interface VerificationEmail {
	void mail(Member member);
}
