package tw.designerfamily.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NewsBeanService implements INewsService {

	@Autowired
	private INewsDao nDao;
	

	@Override
	public void insert(NewsBean nBean) {
		Timestamp newsDate = new Timestamp(System.currentTimeMillis());
		nBean.setNewsDate(newsDate);
		nDao.insert(nBean);		
	}

	@Override
	public List<NewsBean> selectAll() {
		return nDao.selectAll();
	}

	@Override
	public NewsBean selectById(int id) {
		return nDao.selectById(id);
	}

	@Override
	public void update(NewsBean nBean) {
		Timestamp newsDate = new Timestamp(System.currentTimeMillis());
		nBean.setNewsDate(newsDate);
		nDao.update(nBean);		
	}

	@Override
	public void deleteById(int id) {
		nDao.deleteById(id);		
	}
	
	//關鍵字查詢(標題、副標題、活動內容)
	@Override
	public List<NewsBean> searchByKey(String key){
		return nDao.searchByKey(key);
	}
	
	
	
}
