package tw.designerfamily.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "news") @Component
public class NewsBean implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id	@Column(name = "NEWSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int newsId;
	
	@Column(name = "NEWSTYPE")
	private String newsType;
	
	@Column(name = "NEWSTITLE")
	private String newsTitle;
	
	@Column(name = "NEWSSUBTITLE")
	private String newsSubtitle;
	
	@Column(name = "NEWSDATE")
	private Timestamp newsDate;
	
	@Column(name = "NEWSCONTENT")
	private String newsContent;
	
	@Column(name = "NEWSPICNAME")
	private String newsPicName;
	
	@Column(name = "NEWSPICBASE64")
	private String newsPicBase64;
	
	@Column(name = "NEWSNOTE")
	private String newsNote;

	
	public NewsBean() {
		
	}

	//新增用
	public NewsBean(String newsType, String newsTitle, String newsSubtitle, Timestamp newsDate,
			String newsContent, String newsPicName, String newsPicBase64, String newsNote) {		
		this.newsType = newsType;
		this.newsTitle = newsTitle;
		this.newsSubtitle = newsSubtitle;
		this.newsDate = newsDate;
		this.newsContent = newsContent;
		this.newsPicName = newsPicName;
		this.newsPicBase64 = newsPicBase64;
		this.newsNote = newsNote;
	}
	//修改用
	public NewsBean(int NewsId,String newsType, String newsTitle, String newsSubtitle, Timestamp newsDate,
			String newsContent, String newsPicName, String newsPicBase64, String newsNote) {
		this.newsId = NewsId;
		this.newsType = newsType;
		this.newsTitle = newsTitle;
		this.newsSubtitle = newsSubtitle;
		this.newsDate = newsDate;
		this.newsContent = newsContent;
		this.newsPicName = newsPicName;
		this.newsPicBase64 = newsPicBase64;
		this.newsNote = newsNote;
	}
	
	
	public int getNewsId() {
		return newsId;
	}



	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}



	public String getNewsType() {
		return newsType;
	}



	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}



	public String getNewsTitle() {
		return newsTitle;
	}



	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}



	public String getNewsSubtitle() {
		return newsSubtitle;
	}



	public void setNewsSubtitle(String newsSubtitle) {
		this.newsSubtitle = newsSubtitle;
	}



	public Timestamp getNewsDate() {
		return newsDate;
	}



	public void setNewsDate(Timestamp newsDate) {
		this.newsDate = newsDate;
	}



	public String getNewsContent() {
		return newsContent;
	}



	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	

	public String getNewsPicName() {
		return newsPicName;
	}

	
	public void setNewsPicName(String newsPicName) {
		this.newsPicName = newsPicName;
	}

	
	public String getNewsPicBase64() {
		return newsPicBase64;
	}

	
	public void setNewsPicBase64(String newsPicBase64) {
		this.newsPicBase64 = newsPicBase64;
	}

	
	public String getNewsNote() {
		return newsNote;
	}


	public void setNewsNote(String newsNote) {
		this.newsNote = newsNote;
	}
	
	
	
}



