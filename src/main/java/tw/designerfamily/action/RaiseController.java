package tw.designerfamily.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.model.IDesignerBeanDao;
import tw.designerfamily.model.IRaiseBeanService;
import tw.designerfamily.model.Member;
import tw.designerfamily.model.RaiseBean;
import tw.designerfamily.model.RaiseBeanService;
import tw.designerfamily.model.RaisePlanBean;

@Controller
@SessionAttributes({ "raiseList", "login", "raiseBean", "donext" }) // sessionscope
public class RaiseController {

	@Autowired
	private IRaiseBeanService rService;

	// 日期格式轉換
	@InitBinder
	public void init(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	// Raise首頁:raiseindex.controller
	@RequestMapping(path = "/raiseindex.controller", method = RequestMethod.GET) // 首頁要用get(自己測試時)
	public String processAction0(Model model) {
		redirectToRaiseIndex(model);
		return "Raise";
	}
	
	@RequestMapping(path = "/raiseindex", method = RequestMethod.GET) 
	public String processAction1(Model model) {
		return "Raise";
	}
	
	@RequestMapping(path = "/raiseadd", method = RequestMethod.GET)
	public String processAction2(Model model) {
		return "RaiseAdd";
	}
	
	@RequestMapping(path = "/raiseupdate", method = RequestMethod.GET)
	public String processAction3(Model model) {
		return "RaiseUpdate";
	}
	
	// 導回Raise首頁時查詢全部放入session
	public void redirectToRaiseIndex(Model model) {
		List<RaiseBean> rlist = rService.selectAll();
		model.addAttribute("raiseList", rlist);
	}

	// 於首頁按下CRUD導去相關頁面
	@RequestMapping(path = "/raiseindexdonext.controller", method = RequestMethod.POST)
	public String processToNext(@RequestParam("donext") String donext, @RequestParam("rID") int id, Model model) {
		if (donext == null) {
			redirectToRaiseIndex(model);
			return "redirect: raiseindex";
		} else if (donext.equals("RaiseAdd")) {
			return "redirect: raiseadd";
		} else if (donext.equals("RaiseReview")) {
			model.addAttribute("donext", "RaiseReview");
			RaiseBean raiseBean = rService.selectById(id);
			model.addAttribute("raiseBean", raiseBean);
			return "redirect: raiseupdate";
		} else if (donext.equals("RaiseUpdate")) {
			model.addAttribute("donext", "RaiseUpdate");
			RaiseBean raiseBean = rService.selectById(id);
			model.addAttribute("raiseBean", raiseBean);
			return "redirect: raiseupdate";
		} else if (donext.equals("RaiseDelete")) {
			rService.deleteById(id);
			redirectToRaiseIndex(model);
			return "redirect: raiseindex";
		}
		redirectToRaiseIndex(model);
		return "redirect: raiseindex";
	}

	// 於新增頁面按下送出並導回首頁
	@RequestMapping(path = "/raiseinsert.controller", method = RequestMethod.POST)
	public String processInsert(@RequestParam("Raise_Title") String pTitle, @RequestParam("Raise_Breif") String pBreif,
			@RequestParam("Raise_Category") String pCategory, @RequestParam("Raise_PicName") String pPicName,
			@RequestParam("Raise_PicBase64") String pPicBase64, @RequestParam("Raise_Target") int pTarget,
			@RequestParam("Raise_SDate") String pSDate, @RequestParam("Raise_ExpDate") String pExpDate,
			@RequestParam("Raise_Describe") String pDescribe,
			// 回饋項目
			@RequestParam("RaisePlan_Amount_1") int pAmount1, @RequestParam("RaisePlan_PicName_1") String pPicName1,
			@RequestParam("RaisePlan_PicBase64_1") String pPicBase64_1,
			@RequestParam("RaisePlan_ADate_1") String pADate1, @RequestParam("RaisePlan_Describe_1") String pDescribe1,
			@RequestParam("RaisePlan_Amount_2") int pAmount2, @RequestParam("RaisePlan_PicName_2") String pPicName2,
			@RequestParam("RaisePlan_PicBase64_2") String pPicBase64_2,
			@RequestParam("RaisePlan_ADate_2") String pADate2, @RequestParam("RaisePlan_Describe_2") String pDescribe2,
			Model model) {

		Member m = (Member) model.getAttribute("login");
		String pName;
		if (m != null) {
			pName = m.getAccount();
		} else {
			pName = "Donglin";
		}

		RaiseBean rBean = new RaiseBean(pName, pTitle, pBreif, pCategory, pPicName, pPicBase64, pTarget, pSDate,
				pExpDate, pDescribe);
		RaisePlanBean rPBean1 = new RaisePlanBean(pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
		rPBean1.setRaiseBean(rBean);
		RaisePlanBean rPBean2 = new RaisePlanBean(pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
		rPBean2.setRaiseBean(rBean);

		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
		rpBeans.add(rPBean1);
		rpBeans.add(rPBean2);

		rBean.setRaisePlanBeanSet(rpBeans);

		rService.insert(rBean);
		redirectToRaiseIndex(model);
		return "redirect: raiseindex";
	}

	// 於修改頁面按下送出並導回首頁
	@RequestMapping(path = "/raiseupdate.controller", method = RequestMethod.POST)
	public String processUpdate(@RequestParam("rID") int pId, @RequestParam("Raise_Title") String pTitle,
			@RequestParam("Raise_Breif") String pBreif, @RequestParam("Raise_Category") String pCategory,
			@RequestParam("Raise_PicName_default") String pPicName, @RequestParam("Raise_PicBase64") String pPicBase64,
			@RequestParam("Raise_Target") int pTarget, @RequestParam("Raise_SDate") String pSDate,
			@RequestParam("Raise_ExpDate") String pExpDate, @RequestParam("Raise_Describe") String pDescribe,
			// 回饋項目
			@RequestParam("rpId1") int pId1, @RequestParam("RaisePlan_Amount_1") int pAmount1,
			@RequestParam("RaisePlan_PicName_default_1") String pPicName1,
			@RequestParam("RaisePlan_PicBase64_1") String pPicBase64_1,
			@RequestParam("RaisePlan_ADate_1") String pADate1, @RequestParam("RaisePlan_Describe_1") String pDescribe1,
			@RequestParam("rpId2") int pId2, @RequestParam("RaisePlan_Amount_2") int pAmount2,
			@RequestParam("RaisePlan_PicName_default_2") String pPicName2,
			@RequestParam("RaisePlan_PicBase64_2") String pPicBase64_2,
			@RequestParam("RaisePlan_ADate_2") String pADate2, @RequestParam("RaisePlan_Describe_2") String pDescribe2,
			Model model) {

		Member m = (Member) model.getAttribute("login");
		String pName;
		if (m != null) {
			pName = m.getAccount();
		} else {
			pName = "Donglin";
		}
		RaiseBean oBean = rService.selectById(pId);
		String pStatus = oBean.getRaiseStatus();

		RaiseBean rBean = new RaiseBean(pId, pName, pTitle, pBreif, pCategory, pPicName, pPicBase64, pTarget, pSDate,
				pExpDate, pDescribe, pStatus);

		RaisePlanBean rPBean1 = new RaisePlanBean(pId1, pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
		rPBean1.setRaiseBean(rBean);
		RaisePlanBean rPBean2 = new RaisePlanBean(pId2, pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
		rPBean2.setRaiseBean(rBean);

		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
		rpBeans.add(rPBean1);
		rpBeans.add(rPBean2);

		rBean.setRaisePlanBeanSet(rpBeans);
		rService.update(rBean);
		redirectToRaiseIndex(model);
		return "redirect: raiseindex";
	}

	// 於審核頁面按下送出並導回首頁
	@RequestMapping(path = "/raisereview.controller", method = RequestMethod.POST)
	public String processReview(@RequestParam("rComment") String rComment, @RequestParam("rID") int id, Model model) {
		rService.updateStatus(id, rComment);
		redirectToRaiseIndex(model);
		return "redirect: raiseindex";
	}
	
	//於首頁依照關鍵字搜尋
	@RequestMapping(path = "/raiseindexsearch.controller", method = RequestMethod.POST)
	public String processSearch(@RequestParam("keyword") String key, Model model) {
	    List<RaiseBean> rlist = rService.searchByKey(key);
	    model.addAttribute("raiseList", rlist);
	    return "redirect: raiseindex";
	}
}
