package team.lala.timebank.service;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@Service
public class MissionService {

	@Autowired
	private MissionDao missionDao;
	@Autowired
	private MemberDao memberDao;

	// list for everyone
	public Page<Mission> findByStatusAndSpecification(Mission inputMission, PageRequest pageRequest) {
		inputMission.setMissionStatusTransient("New");
		MissionSpecification missionSpec = new MissionSpecification(inputMission);

		Page<Mission> missions = this.findBySpecification(missionSpec, pageRequest);
		return missions;
	}

	// list for Admin
	public Page<Mission> findBySpecification(Specification<Mission> specification, PageRequest pageRequest) {
		return missionDao.findAll(specification, pageRequest);
	}

	// list for user
	public Page<Mission> findByMemberAndSpecification(Principal principal, Mission mission, PageRequest pageRequest) {
		mission.setMember(memberDao.findByAccount(principal.getName()));
		MissionSpecification missionSpec = new MissionSpecification(mission);
		Page<Mission> missions = this.findBySpecification(missionSpec, pageRequest);
		return missions;
	}

	// insert for user
	public Mission insertMissionAndPicture(MultipartFile missionPicture, Mission mission, HttpServletRequest request) {
		try {
			mission = insert(mission);
			mission.setUpdateDate(new java.util.Date());
			mission = missionDao.save(mission);

			// 如果有上傳圖片，才存檔案到Server，及存路徑到DB
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";
				System.out.println(realPath + "***************************");
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + mission.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();

				// 將檔名存入DB
				mission.setMissionPicName("missionPicture_" + mission.getId() + ".jpg");
				mission = missionDao.save(mission);

			}
			return mission;

		} catch (Exception e) {
			e.printStackTrace();
			return mission;
		}
	}

	// insert for Admin
	public Mission insert(Mission mission) {
		mission.setMissionstatus(MissionStatus.A_New);
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		return missionDao.save(mission);
	}

	// insert for user
	public Mission insert(Mission mission, Principal principal) {
		mission.setMember(memberDao.findByAccount(principal.getName()));
		mission.setMissionstatus(MissionStatus.A_New);
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		return missionDao.save(mission);
	}

	// insert for user
	public Mission insert(Mission mission, Principal principal, MultipartFile missionPicture,
			HttpServletRequest request) {
		mission.setMember(memberDao.findByAccount(principal.getName()));
		mission.setMissionstatus(MissionStatus.A_New);
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		try {
			// 如果有上傳圖片，才存檔案到Server，及存路徑到DB
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + mission.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();

				// 將檔名存入DB
				mission.setMissionPicName("missionPicture_" + mission.getId() + ".jpg");
				mission = missionDao.save(mission);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mission;
		}
		return missionDao.save(mission);
	}

	// update for user & Admin
	public Mission update(Mission mission) {
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		return missionDao.save(mission);
	}

	public Mission update(Mission mission, MultipartFile missionPicture, HttpServletRequest request) {
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		try {
			// 如果有上傳圖片，才存檔案到Server，及存路徑到DB
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + mission.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();

				// 將檔名存入DB
				mission.setMissionPicName("missionPicture_" + mission.getId() + ".jpg");
				mission = missionDao.save(mission);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mission;
		}
		return missionDao.save(mission);
	}

	// cancel for user
	public Mission cancel(Long id) {
		Mission mission = missionDao.getOne(id);

		if (mission.getMissionstatus() == MissionStatus.A_New
				|| mission.getMissionstatus() == MissionStatus.A_VolunteerApproved) {
			mission.setMissionstatus(MissionStatus.C_Cancel);
			return missionDao.save(mission);
		}
		return null;
	}

	public List<Mission> findAll() {
		List<Mission> missionList = missionDao.findAll();
		if (missionList == null) {
			System.out.println("jobList does not exist");
		}
		return missionList;
	}

	public List<Mission> findByMember(Member member) {

		List<Mission> missionList = missionDao.findByMember(member);

		return missionList;

	}

	public Page<Mission> findByMember(Principal principal, Mission mission, Pageable pageable) {
		Page<Mission> missions = missionDao.findByMember(memberDao.findByAccount(principal.getName()), pageable);
		return missions;
	}

	public Mission getOne(Long id) {

		Mission mission = missionDao.getOne(id);

		if (mission == null) {
			System.out.println("id" + id + " does not exist");
		}
		return mission;
	}

	public void delete(Long id) {

		missionDao.deleteById(id);

	}

}
