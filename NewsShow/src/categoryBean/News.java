package categoryBean;

public class News {


	private String title;
	private String link;
	private String content;
	private String date;
	private int count;
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//构造方法
	public News(String title, String link, String content, String date) {
		super();
		this.title = title;
		this.link = link;
		this.content = content;
		this.date=date;
	
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
