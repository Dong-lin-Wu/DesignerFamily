package tw.designerfamily.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity @Table(name = "news")
public class NewsBean implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id	@Column(name = "NEWSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int NewsId;
	
	@Column(name = "NEWSTYPE")
	private String NewsType;
	
	@Column(name = "NEWSTITLE")
	private String NewsTitle;
	
	@Column(name = "NEWSSUBTITLE")
	private String NewsSubtitle;
	
	@Column(name = "NEWSDATE")
	private Timestamp NewsDate;
	
	@Column(name = "NEWSCONTENT")
	private String NewsContent;
	
	@Column(name = "NEWSIMAGEPATH")
	private String NewsImagePath;
	
	@Column(name = "NEWSNOTE")
	private String NewsNote;

	
	public NewsBean() {
		
	}

	//新增用
	public NewsBean(String newsType, String newsTitle, String newsSubtitle, Timestamp newsDate,
			String newsContent,  String newsNote) {		
		this.NewsType = newsType;
		this.NewsTitle = newsTitle;
		this.NewsSubtitle = newsSubtitle;
		this.NewsDate = newsDate;
		this.NewsContent = newsContent;
//		this.NewsImagePath = newsImagePath;
		this.NewsNote = newsNote;
	}
	//修改用
	public NewsBean(int NewsId,String newsType, String newsTitle, String newsSubtitle, Timestamp newsDate,
			String newsContent,  String newsNote) {
		this.NewsId = NewsId;
		this.NewsType = newsType;
		this.NewsTitle = newsTitle;
		this.NewsSubtitle = newsSubtitle;
		this.NewsDate = newsDate;
		this.NewsContent = newsContent;
//		this.NewsImagePath = newsImagePath;
		this.NewsNote = newsNote;
	}
	
	
	public int getNewsId() {
		return NewsId;
	}



	public void setNewsId(int newsId) {
		this.NewsId = newsId;
	}



	public String getNewsType() {
		return NewsType;
	}



	public void setNewsType(String newsType) {
		this.NewsType = newsType;
	}



	public String getNewsTitle() {
		return NewsTitle;
	}



	public void setNewsTitle(String newsTitle) {
		this.NewsTitle = newsTitle;
	}



	public String getNewsSubtitle() {
		return NewsSubtitle;
	}



	public void setNewsSubtitle(String newsSubtitle) {
		this.NewsSubtitle = newsSubtitle;
	}



	public Timestamp getNewsDate() {
		return NewsDate;
	}



	public void setNewsDate(Timestamp newsDate) {
		this.NewsDate = newsDate;
	}



	public String getNewsContent() {
		return NewsContent;
	}



	public void setNewsContent(String newsContent) {
		this.NewsContent = newsContent;
	}



	public String getNewsImagePath() {
		return NewsImagePath;
	}



	public void setNewsImagePath(String newsImagePath) {
		this.NewsImagePath = newsImagePath;
	}



	public String getNewsNote() {
		return NewsNote;
	}



	public void setNewsNote(String newsNote) {
		this.NewsNote = newsNote;
	}
	
	
	
}



